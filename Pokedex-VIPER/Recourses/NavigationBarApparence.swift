//
//  NavigationBarApparence.swift
//  Pokedex-type1
//
//  Created by Camilo Lezcano on 28/07/23.
//

import Foundation
import UIKit

extension UINavigationController {
    
    func setupNavBarColor() {
        let appearance = UINavigationBarAppearance()
        
        appearance.backgroundColor = .white
        appearance.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: UIScreen.main.bounds.width * 0.05, weight: .semibold)]
        
        let titleOffset = UIOffset(horizontal: UIScreen.main.bounds.width * -0.4, vertical: 0.0)
        appearance.titlePositionAdjustment = titleOffset
        
        self.navigationBar.standardAppearance = appearance
        self.navigationBar.scrollEdgeAppearance = appearance
        self.navigationBar.compactAppearance = appearance
        
        self.navigationBar.tintColor = .black
    }
}
