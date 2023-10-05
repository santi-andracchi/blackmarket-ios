//
//  ShoppingCardList.swift
//  BlackMarket
//
//  Created by Santiago Andracchi on 26/09/2023.
//

import SwiftUI

struct ShoppingCartListView: View {
  var body: some View {
    VStack(alignment: .leading) {
      Spacer().frame(height: 1)
      HeaderView()
      HStack(alignment: .top) {
        Text(LocalizedString.ShoppingCartList.title).multilineTextAlignment(.leading)
          .padding(.leading, 16)
          .padding(.top, 16)
        Spacer()
      }
      Spacer()
    }
  }
}

private extension LocalizedString {
  enum ShoppingCartList {
    static let title = "shopping_cart_title".localized
  }
}


struct ShoppingCartList_Previews: PreviewProvider {
  static var previews: some View {
    ShoppingCartListView()
  }
}
