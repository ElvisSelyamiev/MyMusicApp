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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TextFieldLogCell.self)) as! TextFieldLogCell
        
        switch indexPath.row {
        case 0:
            cell.textField.placeholder = tfPlaceholder[indexPath.row]
            return cell
            
        case 1:
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

//MARK: Extansion for Login
private extension LoginVC {
    
    func checkUser() {
        let loginTextFieldCell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? TextFieldLogCell
        let passTextFieldCell = tableView.cellForRow(at: IndexPath(row: 1, section: 0)) as? TextFieldLogCell
        
        let logTF = loginTextFieldCell?.textField.text
        let passTF = passTextFieldCell?.textField.text
        
        if logTF == defaults.string(forKey: passTF ?? "1111") {
            defaults.set(logTF, forKey: "NameLog")
            let applicationScrean = AppViewController()
            applicationScrean.modalPresentationStyle = .fullScreen
            present(applicationScrean, animated: true)
            defaults.set(true, forKey: "LoginSuccess")
        } else {
            showPopupWarn()
        }
    }
    
}

