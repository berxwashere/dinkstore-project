//
//  FakeStoreRequest.swift
//  DinkStore
//
//  Created by HS on 6.11.2022.
//

import Foundation

struct FakeStoreRequest: DataRequest {
    
    var searchText: String
    
    
    var baseURL: String {
        "https://fakestoreapi.com/products"
        
    }
    
    var url: String {
        "/search"
    }
    
    var queryItems: [String : String] {
        ["title": searchText,
         "category" : "jewelery"]
    }
    
    var method: HTTPMethod {
        .get
    }
    
    init(searchText: String = "a") {
        self.searchText = searchText
    }
    
    func decode(_ data: Data) throws -> FakeStoreResponse {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let response = try decoder.decode(FakeStoreResponse.self, from: data)
        return response
    }
}
