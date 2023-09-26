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
        HeaderView()
        SearchProductsView()
        ProductListView(items: modelData.products)
        PromoDiscountView().background(Color.lightGray)
        PaymentMethodsView()
        PromoShipmentsView().background(Color.lightGray)
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
