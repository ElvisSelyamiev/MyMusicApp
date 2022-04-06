//
//  MainViewController.swift
//  My Music
//
//  Created by Elvis on 30.03.2022.
//

import UIKit
import SnapKit
import PopupDialog

class MainViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewControllers()
        
        self.tabBar.tintColor = .black
    }
    
}



private extension MainViewController {
    
    func configureViewControllers() {
        let logVC = LoginVC()
        logVC.tabBarItem = UITabBarItem(
            title: "Войти",
            image: UIImage(systemName: "person.crop.circle.fill.badge.checkmark"),
            selectedImage: nil
        )
        
        let regVC = RegistrationVC()
        regVC.tabBarItem = UITabBarItem(
            title: "Зарегистрироваться",
            image: UIImage(systemName: "person.crop.circle.fill.badge.plus"),
            selectedImage: nil
        )
        
        self.setViewControllers([logVC, regVC], animated: false)
    }
    
}
