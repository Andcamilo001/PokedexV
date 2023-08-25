//
//  SplashScreen.swift
//  Pokedex-type1
//
//  Created by Camilo Lezcano on 28/07/23.
//

import Foundation
import UIKit

class SplashScreen: UIViewController {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width * 0.5333, height: UIScreen.main.bounds.height * 0.08875))
        
        imageView.image = UIImage(named: stringAssets.pokedexSplash)
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 41/255, alpha: 1)
        view.addSubview(imageView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.center = view.center
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: { self.animated()})
    }
    
    private func animated() {
        UIView.animate(withDuration: 1, animations: {
            let size = self.view.frame.size.width * 2
            let diffX = size - self.view.frame.size.width
            let diffY = self.view.frame.size.height - size
            
            self.imageView.frame = CGRect(
                x: -(diffX/2),
                y: diffY/2,
                width: size,
                height: size
            )
        })
        
        UIView.animate(withDuration: 1.5, animations: {
            self.imageView.alpha = 0
        }, completion: { finish in
            if finish {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
                    let viewController = Onboarding()
                    viewController.modalTransitionStyle = .crossDissolve
                    viewController.modalPresentationStyle = .fullScreen
                    self.present(viewController, animated: true)
                })
            }
        })
    }
}
