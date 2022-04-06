//
//  AppDelegate.swift
//  My Music
//
//  Created by Elvis on 30.03.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    private let defaults = UserDefaults.standard
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let vc = defaults.bool(forKey: "LoginSuccess") ? AppViewController() : MainViewController()
        let navigationVC = UINavigationController.init(rootViewController: vc)
        self.window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationVC
        window?.makeKeyAndVisible()

        return true
    }
}

