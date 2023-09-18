//
//  Product.swift
//  BlackMarket
//
//  Created by Santiago Andracchi on 20/09/2023.
//

import Foundation
import SwiftUI

struct Product: Hashable, Codable, Identifiable {
  var id: Int
  var product_picture: String
  var is_favorite: Bool
  var unit_price: String
  var state: String
  var name: String
}
