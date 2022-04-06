//
//  TextFieldRegCell.swift
//  My Music
//
//  Created by Elvis on 30.03.2022.
//

import UIKit
import SnapKit

class TextFieldRegCell: UITableViewCell, UITextFieldDelegate {
    
    enum ValidationType {
        case login
        case email
        case password
    }
    
    var validationType: ValidationType?

    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.clipsToBounds = true
        textField.clearButtonMode = .whileEditing
        textField.delegate = self
        textField.borderStyle = .roundedRect
        
        return textField
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(textField)
        
        textField.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.top.equalTo(5)
        }
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        switch validationType {
        case .email:
            if isValidEmail(textField.text ?? "") {
                textField.layer.borderWidth = 0
            } else if textField.text == "" {
                textField.layer.borderWidth = 0
            } else {
                textField.layer.borderWidth = 1.0
                textField.layer.borderColor = CGColor(red: 1.0, green: 0, blue: 0, alpha: 1.0)
            }
            
        case .password:
            if isValidPassword(textField.text ?? "") {
                textField.layer.borderWidth = 0
            } else if textField.text == "" {
                textField.layer.borderWidth = 0
            } else {
                textField.layer.borderWidth = 1.0
                textField.layer.borderColor = CGColor(red: 1.0, green: 0, blue: 0, alpha: 1.0)
            }
            
        default:
            break
        }
        
        return true
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        return emailPred.evaluate(with: email)
    }
    
    private func isValidPassword(_ pass: String) -> Bool {
        let passRegEx = "(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{6,20}"
        let passPred = NSPredicate(format: "SELF MATCHES %@", passRegEx)
        
        return passPred.evaluate(with: pass)
    }
    
}
