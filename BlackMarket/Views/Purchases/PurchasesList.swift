//
//  PurchasesList.swift
//  BlackMarket
//
//  Created by Santiago Andracchi on 26/09/2023.
//

import SwiftUI

struct PurchasesList: View {
  var body: some View {
    VStack(alignment: .leading) {
      Spacer().frame(height: 1)
      Header()
      HStack(alignment: .top) {
        Text(LocalizedString.PurchasesList.title).multilineTextAlignment(.leading)
          .padding(.leading, 16)
          .padding(.top, 16)
        Spacer()
      }
      Spacer()
    }
  }
}

private extension LocalizedString {
  enum PurchasesList {
    static let title = "purchases_title".localized
  }
}

struct PurchasesList_Previews: PreviewProvider {
  static var previews: some View {
    PurchasesList()
  }
}
