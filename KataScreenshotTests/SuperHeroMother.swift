//
//  SuperHeroMother.swift
//  KataScreenshot
//
//  Created by Sergio Gutiérrez on 09/01/17.
//  Copyright © 2017 Karumi. All rights reserved.
//

import Foundation
@testable import KataScreenshot

class SuperHeroMother {
    static func givenASuperHero(isAvenger: Bool, name: String = "Mr. Clean", descripcion: String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", imagePath: String = "") -> SuperHero {
        let superHero = SuperHero(
            name: name,
            photo: URL(string: imagePath),
            isAvenger: isAvenger,
            description: descripcion
        )
        return superHero
    }
}
