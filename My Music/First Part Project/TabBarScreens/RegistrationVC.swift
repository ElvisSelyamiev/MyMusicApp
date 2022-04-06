//
//  RegistrationVC.swift
//  My Music
//
//  Created by Elvis on 30.03.2022.
//

import UIKit
import SnapKit
import PopupDialog

class RegistrationVC: UIViewController {
    
    private let tableView = UITableView()
    private let tfPlaceholder = ["Логин", "E-mail", "Пароль", "Повторите пароль"]
    private let popupButton = CancelButton(title: "Ok!", action: nil)
    private let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupTableView()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TextFieldRegCell.self, forCellReuseIdentifier: String(describing: TextFieldRegCell.self))
        tableView.register(SwitchCell.self, forCellReuseIdentifier: String(describing: SwitchCell.self))
        tableView.register(ButtonRegCell.self, forCellReuseIdentifier: String(describing: ButtonRegCell.self))
        tableView.separatorStyle = .none
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(0)
        }
    }
    
    func showPopup(title: String? = nil, message: String? = nil, image: UIImage? = nil) {
        let popupDialog = PopupDialog(title: title, message: message, image: image)
        popupDialog.addButton(popupButton)
        self.present(popupDialog, animated: true, completion: nil)
    }

}


extension RegistrationVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TextFieldRegCell.self)) as! TextFieldRegCell
            cell.textField.placeholder = tfPlaceholder[indexPath.row]
            cell.validationType = .login
            return cell
            
        case 1:
            let cell: TextFieldRegCell = tableView.dequeueReusableCell(withIdentifier: String(describing: TextFieldRegCell.self)) as! TextFieldRegCell
            cell.textField.placeholder = tfPlaceholder[indexPath.row]
            cell.validationType = .email
            return cell
            
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TextFieldRegCell.self)) as! TextFieldRegCell
            cell.textField.placeholder = tfPlaceholder[indexPath.row]
            //cell.textField.isSecureTextEntry = true
            cell.validationType = .password
            return cell
            
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TextFieldRegCell.self)) as! TextFieldRegCell
            cell.textField.placeholder = tfPlaceholder[indexPath.row]
            cell.textField.isSecureTextEntry = true
            return cell
            
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SwitchCell.self)) as! SwitchCell
            return cell
            
        case 5:
            let cell: ButtonRegCell = tableView.dequeueReusableCell(withIdentifier: String(describing: ButtonRegCell.self)) as! ButtonRegCell
            cell.action = { [weak self] in
                self?.saveUserData()
            }
            return cell
            
        default:
            return UITableViewCell()
        }
        
    }
    
}



private extension RegistrationVC {
    
    func saveUserData() {
        let loginTextFieldCell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? TextFieldRegCell
        let passTextFieldCell = tableView.cellForRow(at: IndexPath(row: 2, section: 0)) as? TextFieldRegCell
        
        if loginTextFieldCell?.textField.text == "" || passTextFieldCell?.textField.text == ""{
            showPopup(
                title: "Ошибка!",
                message: "Необходимо заполнить все поля",
                image: UIImage(named: "failurePopup")
            )
        } else {
            defaults.set(loginTextFieldCell?.textField.text ?? "Unknown", forKey: passTextFieldCell?.textField.text ?? "1111")
            
            showPopup(
                title: "Готово",
                message: "Вы успешно зарегистрировались!",
                image: UIImage(named: "successPopup")
            )
        }
    }
    
}
