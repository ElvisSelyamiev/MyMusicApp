//
//  LoginVC.swift
//  My Music
//
//  Created by Elvis on 30.03.2022.
//

import UIKit
import PopupDialog

class LoginVC: UIViewController {
    
    private let tableView = UITableView()
    private let tfPlaceholder = ["Введите логин", "Введите пароль"]
    private let defaults = UserDefaults.standard
    private let appScrean = AppViewController()
    private let popupButton = CancelButton(title: "Ok!", action: nil)

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
        let popupDialog = PopupDialog(title: pdTitle, message: pdMessage, image: pdImage)
        popupDialog.addButton(popupButton)
        self.present(popupDialog, animated: true, completion: nil)
    }

}

extension LoginVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TextFieldLogCell.self)) as! TextFieldLogCell
            cell.textField.placeholder = tfPlaceholder[indexPath.row]
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TextFieldLogCell.self)) as! TextFieldLogCell
            cell.textField.placeholder = tfPlaceholder[indexPath.row]
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

private extension LoginVC {
    
    func checkUser() {
        let loginTextFieldCell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? TextFieldLogCell
        let passTextFieldCell = tableView.cellForRow(at: IndexPath(row: 1, section: 0)) as? TextFieldLogCell
        
        if loginTextFieldCell?.textField.text == defaults.string(forKey: passTextFieldCell?.textField.text ?? "1111") {
            defaults.set(loginTextFieldCell?.textField.text, forKey: "NameLog")
            let applicationScrean = AppViewController()
            applicationScrean.modalPresentationStyle = .fullScreen
            self.present(applicationScrean, animated: true, completion: nil)
            defaults.set(true, forKey: "LoginSuccess")
        } else {
            showPopupWarn()
        }
    }
    
}

