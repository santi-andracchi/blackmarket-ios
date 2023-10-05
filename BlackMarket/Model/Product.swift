//
//  Product.swift
//  BlackMarket
//
//  Created by Santiago Andracchi on 20/09/2023.
//

import Foundation

struct Product: Hashable, Codable, Identifiable {
  var id: Int
  var productPicture: String
  var isFavorite: Bool
  var unitPrice: String
  var state: String
  var name: String
  
  enum CodingKeys: String, CodingKey {
    case id
    case productPicture = "product_picture"
    case isFavorite = "is_favorite"
    case unitPrice = "unit_price"
    case state
    case name
  }
}
