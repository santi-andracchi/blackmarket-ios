//
//  PurchaseDetail.swift
//  BlackMarket
//
//  Created by Santiago Andracchi on 04/02/2024.
//

import Foundation
import SwiftUI

struct PurchaseDetail: Identifiable, Hashable {
    let name: String
    var id: String {name}
}
