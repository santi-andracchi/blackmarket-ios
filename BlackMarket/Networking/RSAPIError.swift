//
//  RSAPIError.swift
//  BlackMarket
//
//  Created by Santiago Andracchi on 27/09/2023.
//

import RSSwiftNetworking
import Foundation

struct RSAPIError: Codable, Error {
  public let statusCode: Int
  public let message: String?
  public let messages: [String]?
  public let error: String?
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.statusCode = try container.decode(Int.self, forKey: .statusCode)
    if let messages = try? container.decode([String].self, forKey: .message) {
      self.messages = messages
    } else {
      self.messages = nil
    }
    if let message = try? container.decode(String.self, forKey: .message) {
      self.message = message
    } else {
      self.message = nil
    }
    
    self.error = try? container.decode(String.self, forKey: .error)
  }
  
  init(_ error: Error) {
    self.statusCode = error.asAFError?.responseCode ?? 0
    self.message = error.localizedDescription
    self.error = error.localizedDescription
    self.messages = nil
  }
  
  func getMessage() -> String {
    if let message = message {
      return message.capitalizedSentence
    } else if let message = messages?.first {
      return message.capitalizedSentence
    } else {
      return ""
    }
  }
}
