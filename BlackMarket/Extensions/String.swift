//
//  String.swift
//  BlackMarket
//
//  Created by Santiago Andracchi on 22/09/2023.
//

import Foundation

extension String {
  var isAlphanumericWithNoSpaces: Bool {
    rangeOfCharacter(from: CharacterSet.alphanumerics.inverted) == nil
  }
  
  var hasPunctuationCharacters: Bool {
    rangeOfCharacter(from: CharacterSet.punctuationCharacters) != nil
  }
  
  var hasNumbers: Bool {
    rangeOfCharacter(from: CharacterSet(charactersIn: "0123456789")) != nil
  }
  
  var withNoSpaces: String {
    filter { !$0.isWhitespace }
  }
  
  var localized: String {
    localize()
  }
  
  func localize(comment: String = "") -> String {
    NSLocalizedString(self, comment: comment)
  }
  
  func localized(_ args: CVarArg...) -> String {
    String(format: localized, arguments: args)
  }
  
  var validFilename: String {
    guard !isEmpty else { return "emptyFilename" }
    return addingPercentEncoding(withAllowedCharacters: .alphanumerics) ?? "emptyFilename"
  }
  
  func base64WithPadding() -> String {
    let module = count % 4
    if module == 0 {
      return self
    } else {
      // padding with equal
      let newLength = count + (4 - module)
      return padding(toLength: newLength, withPad: "=", startingAt: 0)
    }
  }
  
  var capitalizedSentence: String {
    let firstLetter = prefix(1).capitalized
    let remainingLetters = dropFirst().lowercased()
    return firstLetter + remainingLetters
  }
  
  func removeCharacter(_ character: String) -> String {
    replacingOccurrences(of: character, with: "", options: .literal, range: nil)
  }
}
