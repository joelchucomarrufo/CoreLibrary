//
//  SessionManager.swift
//  CoreLibrary
//
//  Created by Joel Martin Chuco Marrufo on 8/02/25.
//

import Foundation

class SessionManager: Codable {
    
    static var shared = SessionManager()
    private static let  sessionTime: Double? = 300.0
    var baseURL: String?
        
    private init() {
        baseURL = Bundle.main.object(forInfoDictionaryKey: "BaseURL") as? String
    }
}
