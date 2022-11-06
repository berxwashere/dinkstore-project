//
//  FakeStore.swift
//  DinkStore
//
//  Created by HS on 6.11.2022.
//

import Foundation

struct FakeStore: Decodable {
    let title: String?
    let category: String?
    let image: URL?
    let price: String?
    
    enum CodingKeys: String, CodingKey {
        case title
        case category
        case image
        case price
    }
}
