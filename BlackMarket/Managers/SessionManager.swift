//
//  Constaints.swift
//  swiftui-base
//
//  Created by Karen Stoletniy on 06/9/22.
//

import SwiftUI
import Combine

internal final class SessionManager {
  
  var isSessionValidPublisher: AnyPublisher<Bool, Never> {
    currentSessionTokenPublisher
      .filter { _ in self.publishTokenState }
      .map { $0 != nil }
      .eraseToAnyPublisher()
  }
  
  private var currentSessionTokenPublisher: AnyPublisher<String?, Never> {
    userDefaults.publisher(for: \.currentSessionToken).eraseToAnyPublisher()
  }
  
  private var subscriptions = Set<AnyCancellable>()
  
  static let shared = SessionManager()
  
  private let userDefaults: UserDefaults
  private var publishTokenState: Bool = true
  
  init(userDefaults: UserDefaults = .standard) {
    self.userDefaults = userDefaults
  }
  
  private(set) var accessToken: String? {
    get {
      userDefaults.currentSessionToken
    }
    set {
      userDefaults.currentSessionToken = newValue
    }
  }
  
  @MainActor
  func saveSession(withToken token: String?, publishState: Bool = true) {
    self.publishTokenState = publishState
    accessToken = token
  }
  
  func deleteSession(publishState: Bool = true) {
    self.publishTokenState = publishState
    accessToken = nil
  }
  
  func getHeaders() -> [String: String] {
    return [
      "Authorization": "bearer \(accessToken ?? "")",
      "x-platform": "ios"
    ]
  }
}

enum SessionKey {
  static let userAccessToken = "rs-admin-access-token"
}

fileprivate extension UserDefaults {
  
  static let SESSION_KEY = SessionKey.userAccessToken
  
  @objc dynamic var currentSessionToken: String? {
    get {
      if let token = string(forKey: SessionKey.userAccessToken) {
        return token
      }
      return nil
    }
    set {
      set(newValue, forKey: SessionKey.userAccessToken)
    }
  }
}
