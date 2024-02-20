//
//  PurchasesList.swift
//  BlackMarket
//
//  Created by Santiago Andracchi on 26/09/2023.
//

import SwiftUI

struct PurchasesListView: View {
  
  @State var path: NavigationPath = .init()
  
  var body: some View {
    NavigationStack(path: $path.animation(.easeOut)) {
      VStack {
        Text(LocalizedString.PurchasesList.purchases_list_hint)
        Spacer().frame(height: 120)
        Button(action: {
          path.append(PendingReviewPurchasesView.tag)
        }) {
          Text(LocalizedString.PurchasesList.pending_review_purchases_button_text)
        }
        Spacer().frame(height: 10)
        Button(action: {
          path.append(CancelledPurchasesView.tag)
        }) {
          Text(LocalizedString.PurchasesList.cancelled_purchases_button_text)
        }
      }.navigationTitle(LocalizedString.PurchasesList.title)
        .padding(.horizontal, 20)
        .padding(.vertical, 15)
        .navigationDestination(for: String.self) { tag in
          if tag == PendingReviewPurchasesView.tag {
            PendingReviewPurchasesView(path: $path)
          } else if tag == CancelledPurchasesView.tag {
            CancelledPurchasesView(path: $path)
          }
        }
        .navigationDestination(for: PurchaseDetail.self) { purchaseItem in
          PurchaseDetailView(purchaseItem: purchaseItem, path: $path)
        }
    }
  }
}

private extension LocalizedString {
  enum PurchasesList {
    static let title = "purchases_title".localized
    static let cancelled_purchases_button_text = "cancelled_purchases_button_text".localized
    static let pending_review_purchases_button_text = "pending_review_purchases_button_text".localized
    static let purchases_list_hint = "purchases_list_dummy_hint".localized
  }
}

struct PurchasesListView_Previews: PreviewProvider {
  static var previews: some View {
    PurchasesListView()
  }
}
