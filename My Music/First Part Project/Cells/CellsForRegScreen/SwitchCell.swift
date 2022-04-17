//
//  SwitchCell.swift
//  My Music
//
//  Created by Elvis on 30.03.2022.
//

import UIKit
import SnapKit

class SwitchCell: UITableViewCell {
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Согласен с правилами"
        label.font = .systemFont(ofSize: 20)
        
        return label
    }()
    
    lazy var switchControl: UISwitch = UISwitch()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        [label, switchControl].forEach {
            contentView.addSubview($0)
        }
        
        label.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.top.equalTo(5)
        }
        
        switchControl.snp.makeConstraints { make in
            make.right.equalTo(-20)
            make.top.equalTo(5)
        }
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
