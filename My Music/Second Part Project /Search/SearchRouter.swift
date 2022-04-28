//
//  SearchRouter.swift
//  My Music
//
//  Created by Elvis on 30.03.2022.
//

import UIKit

protocol SearchRoutingLogic {
    
}

class SearchRouter: NSObject, SearchRoutingLogic {
    
    weak var viewController: SearchViewController?
    
    // MARK: Routing
    
}


//extension RegistrationVC: UITableViewDelegate, UITableViewDataSource {
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 6
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        switch indexPath.row {
//        case 0:
//            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TextFieldRegCell.self)) as! TextFieldRegCell
//            cell.textField.placeholder = tfPlaceholder[indexPath.row]
//            cell.validationType = .login
//            return cell
//
//        case 1:
//            let cell: TextFieldRegCell = tableView.dequeueReusableCell(withIdentifier: String(describing: TextFieldRegCell.self)) as! TextFieldRegCell
//            cell.textField.placeholder = tfPlaceholder[indexPath.row]
//            cell.validationType = .email
//            return cell
//
//        case 2:
//            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TextFieldRegCell.self)) as! TextFieldRegCell
//            cell.textField.placeholder = tfPlaceholder[indexPath.row]
//            cell.validationType = .password
//            cell.textField.isSecureTextEntry = true
//            return cell
//
//        case 3:
//            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TextFieldRegCell.self)) as! TextFieldRegCell
//            cell.textField.placeholder = tfPlaceholder[indexPath.row]
//            cell.textField.isSecureTextEntry = true
//            return cell
//
//        case 4:
//            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SwitchCell.self)) as! SwitchCell
//            return cell
//
//        case 5:
//            let cell: ButtonRegCell = tableView.dequeueReusableCell(withIdentifier: String(describing: ButtonRegCell.self)) as! ButtonRegCell
//            cell.action = { [weak self] in
//                self?.saveUserData()
//            }
//            return cell
//
//        default:
//            return UITableViewCell()
//        }
//
//    }
//
//}
