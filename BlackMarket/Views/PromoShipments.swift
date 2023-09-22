//
//  PromoShipments.swift
//  BlackMarket
//
//  Created by Santiago Andracchi on 22/09/2023.
//

import SwiftUI

struct PromoShipments: View {
    var body: some View {
      HStack(alignment: .center) {
        VStack(alignment: .leading) {
          Text("We upgraded our shipments many levels up.")
            .font(.system(size: 14))
            .foregroundColor(.white)
            .bold()
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 4, trailing: 0))
          Text("Powered by FedEx")
            .multilineTextAlignment(.leading)
            .foregroundColor(.white)
            .font(.system(size: 14))
        }
        .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 0))
        .background(.black)
        Image("blackmarket_fedex").background(.black)
      }.background(.black)
        .cornerRadius(8)
        .padding(EdgeInsets(top: 26, leading: 23, bottom: 26, trailing: 23))
    }
}

struct PromoShipments_Previews: PreviewProvider {
    static var previews: some View {
      PromoShipments()
    }
}
