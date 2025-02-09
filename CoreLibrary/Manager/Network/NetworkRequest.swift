//
//  NetworkRequest.swift
//  CoreLibrary
//
//  Created by Joel Martin Chuco Marrufo on 8/02/25.
//

import Foundation

enum HTTPMethods: String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
}


protocol NetworkRequest {
     
    var baseURL: String { get }
    var endpoint: String { get }
    var httpHeaders: [String : String] { get }
    var httpMethod: HTTPMethods { get }
    var queue: DispatchQueue { get }
    
        
}

extension NetworkRequest {
    
    var baseURL: String { SessionManager.shared.baseURL ?? "" }
    var queue: DispatchQueue { DispatchQueue.main }
    
}
