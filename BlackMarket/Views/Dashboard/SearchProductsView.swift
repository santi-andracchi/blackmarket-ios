//
//  SearchProductsView.swift
//  BlackMarket
//
//  Created by Santiago Andracchi on 26/09/2023.
//

import SwiftUI

struct SearchProductsView: View {
  @State private var productName = ""
  
  var body: some View {
    VStack {
      TextField("", text: $productName, prompt: Text(LocalizedString.SearchProducts.label))
        .frame(height: 40)
        .textFieldStyle(PlainTextFieldStyle())
        .padding(.horizontal, 16)
        .cornerRadius(16)
        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray))
    }
    .padding(.horizontal, 16)
  }
}

private extension LocalizedString {
  enum SearchProducts {
    static let label = "dashboard_search_products".localized
  }
}
