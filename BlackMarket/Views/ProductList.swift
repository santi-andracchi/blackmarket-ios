//
//  ProductList.swift
//  BlackMarket
//
//  Created by Santiago Andracchi on 22/09/2023.
//

import SwiftUI

struct ProductList: View {
  
  var items: [Product]
  
  var body: some View {
    VStack(alignment: .center) {
      ScrollView(.horizontal, showsIndicators: false) {
        HStack(spacing: 8) {
          ForEach(items) { product in
            ProductItem(product: product)
          }
        }
      }.background(Color.dashboardBackground)
      Text("See all")
        .foregroundColor(.blue)
        .bold()
        .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
    }.padding(EdgeInsets(top: 16, leading: 16, bottom: 0, trailing: 16)).background(Color.dashboardBackground)
  }
}

struct ProductList_Previews: PreviewProvider {
  static var products = ModelData().products
  static var previews: some View {
    ProductList(items: Array(products.prefix(4)))
  }
}
