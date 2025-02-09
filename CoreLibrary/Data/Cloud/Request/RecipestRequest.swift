//
//  RecipestRequest.swift
//  CoreLibrary
//
//  Created by Joel Martin Chuco Marrufo on 8/02/25.
//

import Foundation

struct RecipesRequest: NetworkRequest {
        
    var endpoint: String { baseURL + "/api/recetas" }
    var httpHeaders: [String : String]
    var httpMethod: HTTPMethods { .get }
    
    init() {
        self.httpHeaders = [
            "Content-Type":"application/json",
            "Accept":"application/json"
        ]
    }
}
