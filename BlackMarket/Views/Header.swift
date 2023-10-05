//
//  Header.swift
//  BlackMarket
//
//  Created by Santiago Andracchi on 22/09/2023.
//

import SwiftUI

struct Header: View {
  
  var body: some View {
    VStack {
      HStack {
        Spacer()
        Image("blackmarket_logo")
        Image("blackmarket_header")
        Spacer()
      }.frame(height: 56)
    }.background(Color.black)
  }
}

struct Header_Previews: PreviewProvider {
  static var previews: some View {
    Header()
  }
}

