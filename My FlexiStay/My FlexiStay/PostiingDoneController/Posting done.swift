//
//  Posting done.swift
//  My FlexiStay
//
//  Created by Apple on 12/10/20.
//  Copyright © 2020 MacFreak's  "Rt". All rights reserved.
//

import UIKit

class Posting_done: UIViewController {
    
    @IBOutlet weak var img3: UIImageView!
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var view1: UIView!
    
    let imgurl1 = "https://myflexistay-dev-icons.s3.ap-south-1.amazonaws.com/48+%C3%97+48+area+in+64+%C3%97+64+(xhdpi)-18.png"
    let imgurl2 = "https://myflexistay-dev-icons.s3.ap-south-1.amazonaws.com/Icons/Back1+48+%C3%97+48+area+in+64+%C3%97+64+(xhdpi)-14.png"
    let imgurl3 = "https://myflexistay-dev-icons.s3.ap-south-1.amazonaws.com/Other+Icons-04.png"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        img1.posting(urlstring: imgurl1)
        img2.posting(urlstring: imgurl2)
        img3.posting(urlstring: imgurl3)
        view1.layer.cornerRadius = 40
        btn1.layer.borderColor = UIColor.gray.cgColor
        btn1.layer.cornerRadius = 10
        btn1.layer.borderWidth = 1
        
        btn2.layer.borderColor = UIColor.gray.cgColor
        btn2.layer.cornerRadius = 10
        btn2.layer.borderWidth = 1
    }
}
    extension UIImageView {
        func posting(urlstring: String) {
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
