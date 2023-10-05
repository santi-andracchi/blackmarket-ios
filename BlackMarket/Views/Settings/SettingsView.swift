//
//  Settings.swift
//  BlackMarket
//
//  Created by Santiago Andracchi on 26/09/2023.
//

import SwiftUI

struct SettingsView: View {
  var body: some View {
    VStack(alignment: .leading) {
      Spacer().frame(height: 1)
      HeaderView()
      HStack(alignment: .top) {
        Text(LocalizedString.Settings.title).multilineTextAlignment(.leading)
          .padding(.leading, 16)
          .padding(.top, 16)
        Spacer()
      }
      Spacer()
    }
  }
}

private extension LocalizedString {
  enum Settings {
    static let title = "settings_title".localized
  }
}

struct Settings_Previews: PreviewProvider {
  static var previews: some View {
    SettingsView()
  }
}
