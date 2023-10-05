//
//  ContentView.swift
//  BlackMarket
//
//  Created by Santiago Andracchi on 18/09/2023.
//

import SwiftUI

struct ContentView: View {
  
  var body: some View {
    MainTabbedView()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView().environmentObject(ModelData())
  }
}
