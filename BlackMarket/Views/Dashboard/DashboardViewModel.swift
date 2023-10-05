//
//  DashboardViewModel.swift
//  BlackMarket
//
//  Created by Santiago Andracchi on 28/09/2023.
//

import Foundation
import Combine
import SwiftUI

final class DashboardViewModel: ObservableObject {
  
  @Published var isLoading: Bool = false
  @Published var productsAlreadyFetched: Bool = false
  @Published var productsManager: ProductsManager
  @Published var productList: [Product] = []
  private var cancelBag = Set<AnyCancellable>()
  
  init(productsManager: ProductsManager = ProductsManager(service: ProductServices(), pageSize: ProductsPaging.dashboardPageSize)) {
    self.productsManager = productsManager
    
    productsManager.$products
      .receive(on: DispatchQueue.main)
      .sink { [weak self] products in
        self?.productList = products
        self?.productsAlreadyFetched = true
      }.store(in: &cancelBag)
    
    fetchData()
  }
  
  @MainActor
  func fetchProducts() {
    isLoading = true
    Task {
      await productsManager.getProducts()
      productsAlreadyFetched = true
      isLoading = false
    }
  }
  
  func fetchData() {
    guard !productsAlreadyFetched else {
      return
    }
    Task {
      await fetchProducts()
    }
  }
}
