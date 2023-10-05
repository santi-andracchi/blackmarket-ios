//
//  RSNetworkProvider.swift
//  rs-admin-ios
//
//  Created by Lucas Miotti on 31/01/2023.
//

import Foundation
import RSSwiftNetworking
import Alamofire

// TODO: This will be removed when AlamofireNetworkProvider is open to extend
/// This should be the only place where the `Alamofire` dependency is imported
public final class RSNetworkProvider {
  
  func request(
    endpoint: Endpoint,
    completion: @escaping (Result<Network.Response, RSAPIError>) -> Void
  ) -> Cancellable {
    let headers = HTTPHeaders(endpoint.headers)
    
    return AF.request(
      endpoint.requestURL,
      method: endpoint.method.alamofireMethod,
      parameters: endpoint.parameters,
      encoding: endpoint.parameterEncoding.alamofireEncoding,
      headers: headers
    )
    .response { [weak self] afResponse in
      switch afResponse.result {
      case.success:
        self?.handleAlamofireResponse(afResponse, completion: completion)
      case .failure(let error):
        completion(.failure(RSAPIError(error)))
      }
    }
  }
  
  private func handleAlamofireResponse(
    _ afResponse: AFDataResponse<Data?>,
    completion: @escaping (Result<Network.Response, RSAPIError>) -> Void
  ) {
    guard let response = afResponse.response else {
      completion(.failure(RSAPIError(Network.ProviderError.noResponse)))
      return
    }
    
    completion(.success(Network.Response(
      statusCode: response.statusCode,
      data: afResponse.data,
      headers: response.headers.dictionary
    )))
  }
}

extension Network.HTTPMethod {
  var alamofireMethod: Alamofire.HTTPMethod {
    switch self {
    case .get:
      return .get
    case .post:
      return .post
    case .put:
      return .put
    case .delete:
      return .delete
    case .patch:
      return .patch
    }
  }
}

fileprivate extension RSSwiftNetworking.ParameterEncoding {
  var alamofireEncoding: Alamofire.ParameterEncoding {
    switch self {
    case .httpBody(let format):
      if format == .json {
        return JSONEncoding.default
      }
      return URLEncoding(destination: .httpBody)
    case .urlQuery:
      return URLEncoding(destination: .queryString)
    }
  }
}
