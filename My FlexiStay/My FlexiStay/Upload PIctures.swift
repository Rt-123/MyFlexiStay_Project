//
//  Upload PIctures.swift
//  My FlexiStay
//
//  Created by Apple on 10/10/20.
//  Copyright © 2020 MacFreak's  "Rt". All rights reserved.
//

import UIKit

class Upload_PIctures: UIViewController {

    @IBOutlet weak var detailv: UIView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var mainv: UIView!
    @IBOutlet weak var uploadbtn: UIButton!
    
    @IBOutlet weak var subbtn: UIButton!
    let imgurl = "https://myflexistay-dev-icons.s3.ap-south-1.amazonaws.com/48+%C3%97+48+area+in+64+%C3%97+64+(xhdpi)-18.png"
    let imgurl2 = "https://myflexistay-dev-icons.s3.ap-south-1.amazonaws.com/Icons/Back1+48+%C3%97+48+area+in+64+%C3%97+64+(xhdpi)-14.png"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        subbtn.layer.cornerRadius = 17
        detailv.layer.cornerRadius = 40
        img1.upload(urlstring: imgurl)
        img2.upload(urlstring: imgurl2)
        
        uploadbtn.layer.cornerRadius = 10
        mainv.layer.borderWidth = 1
        mainv.layer.cornerRadius = 20
        mainv.layer.borderColor = UIColor.blue.cgColor
        
    }
    

  

}
extension UIImageView {
    func upload(urlstring : String) {
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
