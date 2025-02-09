//
//  RecipesInteractor.swift
//  CoreLibrary
//
//  Created by Joel Martin Chuco Marrufo on 8/02/25.
//

import Foundation
import Combine

@available(iOS 13.0, macOS 10.15, *)
protocol RecipesInteractorInputProtocol: BaseInteractorInputProtocol {
    
    func requestRecipes()
    
}

@available(iOS 13.0, macOS 10.15, *)
class RecipesInteractor: BaseInteractor {
    
    var cancellable: Set<AnyCancellable> = []
    weak var presenter: RecipesInteractorOutputProtocol? {return super.basePresenter as? RecipesInteractorOutputProtocol}
    var recipesProvider: RecipesProviderProtocol?
    
}

@available(iOS 13.0, macOS 10.15, *)
extension RecipesInteractor: RecipesInteractorInputProtocol {
    
    func requestRecipes() {
        
        let request = RecipesRequest()
        
        self.recipesProvider?.requestRecipes(request: request)
            .sink {[weak self] completion in
                guard self != nil else { return }
                switch completion {
                case .finished: break
                case .failure(let error):
                    if case let NetworkingError.custom(message) = error {
                        self?.presenter?.error(message: message)
                    } else {
                        self?.presenter?.error(message: error.localizedDescription)
                    }
                }
            } receiveValue: { [weak self] response in
                guard self != nil else { return }
                self?.presenter?.success(recipes: response.recipes)
            }.store(in: &self.cancellable)
    }
    
}
