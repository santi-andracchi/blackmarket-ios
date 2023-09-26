//
//  Dashboard.swift
//  BlackMarket
//
//  Created by Santiago Andracchi on 25/09/2023.
//

import SwiftUI

struct Dashboard: View {
  @EnvironmentObject var modelData: ModelData
  
  var body: some View {
    VStack {
      ScrollView {
        Spacer().frame(height: 1)
        Header()
        SearchProducts()
        ProductList(items: modelData.products)
        PromoDiscount().background(Color.dashboardBackground)
        PaymentMethods()
        PromoShipments().background(Color.dashboardBackground)
        Spacer()
      }
    }
  }
}

struct Dashboard_Previews: PreviewProvider {
  static var previews: some View {
    Dashboard().environmentObject(ModelData())
  }
}
