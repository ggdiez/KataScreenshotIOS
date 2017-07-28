//
//  SuperHeroesViewControllerTests.swift
//  KataSuperHeroes
//
//  Created by Sergio Gutiérrez on 22/12/16.
//  Copyright © 2016 GoKarumi. All rights reserved.
//

import UIKit
@testable import KataScreenshot

class SuperHeroesViewControllerTests: ScreenshotTest {

    fileprivate let repository = MockSuperHeroesRepository()

    func testShowsEmptyCase() {
        givenThereAreNoSuperHeroes()

        let viewController = getSuperHeroDetailViewController()

        verify(viewController: viewController)
    }
    
    func testShowOnlyOneSuperHero () {
        _ = givenThereAreSomeSuperHeroes(1)
        
        let viewController = getSuperHeroDetailViewController()
        
        verify(viewController: viewController)
    }
    
    func testShowTenSuperHeroesAreShownProperly () {
        _ = givenThereAreSomeSuperHeroes(10)
        
        let viewController = getSuperHeroDetailViewController()
        
        verify(viewController: viewController)
    }
    
    func testShowTenAvengersHeroesAreShownProperly () {
        _ = givenThereAreSomeSuperHeroes(10, avengers: true)
        
        let viewController = getSuperHeroDetailViewController()
        
        verify(viewController: viewController)
    }
    
    
    func testShowEndOfTheListOfSuperHeroes () {
        _ = givenThereAreSomeSuperHeroes(10)
        
        //TODO: With kiff move the scroll to the final
        
        let viewController = getSuperHeroDetailViewController()
        
        verify(viewController: viewController)
    }
    
    fileprivate func givenThereAreSomeAvengers() -> [SuperHero] {
        return givenThereAreSomeSuperHeroes(avengers: true)
    }

    fileprivate func givenThereAreNoSuperHeroes() {
        _ = givenThereAreSomeSuperHeroes(0)
    }

    fileprivate func givenThereAreSomeSuperHeroes(_ numberOfSuperHeroes: Int = 10,
        avengers: Bool = false) -> [SuperHero] {
        var superHeroes = [SuperHero]()
        for i in 0..<numberOfSuperHeroes {
            let superHero = SuperHero(name: "SuperHero - \(i)",
                photo: URL(string: ""),
                isAvenger: avengers, description: "Description - \(i)")
            superHeroes.append(superHero)
        }
        repository.superHeroes = superHeroes
        return superHeroes
    }

    fileprivate func getSuperHeroDetailViewController() -> UIViewController {
        let superHeroesViewController = ServiceLocator()
            .provideSuperHeroesViewController() as! SuperHeroesViewController
        superHeroesViewController.presenter = SuperHeroesPresenter(
            ui: superHeroesViewController,
            getSuperHeroes: GetSuperHeroes(repository: repository)
        )

        let rootViewController = UINavigationController()
        rootViewController.viewControllers = [superHeroesViewController]

        return rootViewController
    }
}
