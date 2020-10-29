//
//  DropDownModel.swift
//  My FlexiStay
//
//  Created by Dasharath Naik on 23/10/20.
//  Copyright © 2020 MacFreak's  "Rt". All rights reserved.
//


import Foundation
import UIKit
class DropDownTextfield: UITextField{
   
    
    let button = UIButton(type: .custom)

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureTextField()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureTextField()
    }
    func configureTextField() {
            button.setImage(UIImage(named: "down-arrow (1)"), for: .normal)
            button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
            button.frame = CGRect(x: 0, y: 0, width: CGFloat(30), height: 20)
//            button.addTarget(self, action: #selector(self.refresh), for: .touchUpInside)
       // button.addTarget(self, action: #selector(alert(sender:)), for: .touchUpInside)
            let iconView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 30))
            iconView.addSubview(button)

            rightView = iconView
            rightViewMode = .always
        }
   
    
    }


class newtext: UITextField {
   
}
