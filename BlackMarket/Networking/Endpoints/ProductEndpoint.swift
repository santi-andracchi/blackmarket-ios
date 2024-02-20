//
//  ProductsEndpoint.swift
//  BlackMarket
//
//  Created by Santiago Andracchi on 28/09/2023.
//

import Foundation
import RSSwiftNetworking

internal enum ProductEndpoint: RailsAPIEndpoint {
  
  case getProducts(
    page: Int,
    pageSize: Int,
    search: String?
  )
  
  case getFavorites
  
  private static let productsURL = "api/products"
  private static let favoriteURL = ProductEndpoint.productsURL + "/favorites"
  
  var path: String {
    switch self {
    case .getProducts:
      return ProductEndpoint.productsURL
    case .getFavorites:
      return ProductEndpoint.favoriteURL
    }
  }
  
  var method: Network.HTTPMethod {
    switch self {
    case .getProducts, .getFavorites:
      return .get
    }
  }
  
  var parameters: [String : Any] {
    switch self {
    case .getProducts(let page, let pageSize, let search):
      return [
        "page": page,
        "page_size": pageSize,
        "search": search ?? ""
      ]
    default:
      return [:]
    }
  }
  
  var headers: [String : String] {
    return [
      HTTPHeader.accept.rawValue: "*/*",
      HTTPHeader.contentType.rawValue: "application/json",
      // TODO: Use session manager properly after login
//      "Cookie" : "black-market-app-auth=; black-market-refresh-token=; csrftoken=; sessionid=;"
    ]
  }
  
  var parameterEncoding: ParameterEncoding {
    switch self {
    case .getFavorites, .getProducts:
      return .urlQuery
    default:
      return .httpBody(.json)
    }
  }
}
