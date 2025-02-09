//
//  RecipesPresenter.swift
//  CoreLibrary
//
//  Created by Joel Martin Chuco Marrufo on 8/02/25.
//

import Foundation

protocol RecipesPresenterProtocol {
    func requestRecipes()
    var delegate: RecipesPresenterDelegate? { get set }
}

protocol RecipesPresenterDelegate {
    func success(recipes: [RecipeResponse])
    func error(message: String)
}

protocol RecipesInteractorOutputProtocol: BaseInteractorOutputProtocol {
    func success(recipes: [RecipeResponse])
    func error(message: String)
    
}

@available(iOS 13.0, macOS 10.15, *)
class RecipesPresenter: BasePresenter {
    var interactor: RecipesInteractorInputProtocol? { return super.baseInteractor as? RecipesInteractorInputProtocol}
    var delegate: RecipesPresenterDelegate?
}

@available(iOS 13.0, macOS 10.15, *)
extension RecipesPresenter: RecipesPresenterProtocol {
  
    internal func requestRecipes() {
        interactor?.requestRecipes()
    }
}

@available(iOS 13.0, macOS 10.15, *)
extension RecipesPresenter: RecipesInteractorOutputProtocol {
    
    func error(message: String) {
        delegate?.error(message: message)
    }
    
    func success(recipes: [RecipeResponse]) {
        delegate?.success(recipes: recipes)
    }
}
