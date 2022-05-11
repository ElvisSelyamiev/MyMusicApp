//
//  AppViewController.swift
//  My Music
//
//  Created by Elvis on 30.03.2022.
//

import UIKit
import SnapKit

class AppViewController: UIViewController {

    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Добро пожаловать, \(defaults.string(forKey: "NameLog")!)"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 22)
        return label
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Выйти", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.contentHorizontalAlignment = .center
        button.addTarget(self, action: #selector(pressButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var musicButton: UIButton = {
        let button = UIButton()
        button.setTitle("Хочу послушать музыку", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.contentHorizontalAlignment = .center
        button.addTarget(self, action: #selector(pressMusicButton), for: .touchUpInside)
        return button
    }()
    
    private let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemIndigo
        
        setupContent()
    }
    
    func setupContent() {
        [label, button, musicButton].forEach {
            view.addSubview($0)
        }
        
        label.snp.makeConstraints { make in
            make.center.equalTo(self.view)
        }
        
        musicButton.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(20)
            make.left.right.equalTo(0)
        }
        
        button.snp.makeConstraints { make in
            make.top.equalTo(musicButton.snp.bottom).offset(20)
            make.left.right.equalTo(0)
        }
    }

    @objc func pressButton() {
        let mainScrean = MainViewController()
        mainScrean.modalPresentationStyle = .fullScreen
        present(mainScrean, animated: true, completion: nil)
        defaults.set(false, forKey: "LoginSuccess")
    }
    
    @objc func pressMusicButton() {
        let musicScrean = MainTabBarController()
        musicScrean.modalPresentationStyle = .fullScreen
        present(musicScrean, animated: true, completion: nil)
    }
}

