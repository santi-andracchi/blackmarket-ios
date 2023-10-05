//
//  TabbedItems.swift
//  BlackMarket
//
//  Created by Santiago Andracchi on 26/09/2023.
//

enum TabbedItem: Int, CaseIterable {
  case dashboard = 0
  case purchases
  case shoppingCart
  case favorite
  case settings
  
  var iconName: String{
    switch self {
    case .dashboard:
      return "dashboard"
    case .purchases:
      return "purchase"
    case .shoppingCart:
      return "shopping_cart"
    case .favorite:
      return "favourite"
    case .settings:
      return "settings"
    }
  }
}
