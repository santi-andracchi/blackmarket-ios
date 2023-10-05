//
//  HeaderView.swift
//  BlackMarket
//
//  Created by Santiago Andracchi on 26/09/2023.
//

import SwiftUI

struct HeaderView: View {
  
  var body: some View {
    VStack {
      HStack {
        Spacer()
        Image(ImageNames.blackmarketLogo)
        Image(ImageNames.blackmarketHeader)
        Spacer()

      }
      .frame(height: 56)
    }
    .background(Color.black)
  }
}

struct HeaderView_Previews: PreviewProvider {
  static var previews: some View {
    HeaderView()
  }
}
