//
//  RSApiClient+Extension.swift
//  BlackMarket
//
//  Created by Santiago Andracchi on 27/09/2023.
//

import Foundation
import RSSwiftNetworking
import RSSwiftNetworkingAlamofire

extension RSApiClient {
  static let shared = RSApiClient(
    networkProvider: RSNetworkProvider()
  )
}
