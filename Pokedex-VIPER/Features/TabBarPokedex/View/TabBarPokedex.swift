//
//  TabBarPokedex.swift
//  Pokedex-type1
//
//  Created by Camilo Lezcano on 28/07/23.
//

import Foundation
import UIKit

class TabBarPokedex: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabs()
        
        self.tabBar.backgroundColor = .white
        self.tabBar.tintColor = .red
        self.tabBar.unselectedItemTintColor = .gray
    }
    
    private func setupTabs() {
        
        let pokedex = self.createNav(with: "Pokédex", and: UIImage(named: stringAssets.pokeballTabBar), vc: PokedexViewController())
        let region = self.createNav(with: "Region", and: UIImage(named: stringAssets.PokePin), vc: RegionViewController())
        let favorites = self.createNav(with: "Favorites", and: UIImage(named: stringAssets.PokeHeart), vc: FavoritesViewController())
        let profile = self.createNav(with: "Profile", and: UIImage(named: stringAssets.ProfileTabBar), vc: ProfileViewController())
        
        self.setViewControllers([pokedex, region, favorites, profile], animated: true)
        
    }
    
    private func createNav(with title: String, and image: UIImage?, vc: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: vc)
        
        nav.setupNavBarColor()
        
        nav.viewControllers.first?.navigationItem.title = title
        nav.tabBarItem.title = title
        nav.tabBarItem.image = image
        
        nav.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.blue], for: .selected)
        
        return nav
    }
}
