//
//  NetworkingError.swift
//  CoreLibrary
//
//  Created by Joel Martin Chuco Marrufo on 8/02/25.
//

import Foundation

enum NetworkingError: Error {
    case custom(String)
    case httpError(Int)
    case unknown
}
