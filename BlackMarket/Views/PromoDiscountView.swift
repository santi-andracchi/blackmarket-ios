//
//  PromoDiscount.swift
//  BlackMarket
//
//  Created by Santiago Andracchi on 22/09/2023.
//

import SwiftUI

struct PromoDiscountView: View {
  var body: some View {
    HStack(alignment: .center) {
      Image("blackmarket_sofa")
      VStack(alignment: .leading) {
        Text(LocalizedString.PromoDiscount.title)
          .font(.system(size: 14))
          .foregroundColor(.white)
          .bold()
          .padding(EdgeInsets(top: 0, leading: 0, bottom: 4, trailing: 0))
        Text(LocalizedString.PromoDiscount.subtitle)
          .multilineTextAlignment(.leading)
          .foregroundColor(.white)
          .font(.system(size: 14))
      }
      .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 16))
      .background(.black)
    }
    .background(.black)
    .cornerRadius(8)
    .padding(EdgeInsets(top: 0, leading: 18, bottom: 30, trailing: 18))
  }
}

private extension LocalizedString {
  enum PromoDiscount {
    static let title = "dashboard_promo_discount_title".localized
    static let subtitle = "dashboard_promo_discount_subtitle".localized
  }
}

struct PromoDiscountView_Previews: PreviewProvider {
  static var previews: some View {
    PromoDiscountView()
  }
}
