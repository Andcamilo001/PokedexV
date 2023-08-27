//
//  OnboardingThirdPart.swift
//  Pokedex-VIPER
//
//  Created by Camilo Lezcano on 16/08/23.
//

import Foundation
import UIKit

class OnboardingThirdPart: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        setupUI()
    }
    
    private func setupUI() {
        let skipLabel = UILabel()
        skipLabel.text = NSLocalizedString("onboarding-third-part-skip", comment: "")
        skipLabel.font = UIFont(name: Fonts.poppinsMedium, size: SizeScreen.width * 0.05)
        skipLabel.textAlignment = .right
        skipLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let arrowForward = UIImageView(image: UIImage(systemName: "arrow.forward"))
        arrowForward.isUserInteractionEnabled = true
        let arrowForwardTapGesture = UITapGestureRecognizer(target: self, action: #selector(arrowForwardTapped))
        arrowForward.addGestureRecognizer(arrowForwardTapGesture)
        arrowForward.tintColor = .black
        arrowForward.translatesAutoresizingMaskIntoConstraints = false
        
        let imageView = UIImageView(image: UIImage(named: stringAssets.pokeTrainers))
        imageView.contentMode = .center
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        let titleLabel = UILabel()
        titleLabel.text = NSLocalizedString("onboarding-third-part-title", comment: "")
        titleLabel.font = UIFont(name: Fonts.poppinsMedium, size: SizeScreen.width * 0.072)
        titleLabel.numberOfLines = 2
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let bodyLabel = UILabel()
        bodyLabel.text = NSLocalizedString("onboarding-third-part-body", comment: "")
        bodyLabel.font = UIFont(name: Fonts.poppinsMedium, size: SizeScreen.width * 0.038)
        bodyLabel.numberOfLines = 4
        bodyLabel.textAlignment = .center
        bodyLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let createAccountButton = UIButton()
        createAccountButton.setTitle(NSLocalizedString("onboarding-third-part-button", comment: ""), for: .normal)
        createAccountButton.setTitleColor(.white, for: .normal)
        createAccountButton.titleLabel?.font = UIFont(name: Fonts.poppinsSemiBold, size: SizeScreen.width * 0.05)
        createAccountButton.backgroundColor = UIColor(red: 23/255, green: 62/255, blue: 165/255, alpha: 1)
        createAccountButton.layer.cornerRadius = 20
        createAccountButton.addTarget(self, action: #selector(createAccountButtonTapped), for: .touchUpInside)
        createAccountButton.translatesAutoresizingMaskIntoConstraints = false
        
        let existsAccountButton = UIButton()
        existsAccountButton.setTitle(NSLocalizedString("onboarding-third-part-button-account-exists", comment: ""), for: .normal)
        existsAccountButton.setTitleColor(UIColor(red: 23/255, green: 62/255, blue: 165/255, alpha: 1), for: .normal)
        existsAccountButton.titleLabel?.font = UIFont(name: Fonts.poppinsSemiBold, size: SizeScreen.width * 0.05)
        existsAccountButton.backgroundColor = .white
        existsAccountButton.layer.cornerRadius = 20
        existsAccountButton.addTarget(self, action: #selector(existsAccountButtonTapped), for: .touchUpInside)
        existsAccountButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(imageView)
        self.view.addSubview(titleLabel)
        self.view.addSubview(bodyLabel)
        self.view.addSubview(createAccountButton)
        self.view.addSubview(arrowForward)
        self.view.addSubview(skipLabel)
        self.view.addSubview(existsAccountButton)
        
        let circleSize: CGFloat = min(SizeScreen.width * 0.025, SizeScreen.height * 0.01125)
        
        NSLayoutConstraint.activate([
            
            skipLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            skipLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: SizeScreen.height * 0.075),
            skipLabel.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -40),
            
            arrowForward.leadingAnchor.constraint(equalTo: skipLabel.trailingAnchor, constant: 5),
            arrowForward.centerYAnchor.constraint(equalTo: skipLabel.centerYAnchor),
            
            imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: skipLabel.bottomAnchor, constant: SizeScreen.height * 0.1575),
            
            titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            titleLabel.widthAnchor.constraint(equalToConstant: SizeScreen.width * 0.9111),
            
            bodyLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            bodyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            bodyLabel.widthAnchor.constraint(equalToConstant: SizeScreen.width * 0.9111),
            
            createAccountButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            createAccountButton.topAnchor.constraint(equalTo: bodyLabel.bottomAnchor, constant: 20),
            createAccountButton.widthAnchor.constraint(equalToConstant: SizeScreen.width * 0.9111),
            createAccountButton.heightAnchor.constraint(equalToConstant: SizeScreen.height * 0.0725),
            
            existsAccountButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            existsAccountButton.topAnchor.constraint(equalTo: createAccountButton.bottomAnchor, constant: 5),
            existsAccountButton.widthAnchor.constraint(equalToConstant: SizeScreen.width * 0.9111),
            existsAccountButton.heightAnchor.constraint(equalToConstant: SizeScreen.height * 0.0725)
            
        ])
        
    }
    
    @objc private func createAccountButtonTapped() {
        let nextViewController = TabBarPokedex()
        let navigationController = UINavigationController(rootViewController: nextViewController)
        
        navigationController.navigationBar.isHidden = true
        
        UIApplication.shared.windows.first?.rootViewController = navigationController
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
    
    @objc private func existsAccountButtonTapped() {
        let nextViewController = Onboarding()
        let navigationController = UINavigationController(rootViewController: nextViewController)
        
        navigationController.navigationBar.isHidden = true
        
        UIApplication.shared.windows.first?.rootViewController = navigationController
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
    
    @objc private func skipButtonTapped() {
        let nextViewController = OnboardingSecondPart()
        let navigationController = UINavigationController(rootViewController: nextViewController)
        
        navigationController.navigationBar.isHidden = true
        
        UIApplication.shared.windows.first?.rootViewController = navigationController
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
    
    @objc private func arrowForwardTapped() {
            skipButtonTapped()
        }
}
