//
//  PromoDiscount.swift
//  BlackMarket
//
//  Created by Santiago Andracchi on 22/09/2023.
//

import SwiftUI

struct PromoDiscount: View {
    var body: some View {
      HStack(alignment: .center) {
        Image("blackmarket_sofa")
        VStack(alignment: .leading) {
          Text("Check out our new and restored furniture")
            .font(.system(size: 14))
            .foregroundColor(.white)
            .bold()
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 4, trailing: 0))
          Text("Shop today and get a 10% discount")
            .multilineTextAlignment(.leading)
            .foregroundColor(.white)
            .font(.system(size: 14))
        }
        .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 16))
        .background(.black)
      }.background(.black)
        .cornerRadius(8)
        .padding(EdgeInsets(top: 0, leading: 18, bottom: 30, trailing: 18))
    }
}

struct PromoDiscount_Previews: PreviewProvider {
    static var previews: some View {
        PromoDiscount()
    }
}
