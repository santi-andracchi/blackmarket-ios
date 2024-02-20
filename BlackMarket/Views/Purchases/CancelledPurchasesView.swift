//
//  CancelledPurchases.swift
//  BlackMarket
//
//  Created by Santiago Andracchi on 04/02/2024.
//

import Foundation
import SwiftUI

struct CancelledPurchasesView: View {
  static let tag = "CancelledPurchasesView"
  @Binding var path: NavigationPath
  
  var body: some View {
    VStack {
      Text(LocalizedString.CancelledPurchasesView.title)
        .font(.system(size: 20, weight: .black))
        .padding(.top, 20)
      Spacer()
      Text(LocalizedString.CancelledPurchasesView.cancelled_purchases_dummy_hint)
        .padding(.bottom, 40)
      Button(action: {
        path.append(PurchaseDetail(name: "DummyPurchase"))
      }) {
        Text(LocalizedString.CancelledPurchasesView.purchase_detail_dummy_button_text)
      }.padding(40)
      Spacer()
    }.padding()
  }
}

private extension LocalizedString {
  enum CancelledPurchasesView {
    static let title = "cancelled_purchases_title".localized
    static let cancelled_purchases_dummy_hint = "pending_review_purchases_dummy_hint".localized
    static let purchase_detail_dummy_button_text = "purchase_detail_dummy_button_text".localized
  }
}
