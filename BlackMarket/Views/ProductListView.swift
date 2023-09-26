//
//  ProductList.swift
//  BlackMarket
//
//  Created by Santiago Andracchi on 22/09/2023.
//

import SwiftUI

struct ProductListView: View {
  
  var items: [Product]
  
  var body: some View {
    VStack(alignment: .center) {
      ScrollView(.horizontal, showsIndicators: false) {
        HStack(spacing: 8) {
          ForEach(items) { product in
            ProductItemView(product: product)
          }
        }
      }.background(Color.lightGray)
      Text(LocalizedString.ProductList.label)
        .foregroundColor(.blue)
        .bold()
        .padding(16)
    }
    .padding(16)
    .background(Color.lightGray)
  }
}

private extension LocalizedString {
  enum ProductList {
    static let label = "dashboard_sea_all_link".localized
  }
}

struct ProductListView_Previews: PreviewProvider {
  static var products = ModelData().products
  static var previews: some View {
    ProductListView(items: Array(products.prefix(4)))
  }
}
