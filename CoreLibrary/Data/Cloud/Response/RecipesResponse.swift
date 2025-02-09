//
//  RecipesResponse.swift
//  CoreLibrary
//
//  Created by Joel Martin Chuco Marrufo on 8/02/25.
//

import Foundation

struct RecipesResponse: Codable {
    
    var recipes: [RecipeResponse]
        
}

struct RecipeResponse: Codable {
    
    var title: String?
    var ingredientes: [String]?
    var preparacion: [String]?
    var image: String?
    var latitude: String?
    var longitude: String?
        
}
