//
//  PaymentMethods.swift
//  BlackMarket
//
//  Created by Santiago Andracchi on 22/09/2023.
//

import SwiftUI

struct PaymentMethodsView: View {
  var body: some View {
    VStack(alignment: .center) {
      Text(LocalizedString.PaymentMethods.title)
        .bold()
      HStack(alignment: .top) {
        VStack {
          Image("blackmarket_credit_card")
          Text(LocalizedString.PaymentMethods.credit)
            .padding(.top, 14)
        }
        Image("blackmarket_line")
          .padding(.vertical, 0)
          .padding(.horizontal, 22)
        VStack(alignment: .center) {
          Image("blackmarket_paypal")
          Text(LocalizedString.PaymentMethods.paypal)
            .padding(.top, 11)
        }
        Image("blackmarket_line")
          .padding(.vertical, 0)
          .padding(.horizontal, 22)
        VStack(alignment: .center) {
          Image("blackmarket_crypto")
          Text(LocalizedString.PaymentMethods.crypto)
            .padding(.top, 12)
        }
      }.padding(.top, 41)
    }
    .padding(.top, 30)
    .padding(.bottom, 45)
  }
}

private extension LocalizedString {
  enum PaymentMethods {
    static let title = "dashboard_payment_title".localized
    static let credit = "dashboard_payment_credit_label".localized
    static let paypal = "dashboard_payment_paypal_label".localized
    static let crypto = "dashboard_payment_crypto_label".localized
  }
}

struct PaymentMethodsView_Previews: PreviewProvider {
  static var previews: some View {
    PaymentMethodsView()
  }
}
