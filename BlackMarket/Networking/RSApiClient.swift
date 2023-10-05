//
//  RSApiClient.swift
//  rs-admin-ios
//
//  Created by Tarek Radovan on 23/01/2023.
//

import Foundation
import RSSwiftNetworking
import UIKit

typealias RSCompletionCallback<T: Decodable> = (
  _ result: Result<T?, RSAPIError>,
  _ responseHeaders: [AnyHashable: Any]
) -> Void

public final class RSApiClient {
  
  private let emptyDataStatusCodes: Set<Int> = [204, 205]
  private let errorStatusCodes: ClosedRange<Int> = 400...499
  
  public private(set) var encodingConfiguration: EncodingConfiguration = .default
  
  public private(set) var decodingConfiguration: DecodingConfiguration = .default
  
  private(set) var headersProvider: HeadersProvider = [:]
  
  private let networkProvider: RSNetworkProvider
  
  public required init(networkProvider: RSNetworkProvider) {
    self.networkProvider = networkProvider
  }
  
  public convenience init(
    networkProvider: RSNetworkProvider,
    headersProvider: HeadersProvider,
    encodingConfiguration: EncodingConfiguration = .default,
    decodingConfiguration: DecodingConfiguration = .default
  ) {
    self.init(networkProvider: networkProvider)
    self.encodingConfiguration = encodingConfiguration
    self.decodingConfiguration = decodingConfiguration
    self.headersProvider = headersProvider
  }
  
  @discardableResult
  func request<T: Decodable>(
    endpoint: Endpoint,
    completion: @escaping RSCompletionCallback<T>
  ) -> Cancellable {
    networkProvider.request(
      endpoint: buildAPIEndpoint(from: endpoint)
    ) { [weak self] result in
      guard let self = self else { return }
      
      self.handle(result, for: endpoint, completion: completion)
    }
  }
  
  @discardableResult
  func requestData(endpoint: Endpoint) async -> Result<Data, RSAPIError> {
    await withCheckedContinuation { continuation in
      self.requestData(endpoint: endpoint) { result in
        continuation.resume(returning: result)
      }
    }
  }
  
  @discardableResult
  func requestData(
    endpoint: Endpoint,
    completion: @escaping (Result<Data, RSAPIError>) -> Void
  ) -> Cancellable {
    networkProvider.request(
      endpoint: buildAPIEndpoint(from: endpoint)
    ) { result in
      if case .success(let response) = result {
        if let data = response.data {
          completion(.success(data))
        }
      }
    }
  }
  
  private func handle<T: Decodable>(
    _ result: Result<Network.Response, RSAPIError>,
    for endpoint: Endpoint,
    completion: RSCompletionCallback<T>
  ) {
    switch result {
    case .success(let response):
      handle(response, with: endpoint.decodingConfiguration, completion: completion)
    case .failure(let error):
      completion(.failure(error), [:])
    }
  }
  
  private func buildAPIEndpoint(from endpoint: Endpoint) -> APIEndpoint {
    APIEndpoint(endpoint: endpoint, headersProvider: headersProvider)
  }
  
  private func handle<T: Decodable>(
    _ response: Network.Response,
    with configuration: DecodingConfiguration?,
    completion: RSCompletionCallback<T>
  ) {
    do {
      
      guard
        !errorStatusCodes.contains(response.statusCode)
      else {
        if let data = response.data {
          let error = try JSONDecoder().decode(RSAPIError.self, from: data)
          if error.message == Network.StatusCode.unauthorizedIdentifier {
            SessionManager.shared.deleteSession()
            return
          } else {
            throw error
          }
        }
        return
      }
      
      guard let data = response.data, !data.isEmpty else {
        guard emptyDataStatusCodes.contains(response.statusCode) else {
          throw APIClientError.invalidEmptyResponse
        }
        
        return completion(.success(.none), response.headers)
      }
      
      completion(.success(try decode(data, with: configuration)), response.headers)
    } catch let error {
      completion(
        .failure(handleCustomAPIError(from: response) ?? RSAPIError(error)),
        response.headers
      )
    }
  }
  
  private func decode<M: Decodable>(
    _ data: Data,
    with configuration: DecodingConfiguration?
  ) throws -> M {
    let decoder = JSONDecoder(decodingConfig: configuration ?? decodingConfiguration)
    return try decoder.decode(M.self, from: data)
  }
  
  private func handleCustomAPIError(from response: Network.Response) -> RSAPIError? {
    guard let data = response.data else { return nil }
    do {
      let errorModel = try JSONDecoder().decode(RSAPIError.self, from: data)
      return errorModel
    } catch {
      return nil
    }
  }
}

extension Network.StatusCode {
  static let unauthorizedIdentifier = "Unauthorized"
}
