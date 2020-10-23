//
//  HomePage.swift
//  My FlexiStay
//
//  Created by Apple on 30/09/20.
//  Copyright © 2020 MacFreak's  "Rt". All rights reserved.
//

import UIKit

class HomePage: UIViewController {
    
    @IBOutlet var viewmodel: UIView!
    
    @IBOutlet weak var textfield: UISearchBar!
    @IBOutlet weak var imgview1: UIImageView!
    @IBOutlet weak var imgname3: UIImageView!
    
    @IBOutlet weak var imgname2: UIImageView!
    @IBOutlet weak var imgname1: UIImageView!
    @IBOutlet weak var maindata: UIView!
    @IBOutlet weak var postsbtn: UIButton!
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img3: UIImageView!
    @IBOutlet weak var img4: UIImageView!
    
    let chatimg = "https://myflexistay-dev-icons.s3.ap-south-1.amazonaws.com/Icons/CHAT+48+%C3%97+48+area+in+64+%C3%97+64+(xhdpi)-05.png"
    let profileimg = "https://myflexistay-dev-icons.s3.ap-south-1.amazonaws.com/Icons/Pro+48+%C3%97+48+area+in+64+%C3%97+64+(xhdpi)-09.png"
    let upimg = "https://myflexistay-dev-icons.s3.ap-south-1.amazonaws.com/Icons/UP+48+%C3%97+48+area+in+64+%C3%97+64+(xhdpi)-07.png"
    let homeimg = "https://myflexistay-dev-icons.s3.ap-south-1.amazonaws.com/Icons/HOME+48+%C3%97+48+area+in+64+%C3%97+64+(xhdpi)-03.png"
    
    let imgurl = "https://myflexistay-dev-icons.s3.ap-south-1.amazonaws.com/Other+Icons-01.png"
    let imgurl2 = "https://myflexistay-dev-icons.s3.ap-south-1.amazonaws.com/Other+Icons-02.png"
    let imgurl3 = "https://myflexistay-dev-icons.s3.ap-south-1.amazonaws.com/Other+Icons-03.png"
//    @IBOutlet weak var segment: UISegmentedControl!
//    @IBOutlet weak var post: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        viewmodel.backgroundColor = UIColor(named: "#2FC591")
        imgname1.load(urlstring: imgurl)
        imgname2.load(urlstring: imgurl2)
        imgname3.load(urlstring: imgurl3)
        img1.load(urlstring: homeimg)
        img2.load(urlstring: chatimg)
        img3.load(urlstring: upimg)
        img4.load(urlstring: profileimg)
        
        textfield.layer.borderWidth = 1
        textfield.layer.borderColor = UIColor.gray.cgColor
        textfield.layer.cornerRadius = 18
         
//        segment.tintColor = .white
        
//        post.layer.cornerRadius = 8
        imgview1.layer.cornerRadius = 35
        maindata.layer.cornerRadius = 35
        postsbtn.layer.cornerRadius = 12
//
    }
    

    
    @IBAction func postbtn(_ sender: Any) {
    }



}

extension UIImageView {
    func load(urlstring : String) {
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
