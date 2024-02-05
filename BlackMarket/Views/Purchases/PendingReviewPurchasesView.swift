//
//  PendingReviewPurchases.swift
//  BlackMarket
//
//  Created by Santiago Andracchi on 04/02/2024.
//

import SwiftUI
import Foundation

struct PendingReviewPurchasesView: View {
  static let tag = "PendingReviewPurchasesView"
  @Binding var path: NavigationPath
  
  var body: some View {
    VStack {
      Text(LocalizedString.PendingReviewPurchases.title)
        .font(.system(size: 20, weight: .black))
        .padding(.top, 20)
      Spacer()
      Text(LocalizedString.PendingReviewPurchases.pending_review_purchases_dummy_hint)
        .padding(.bottom, 40)
      Button(action: {
        path.append(PurchaseDetail(name: "DummyPurchase"))
      }) {
        Text(LocalizedString.PendingReviewPurchases.purchase_detail_dummy_button_text)
      }.padding(40)
      Spacer()
    }.padding()
  }
}

private extension LocalizedString {
  enum PendingReviewPurchases {
    static let title = "pending_review_purchases_title".localized
    static let pending_review_purchases_dummy_hint = "pending_review_purchases_dummy_hint".localized
    static let purchase_detail_dummy_button_text = "purchase_detail_dummy_button_text".localized
  }
}
