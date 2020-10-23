//
//  ViewController.swift
//  My FlexiStay
//
//  Created by Apple on 28/09/20.
//  Copyright © 2020 MacFreak's  "Rt". All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textfields: UITextField!
    @IBOutlet weak var imglbl: UIImageView!
    @IBOutlet weak var loginlbl: UIButton!
    @IBOutlet weak var text1: UITextField!
    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var text2: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loginlbl.backgroundColor = UIColor(red: 34/255, green: 140/255, blue: 93/255, alpha: 1)
        btn.layer.cornerRadius = 8
        
        text2.placeholder = "Password"
        text1.placeholder = "Username"
        text2.textColor = .yellow
        
        text1.BottomBorder()
        text2.BottomBorder()

    }

    @IBAction func login(_ sender: UIButton) {
        
        let detail = self.storyboard?.instantiateViewController(withIdentifier: "HomePage")as! HomePage
        detail.navigationController?.pushViewController(detail, animated: true)
    }
    
}

extension UIImageView {
    func imgname(urlstring : String) {
        guard let url = URL(string: urlstring)else {
            return
        }
        DispatchQueue.global().async { [weak self] in
            
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
extension UITextField {
    
    func BottomBorder() {
      //  self.layer.shadowColor = UIColor.gre.cgColor;
        self.layer.shadowColor = UIColor.green.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
}

