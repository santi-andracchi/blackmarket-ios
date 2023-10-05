//
//  RSRequestResponse.swift
//  BlackMarket
//
//  Created by Santiago Andracchi on 27/09/2023.
//

import RSSwiftNetworking
import Foundation

typealias RSRequestResponse<T: Decodable> = (
  result: Result<T?, RSAPIError>,
  responseHeaders: [AnyHashable: Any]
)

extension RSApiClient {
  
  @discardableResult
  func request<T: Decodable>(endpoint: Endpoint) async -> RSRequestResponse<T> {
    await withCheckedContinuation { continuation in
      self.request(endpoint: endpoint) { result, responseHeaders in
        continuation.resume(returning: (result, responseHeaders))
      }
    }
  }
}
