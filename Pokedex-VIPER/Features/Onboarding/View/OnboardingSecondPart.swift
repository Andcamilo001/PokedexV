//
//  OnboardingSecondPart.swift
//  Pokedex-VIPER
//
//  Created by Camilo Lezcano on 16/08/23.
//

import Foundation
import UIKit

class OnboardingSecondPart: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        setupUI()
    }
    
    private func setupUI() {
        let imageView = UIImageView(image: UIImage(named: stringAssets.pokeTrainerFemale))
        imageView.contentMode = .center
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        let titleLabel = UILabel()
        titleLabel.text = textsApp.OnboardingSecondPartTitle
        titleLabel.font = UIFont(name: Fonts.poppinsMedium, size: SizeScreen.width * 0.072)
        titleLabel.numberOfLines = 2
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let bodyLabel = UILabel()
        bodyLabel.text = textsApp.OnboardingSecondPartBody
        bodyLabel.font = UIFont(name: Fonts.poppinsMedium, size: SizeScreen.width * 0.038)
        bodyLabel.numberOfLines = 4
        bodyLabel.textAlignment = .center
        bodyLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let blueRectangle = UIView()
        blueRectangle.backgroundColor = UIColor(red: 23/255, green: 62/255, blue: 165/255, alpha: 1)
        blueRectangle.layer.cornerRadius = SizeScreen.height * 0.01125 / 2
        blueRectangle.translatesAutoresizingMaskIntoConstraints = false
        
        let grayCircle = UIView()
        grayCircle.backgroundColor = UIColor(red: 69/255, green: 101/255, blue: 183/255, alpha: 0.5)
        grayCircle.layer.cornerRadius = min(SizeScreen.width * 0.025, SizeScreen.height * 0.01125) / 2
        grayCircle.translatesAutoresizingMaskIntoConstraints = false
        
        let continueButton = UIButton()
        continueButton.setTitle(textsApp.OnboardingSecondPartButton, for: .normal)
        continueButton.setTitleColor(.white, for: .normal)
        continueButton.titleLabel?.font = UIFont(name: Fonts.poppinsSemiBold, size: SizeScreen.width * 0.05)
        continueButton.backgroundColor = UIColor(red: 23/255, green: 62/255, blue: 165/255, alpha: 1)
        continueButton.layer.cornerRadius = 20
        continueButton.addTarget(self, action: #selector(continueButtonTapped), for: .touchUpInside)
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(imageView)
        self.view.addSubview(titleLabel)
        self.view.addSubview(bodyLabel)
        self.view.addSubview(blueRectangle)
        self.view.addSubview(grayCircle)
        self.view.addSubview(continueButton)
        
        let circleSize: CGFloat = min(SizeScreen.width * 0.025, SizeScreen.height * 0.01125)
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: SizeScreen.height * 0.25875),
            
            titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            titleLabel.widthAnchor.constraint(equalToConstant: SizeScreen.width * 0.9111),
            
            bodyLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            bodyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            bodyLabel.widthAnchor.constraint(equalToConstant: SizeScreen.width * 0.9111),
            
            grayCircle.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            grayCircle.topAnchor.constraint(equalTo: bodyLabel.bottomAnchor, constant: 20),
            grayCircle.widthAnchor.constraint(equalToConstant: circleSize),
            grayCircle.heightAnchor.constraint(equalToConstant: circleSize),
            
            blueRectangle.leadingAnchor.constraint(equalTo: grayCircle.trailingAnchor, constant: 10),
            blueRectangle.centerYAnchor.constraint(equalTo: grayCircle.centerYAnchor),
            blueRectangle.widthAnchor.constraint(equalToConstant: SizeScreen.width * 0.077),
            blueRectangle.heightAnchor.constraint(equalToConstant: SizeScreen.height * 0.01125),
            
            continueButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            continueButton.topAnchor.constraint(equalTo: blueRectangle.bottomAnchor, constant: 20),
            continueButton.widthAnchor.constraint(equalToConstant: SizeScreen.width * 0.9111),
            continueButton.heightAnchor.constraint(equalToConstant: SizeScreen.height * 0.0725)
        ])
        
    }
    
    @objc private func continueButtonTapped() {
        let nextViewController = OnboardingThirdPart()
        let navigationController = UINavigationController(rootViewController: nextViewController)
        
        navigationController.navigationBar.isHidden = true
        
        UIApplication.shared.windows.first?.rootViewController = navigationController
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
}
