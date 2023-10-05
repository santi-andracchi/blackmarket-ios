//
//  ProductsManager.swift
//  BlackMarket
//
//  Created by Santiago Andracchi on 28/09/2023.
//

import Foundation

final class ProductsManager: ObservableObject {
  
  @Published private(set) var products: [Product] = []
  @Published private(set) var errorMessage: RSAPIError? = nil
  @Published var totalNumberOfProducts: Int = 0
  
  private let service: ProductServicesProtocol
  private let pageSize: Int
  private var currentPage: Int = ProductsPaging.defaultPage
  private var currentSearch: String = ProductsPaging.defaultSearch
  var isLastPage: Bool = false
  
  init(service: ProductServicesProtocol, pageSize: Int) {
    self.service = service
    self.pageSize = pageSize
  }
  
  @MainActor
  func getProducts() async {
    let response = await service.getProducts(
      page: currentPage,
      pageSize: pageSize,
      search: currentSearch
    )
    switch response {
    case .success(let productResponse):
      currentPage += 1
      products.append(contentsOf: productResponse.results)
      isLastPage = productResponse.count == products.count
      totalNumberOfProducts = productResponse.count
    case .failure(let error):
      errorMessage = error
    }
  }
}
