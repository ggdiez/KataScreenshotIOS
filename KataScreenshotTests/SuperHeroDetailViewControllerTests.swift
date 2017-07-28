//
//  SuperHeroDetailViewControllerTests.swift
//  KataSuperHeroes
//
//  Created by Sergio Gutiérrez on 22/12/16.
//  Copyright © 2016 GoKarumi. All rights reserved.
//

import UIKit
@testable import KataScreenshot

class SuperHeroDetailViewControllerTests: ScreenshotTest {

    fileprivate let repository = MockSuperHeroesRepository()

    func testShowSuperHeroDetail () {
        let superHero = self.givenASuperHero(isAvenger: false)
        
        let viewController = self.getSuperHeroDetailViewController(superHero.name)

        verify(viewController: viewController)
    }
    
    
    func testShowAvengerDetail () {
        let superHero = self.givenASuperHero(isAvenger: true)
        
        let viewController = self.getSuperHeroDetailViewController(superHero.name)
        
        verify(viewController: viewController)
    }
    
    func testShowSuperHeroDetailWithALongName () {
        let superHero = self.givenASuperHeroWithLongName(isAvenger: false)
        
        let viewController = self.getSuperHeroDetailViewController(superHero.name)
        
        verify(viewController: viewController)
    }
    
    func testShowSuperHeroDetailWithAvatar () {
        let superHero = self.giveASuperHeroWithAvatar(isAvenger: false)
        
        let viewController = self.getSuperHeroDetailViewController(superHero.name)
        
        verify(viewController: viewController)
    }

    func testShowSuperHeroDetailWithLongDetail () {
        let superHero = self.giveASuperHeroWithLongDescription(isAvenger: false)
        
        let viewController = self.getSuperHeroDetailViewController(superHero.name)
        
        verify(viewController: viewController)
        
    }
    
    func testShowSuperHeroDetailWithSpecialCharacters () {
        let superHero = self.giveASuperHeroWithSpecialCharactersInDescription(isAvenger: false)
        
        let viewController = self.getSuperHeroDetailViewController(superHero.name)
        
        verify(viewController: viewController)
        
    }
    
    func givenASuperHero(isAvenger: Bool) -> SuperHero {
        let superHero = SuperHeroMother.givenASuperHero(isAvenger: isAvenger)
        repository.superHeroes = [superHero]
        return superHero
    }
    
    func givenASuperHeroWithLongName (isAvenger: Bool) -> SuperHero {
        let superHero = SuperHeroMother.givenASuperHero(isAvenger: isAvenger, name: "Nombe muy muy largo para un Super Hero algo así como Supercalifragilisticoespialidoso")
        repository.superHeroes = [superHero]
        return superHero
    }
    
    func giveASuperHeroWithAvatar (isAvenger: Bool) -> SuperHero {
        let superHero = SuperHeroMother.givenASuperHero(isAvenger: isAvenger, imagePath:"https://i.annihil.us/u/prod/marvel/i/mg/9/b0/537bc2375dfb9.jpg")
        repository.superHeroes = [superHero]
        return superHero
    }
    
    func giveASuperHeroWithSpecialCharactersInDescription (isAvenger: Bool) -> SuperHero {
        let superHero = SuperHeroMother.givenASuperHero(isAvenger: isAvenger, descripcion: "§§§§§§üüüüüüüüüüüüüüüüü``+++€€€@@@##'']]")
        repository.superHeroes = [superHero]
        return superHero
    }
    
    func giveASuperHeroWithLongDescription (isAvenger: Bool) -> SuperHero {
        let superHero = SuperHeroMother.givenASuperHero(isAvenger: isAvenger, descripcion: "But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?")
        repository.superHeroes = [superHero]
        return superHero
    }

    fileprivate func getSuperHeroDetailViewController(_ superHeroName: String) -> UIViewController {
        let superHeroDetailViewController = ServiceLocator()
            .provideSuperHeroDetailViewController(superHeroName) as! SuperHeroDetailViewController
        superHeroDetailViewController.presenter = SuperHeroDetailPresenter(
            ui: superHeroDetailViewController,
            superHeroName: superHeroName,
            getSuperHeroByName: GetSuperHeroByName(repository: repository)
        )

        let rootViewController = UINavigationController()
        rootViewController.viewControllers = [superHeroDetailViewController]

        return rootViewController
    }
}
