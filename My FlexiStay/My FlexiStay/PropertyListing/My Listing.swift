//
//  My Listing.swift
//  My FlexiStay
//
//  Created by Apple on 22/10/20.
//  Copyright © 2020 MacFreak's  "Rt". All rights reserved.
//

import UIKit

class My_Listing: UIViewController {
    
    @IBOutlet weak var img3: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var savebtn: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn3: UIButton!
    
    var imgstr = "https://myflexistay-dev-icons.s3.ap-south-1.amazonaws.com/48+%C3%97+48+area+in+64+%C3%97+64+(xhdpi)-18.png"
    
    var CommontextFields = [UIButton]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        img1.Listing(urlstring: imgstr)
        
        //        btn1.layer.backgroundColor = UIColor.gray.cgColor
        CommontextFields = [btn1,btn2,btn3,btn4]
        CommontextFields.forEach {
            
            $0.layer.borderWidth = 1
            
            $0.layer.cornerRadius = 10
            
        }
//        btn1.layer.borderWidth = 1
//        btn1.layer.cornerRadius = 10
//        //        btn2.backgroundColor = .lightGray
//        btn2.layer.borderWidth = 1
//        btn2.layer.cornerRadius = 10
//        //        btn3.backgroundColor = .lightGray
//        btn3.layer.borderWidth = 1
//        btn3.layer.cornerRadius = 10
//        //        btn4.backgroundColor = .lightGray
//        btn4.layer.borderWidth = 1
//        btn4.layer.cornerRadius = 10
        
        savebtn.layer.borderWidth = 1
        savebtn.layer.cornerRadius = 15
    }
    
    
    
}
extension UIImageView {
    func Listing(urlstring: String) {
        guard let url = URL(string: urlstring)else {
            return
        }
        DispatchQueue.global().async {
            [weak self] in
            if let data = try?
                Data(contentsOf: url){
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

