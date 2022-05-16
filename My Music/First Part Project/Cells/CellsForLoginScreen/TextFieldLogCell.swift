//
//  TextFieldLogCell.swift
//  My Music
//
//  Created by Elvis on 30.03.2022.
//

import UIKit

class TextFieldLogCell: UITableViewCell, UITextFieldDelegate {
    
    enum ValidationTypeLog {
        case login
        case password
    }

    
    var validationType: ValidationTypeLog?
    weak var delegate: CheckLoginCellDelegate?
    private let defaults = UserDefaults.standard
    private var login = ""
    private var password = ""
    
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.clipsToBounds = true
        textField.delegate = self
        textField.clearButtonMode = .whileEditing
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
        case .login:
            login = textField.text ?? ""
            guard let delegate = delegate else { return false }
            delegate.checkDataLogin(login)
            
        case .password:
            password = textField.text ?? ""
            guard let delegate = delegate else { return false }
            delegate.checkDataPassword(password)
            
        default:
            break
        }

        return true
    }
    
}
