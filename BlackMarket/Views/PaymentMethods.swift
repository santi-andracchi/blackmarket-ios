//
//  PaymentMethods.swift
//  BlackMarket
//
//  Created by Santiago Andracchi on 22/09/2023.
//

import SwiftUI

struct PaymentMethods: View {
    var body: some View {
      VStack(alignment: .center) {
        Text("Payment methods")
          .bold()
        HStack(alignment: .top) {
          VStack {
            Image("blackmarket_credit_card")
            Text("Credit")
              .padding(.top, 14)
          }
          Image("blackmarket_line")
            .padding(EdgeInsets(top: 0, leading:22, bottom: 0, trailing:22))
          VStack(alignment: .center) {
            Image("blackmarket_paypal")
            Text("Paypal")
              .padding(.top, 11)
          }
          Image("blackmarket_line")
            .padding(EdgeInsets(top: 0, leading:22, bottom: 0, trailing:22))
          VStack(alignment: .center) {
            Image("blackmarket_crypto")
            Text("Crypto")
              .padding(.top, 12)
          }
        }.padding(.top, 41)
      }.padding(.top, 30)
        .padding(.bottom, 45)
    }
}

struct PaymentMethods_Previews: PreviewProvider {
    static var previews: some View {
        PaymentMethods()
    }
}
