//
//  RecipesProvider.swift
//  CoreLibrary
//
//  Created by Joel Martin Chuco Marrufo on 8/02/25.
//

import Foundation
import Combine

@available(iOS 13.0, macOS 10.15, *)
protocol RecipesProviderProtocol {
    
    func requestRecipes<R: NetworkRequest>(request: R) -> AnyPublisher<RecipesResponse,NetworkingError>
    
}

class RecipesProvider {
    
    var networkManager : NetworkManagerProtocol
    
    init(networkManager: NetworkManagerProtocol = NetworkManager()) {
        self.networkManager = networkManager
    }
    
}

@available(iOS 13.0, macOS 10.15, *)
extension RecipesProvider: RecipesProviderProtocol {

    internal func requestRecipes<R>(request: R) -> AnyPublisher<RecipesResponse, NetworkingError> where R:NetworkRequest {
        
        return self.networkManager.requestGeneric(request: request, entity: RecipesResponse.self)
            .map { response in
                return Just(response)
                .setFailureType(to: NetworkingError.self)
                .eraseToAnyPublisher()
            }
            .switchToLatest()
            .eraseToAnyPublisher()
    }

}
