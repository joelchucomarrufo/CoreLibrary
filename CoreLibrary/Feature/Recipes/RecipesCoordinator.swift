//
//  RecipesCoordinator.swift
//  CoreLibrary
//
//  Created by Joel Martin Chuco Marrufo on 8/02/25.
//

import Foundation

final class RecipesCoordinator: BaseCoordinator {
    
    @available(iOS 13.0, macOS 10.15, *)
    static func build() -> RecipesPresenter {
        let vip = BaseCoordinator.assemblyPresenter(presenter: RecipesPresenter.self, interactor: RecipesInteractor.self)
        vip.interactor.recipesProvider = RecipesProvider()
        return vip.presenter
    }
    
}
