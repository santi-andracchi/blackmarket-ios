//
//  ProductItem.swift
//  BlackMarket
//
//  Created by Santiago Andracchi on 22/09/2023.
//

import SwiftUI

struct ProductItemView: View {
  
  var product: Product
  
  var body: some View {
    VStack(alignment: .center) {
      AsyncImage(url: URL(string: product.productPicture)) { image in  // <-- here
        image
          .resizable()
          .frame(width: 136, height: 120)
      } placeholder: {
        ProgressView().progressViewStyle(.circular)
      }
      Spacer().frame(height: 8)
      HStack {
        Text(product.unitPrice).font(.system(size: 14))
        Spacer()
        Image(ImageNames.blackmarketNewTag)
      }.padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
      HStack {
        Text(product.name).font(.system(size: 14))
        Spacer()
        Image(ImageNames.blackmarketFavoriteOff)
      }.padding(EdgeInsets(top: 8, leading: 8, bottom: 0, trailing: 8))
      Spacer().frame(height: 12)
    }
    .frame(width: 145, height: 196)
    .background(.white)
    .cornerRadius(8)
  }
}

struct ProductView_Previews: PreviewProvider {
  static var previews: some View {
    ProductItemView(product: ModelData().products[0])
  }
}
