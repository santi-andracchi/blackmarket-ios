//
//  ViewHelpers.swift
//  BlackMarket
//
//  Created by Santiago Andracchi on 19/09/2023.
//

import Foundation
import SwiftUI

public struct PlaceholderStyle: ViewModifier {

    var showPlaceHolder: Bool
    var placeholder: String

    public func body(content: Content) -> some View {
        ZStack(alignment: .leading) {
            if showPlaceHolder {
                Text(placeholder)
                .padding(.horizontal, 15)
            }
            content
            .foregroundColor(Color.white)
            .padding(5.0)
        }
    }
}
