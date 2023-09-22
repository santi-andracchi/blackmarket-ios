//
//  ContentView.swift
//  BlackMarket
//
//  Created by Santiago Andracchi on 18/09/2023.
//

import SwiftUI

struct ContentView: View {
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

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView().environmentObject(ModelData())
  }
}
