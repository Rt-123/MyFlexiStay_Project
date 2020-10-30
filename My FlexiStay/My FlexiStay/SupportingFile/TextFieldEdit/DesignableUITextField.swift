//
//  TetxtEdit.swift
//  My FlexiStay
//
//  Created by Dasharath Naik on 29/10/20.
//  Copyright © 2020 MacFreak's  "Rt". All rights reserved.
//

import Foundation
import UIKit
@IBDesignable
class DesignableUITextField: UITextField {
    
    // Provides left padding for images
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.leftViewRect(forBounds: bounds)
        textRect.origin.x += leftPadding
        return textRect
    }
    
    @IBInspectable var leftImage: UIImage? {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var leftPadding: CGFloat = 0
    
    @IBInspectable var color: UIColor = UIColor.lightGray {
        didSet {
            updateView()
        }
    }
    
    func updateView() {
        if let image = leftImage {
            leftViewMode = UITextField.ViewMode.always
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
            imageView.contentMode = .scaleAspectFit
            imageView.image = image
            // Note: In order for your image to use the tint color, you have to select the image in the Assets.xcassets and change the "Render As" property to "Template Image".
            imageView.tintColor = color
            leftView = imageView
        } else {
            leftViewMode = UITextField.ViewMode.never
            leftView = nil
        }
        
        
}
}
extension UITextField {

    //MARK:- Set Image on the right of text fields

  func setupRightImage(imageName:String){
    let imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 20, height: 20))
    imageView.image = UIImage(named: imageName)
    let imageContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 55, height: 40))
    imageContainerView.addSubview(imageView)
    rightView = imageContainerView
    rightViewMode = .always
    self.tintColor = .lightGray
}

 //MARK:- Set Image on left of text fields
//
//    func setupLeftImage(imageName:String){
//       let imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 20, height: 20))
//       imageView.image = UIImage(named: imageName)
//       let imageContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 55, height: 40))
//       imageContainerView.addSubview(imageView)
//       leftView = imageContainerView
//       leftViewMode = .always
//       self.tintColor = .lightGray
//     }

  }
