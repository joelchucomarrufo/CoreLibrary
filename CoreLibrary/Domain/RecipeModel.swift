//
//  RecipeModel.swift
//  CoreLibrary
//
//  Created by Joel Martin Chuco Marrufo on 8/02/25.
//

import Foundation

public struct RecipeModel: Identifiable, Equatable {
    
    public var id = UUID()
    var title: String
    var ingredientes: [String]
    var preparacion: [String]
    var image: String
    var latitude: String
    var longitude: String
    
    public init() {
        self.title = ""
        self.ingredientes = []
        self.preparacion = []
        self.image = ""
        self.latitude = ""
        self.longitude = ""
    }
    
    public init(title: String, ingredientes: [String], preparacion: [String], image: String, latitude: String, longitude: String) {
        self.title = title
        self.ingredientes = ingredientes
        self.preparacion = preparacion
        self.image = image
        self.latitude = latitude
        self.longitude = longitude
    }
}
