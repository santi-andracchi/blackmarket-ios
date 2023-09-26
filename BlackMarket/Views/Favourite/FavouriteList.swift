//
//  Favorite.swift
//  BlackMarket
//
//  Created by Santiago Andracchi on 25/09/2023.
//

import SwiftUI

struct FavouriteList: View {
  var body: some View {
    VStack(alignment: .leading) {
      Spacer().frame(height: 1)
      HeaderView()
      HStack(alignment: .top) {
        Text(LocalizedString.FavouriteList.title).multilineTextAlignment(.leading)
          .padding(.leading, 16)
          .padding(.top, 16)
        Spacer()
      }
      Spacer()
    }
  }
}

private extension LocalizedString {
  enum FavouriteList {
    static let title = "favourite_title".localized
  }
}

struct FavouriteList_Previews: PreviewProvider {
  static var previews: some View {
    FavouriteList()
  }
}
