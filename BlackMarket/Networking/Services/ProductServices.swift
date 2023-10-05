//
//  ProductsService.swift
//  BlackMarket
//
//  Created by Santiago Andracchi on 28/09/2023.
//

import Foundation

internal class ProductServices: ProductServicesProtocol {
  
  private let apiClient: RSApiClient
  
  enum ProductError: Error {
    case noProductsFound
    case noPictureFound
  }
  
  init(
    apiClient: RSApiClient = RSApiClient.shared
  ) {
    self.apiClient = apiClient
  }
  
  func getProducts(
    page: Int,
    pageSize: Int,
    search: String?
  ) async -> Result<PagedResponse<[Product]>, RSAPIError> {
    let response: RSRequestResponse<PagedResponse<[Product]>> = await apiClient.request(
      endpoint: ProductEndpoint.getProducts(
        page: page,
        pageSize: pageSize,
        search: search)
    )
    switch response.result {
    case .success(let productList):
      guard let ticketList = productList else {
        return .failure(RSAPIError(ProductError.noProductsFound))
      }
      return .success(ticketList)
    case .failure(let error):
      return .failure(error)
    }
  }
}

protocol ProductServicesProtocol {
  
  func getProducts(
    page: Int,
    pageSize: Int,
    search: String?
  ) async -> Result<PagedResponse<[Product]>, RSAPIError>
  
}
