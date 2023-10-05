//
//  PagedResponse.swift
//  BlackMarket
//
//  Created by Santiago Andracchi on 28/09/2023.
//

import Foundation

struct PagedResponse<T: Decodable>: Decodable {
  let results: T
  let count: Int
}
