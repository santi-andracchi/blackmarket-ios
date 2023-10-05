//
//  PromoShipments.swift
//  BlackMarket
//
//  Created by Santiago Andracchi on 22/09/2023.
//

import SwiftUI

struct PromoShipmentsView: View {
  var body: some View {
    HStack(alignment: .center) {
      VStack(alignment: .leading) {
        Text(LocalizedString.PromoShipments.title)
          .font(.system(size: 14))
          .foregroundColor(.white)
          .bold()
          .padding(EdgeInsets(top: 0, leading: 0, bottom: 4, trailing: 0))
        Text(LocalizedString.PromoShipments.subtitle)
          .multilineTextAlignment(.leading)
          .foregroundColor(.white)
          .font(.system(size: 14))
      }
      .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 0))
      .background(.black)
      Image(ImageNames.blackmarketFedex).background(.black)
    }
    .background(.black)
    .cornerRadius(8)
    .padding(.vertical, 26)
    .padding(.horizontal, 23)
  }
}

private extension LocalizedString {
  enum PromoShipments {
    static let title = "dashboard_promo_shipments_title".localized
    static let subtitle = "dashboard_promo_shipments_subtitle".localized
  }
}

struct PromoShipmentsView_Previews: PreviewProvider {
  static var previews: some View {
    PromoShipmentsView()
  }
}
