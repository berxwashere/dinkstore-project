//
//  FakeStoreResponse.swift
//  DinkStore
//
//  Created by HS on 6.11.2022.
//

import Foundation

struct FakeStoreResponse: Decodable {
    let resultCount: Int?
    let results: [FakeStore]?
}
