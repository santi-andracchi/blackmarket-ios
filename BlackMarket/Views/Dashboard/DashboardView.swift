//
//  Dashboard.swift
//  BlackMarket
//
//  Created by Santiago Andracchi on 25/09/2023.
//

import SwiftUI

struct DashboardView: View {

  @EnvironmentObject var modelData: ModelData
  @ObservedObject private var viewModel: DashboardViewModel
  
  init(viewModel: DashboardViewModel = DashboardViewModel()) {
    self.viewModel = viewModel
  }

  var body: some View {
    VStack {
      ScrollView {
        Spacer().frame(height: 1)
        HeaderView()
        SearchProductsView()
        ProductListView(items: viewModel.productList)
        PromoDiscountView().background(Color.lightGray)
        PaymentMethodsView()
        PromoShipmentsView().background(Color.lightGray)
        Spacer()
      }
    }
  }
}

struct DashboardView_Previews: PreviewProvider {
  static var previews: some View {
    DashboardView().environmentObject(ModelData())
  }
}
