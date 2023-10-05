//
//  BlackMarketApp.swift
//  BlackMarket
//
//  Created by Santiago Andracchi on 18/09/2023.
//

import SwiftUI

@main
struct BlackMarketApp: App {
  @StateObject private var modelData = ModelData()
  
  var body: some Scene {
    WindowGroup {
      ContentView().environmentObject(modelData)
    }
  }
}
