//
//  Buy View.swift
//  My FlexiStay
//
//  Created by Apple on 03/10/20.
//  Copyright © 2020 MacFreak's  "Rt". All rights reserved.
//

import UIKit

class Buy_View: UIViewController {
    
    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var searchbar: UISearchBar!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn6: UIButton!
    @IBOutlet weak var btn7: UIButton!
    @IBOutlet weak var btn8: UIButton!
    @IBOutlet weak var submitbtn: UIButton!
    @IBOutlet weak var btn21: UIButton!
    
    
    let imgname = "https://myflexistay-dev-icons.s3.ap-south-1.amazonaws.com/Icons/Back+48+%C3%97+48+area+in+64+%C3%97+64+(xhdpi)-13.png"
    let imgname1 = "https://myflexistay-dev-icons.s3.ap-south-1.amazonaws.com/Icons/Back1+48+%C3%97+48+area+in+64+%C3%97+64+(xhdpi)-14.png"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        view1.layer.cornerRadius = 40
        img1.Buy_View(urlstring: imgname)
        img2.Buy_View(urlstring: imgname1)
        submitbtn.layer.cornerRadius = 17
        searchbar.layer.borderWidth = 1
        searchbar.layer.borderColor = UIColor.gray.cgColor
        searchbar.layer.cornerRadius = 17
        
        btn1.layer.borderWidth = 1
        btn1.layer.borderColor = UIColor.gray.cgColor
        btn1.layer.cornerRadius = 10
        
        btn21.layer.borderWidth = 1
        btn21.layer.borderColor = UIColor.gray.cgColor
        btn21.layer.cornerRadius = 10

        btn3.layer.borderWidth = 1
        btn3.layer.borderColor = UIColor.gray.cgColor
        btn3.layer.cornerRadius = 10

        btn4.layer.borderWidth = 1
        btn4.layer.borderColor = UIColor.gray.cgColor
        btn4.layer.cornerRadius = 10

        btn5.layer.borderWidth = 1
        btn5.layer.borderColor = UIColor.gray.cgColor
        btn5.layer.cornerRadius = 10

        btn6.layer.borderWidth = 1
        btn6.layer.borderColor = UIColor.gray.cgColor
        btn6.layer.cornerRadius = 10

        btn7.layer.borderWidth = 1
        btn7.layer.borderColor = UIColor.gray.cgColor
        btn7.layer.cornerRadius = 10

        btn8.layer.borderWidth = 1
        btn8.layer.borderColor = UIColor.gray.cgColor
        btn8.layer.cornerRadius = 10
        
    }
}

extension UIImageView {
    func Buy_View(urlstring : String) {
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

