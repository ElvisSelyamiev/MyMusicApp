//
//  LoginVC.swift
//  My Music
//
//  Created by Elvis on 30.03.2022.
//

import UIKit
import PopupDialog

protocol CheckLoginCellDelegate: AnyObject {
    func checkDataLogin(_ login: String)
    func checkDataPassword(_ password: String)
}

class LoginVC: UIViewController {
    
    private let tableView = UITableView()
    private let tfPlaceholder = ["Введите логин", "Введите пароль"]
    private let defaults = UserDefaults.standard
    private var loginData = ""
    private var passwordData = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupTableView()
    }
    
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TextFieldLogCell.self, forCellReuseIdentifier: String(describing: TextFieldLogCell.self))
        tableView.register(ButtonLogCell.self, forCellReuseIdentifier: String(describing: ButtonLogCell.self))
        tableView.separatorStyle = .none
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(0)
        }
    }
    
    func showPopupWarn() {
        let pdTitle = "Ошибка!"
        let pdMessage = "Неверный логин или пароль"
        let pdImage = UIImage(named: "failurePopup")
        let popupButton = CancelButton(title: "Ok!", action: nil)
        let popupDialog = PopupDialog(title: pdTitle, message: pdMessage, image: pdImage)
        popupDialog.addButton(popupButton)
        present(popupDialog, animated: true)
    }

}

//MARK: Extansion for TableView
extension LoginVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TextFieldLogCell.self)) as! TextFieldLogCell
        
        switch indexPath.row {
        case 0:
            cell.textField.placeholder = tfPlaceholder[indexPath.row]
            cell.validationType = .login
            cell.delegate = self
            return cell
            
        case 1:
            cell.textField.placeholder = tfPlaceholder[indexPath.row]
            cell.validationType = .password
            cell.delegate = self
            cell.textField.isSecureTextEntry = true
            return cell
            
        case 2:
            let cell: ButtonLogCell = tableView.dequeueReusableCell(withIdentifier: String(describing: ButtonLogCell.self)) as! ButtonLogCell
            cell.action = { [weak self] in
                self?.checkUser()
            }
            return cell
            
        default:
            return UITableViewCell()
        }
        
    }
    
}

//MARK: Extansion for Login
extension LoginVC: CheckLoginCellDelegate {
    
    func checkDataLogin(_ login: String) {
        loginData = login
    }
    
    func checkDataPassword(_ password: String) {
        passwordData = password
    }
    
    func checkUser() {
        
        if loginData == defaults.string(forKey: passwordData) {
            defaults.set(loginData, forKey: "NameLog")
            let applicationScrean = AppViewController()
            applicationScrean.modalPresentationStyle = .fullScreen
            present(applicationScrean, animated: true)
            defaults.set(true, forKey: "LoginSuccess")
            
        } else {
            showPopupWarn()
        }
    }
    
}

