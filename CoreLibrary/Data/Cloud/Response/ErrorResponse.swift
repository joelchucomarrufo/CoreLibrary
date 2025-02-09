//
//  ErrorResponse.swift
//  CoreLibrary
//
//  Created by Joel Martin Chuco Marrufo on 8/02/25.
//

import Foundation

struct ErrorResponse : Decodable {
    let status: String
    let error: ErrorModel
}

struct ErrorModel : Decodable {
    let message: String
    let code: String
}
