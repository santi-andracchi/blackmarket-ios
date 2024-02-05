//
//  PurchaseDetail.swift
//  BlackMarket
//
//  Created by Santiago Andracchi on 04/02/2024.
//

import Foundation
import SwiftUI

struct PurchaseDetailView: View {
  let purchaseItem: PurchaseDetail
  @Binding var path: NavigationPath
  
  var body: some View {
    VStack {
      Text(LocalizedString.PurchaseDetailView.title)
        .font(.system(size: 20, weight: .black))
        .padding(.top, 40)
      Spacer()
      Text(LocalizedString.PurchaseDetailView.purchase_detail_dummy_description)
      Spacer()
      Button(action: {
        while path.count > 1 {
          path = NavigationPath()
        }
      }) {
        Text(LocalizedString.PurchaseDetailView.purchase_detail_dummy_back_button_text)
      }.padding(40)
      
      Spacer()
    }.padding()
  }
}

private extension LocalizedString {
  enum PurchaseDetailView {
    static let title = "purchase_detail_dummy_title".localized
    static let purchase_detail_dummy_description = "purchase_detail_dummy_description".localized
    static let purchase_detail_dummy_back_button_text = "purchase_detail_dummy_back_button_text".localized
  }
}
