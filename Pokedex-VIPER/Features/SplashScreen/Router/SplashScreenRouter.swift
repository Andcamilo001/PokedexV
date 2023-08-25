//
//  SplashScreenRouter.swift
//  Pokedex-type1
//
//  Created by Camilo Lezcano on 28/07/23.
//

import Foundation
import UIKit

class SplashScreenRouter {
    func showSplashScreen(window: UIWindow?) {
        let view = SplashScreen()
        
        window?.rootViewController = view
        window?.makeKeyAndVisible()
    }
}
