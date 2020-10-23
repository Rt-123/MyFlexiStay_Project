//
//  PostView.swift
//  My FlexiStay
//
//  Created by Apple on 03/10/20.
//  Copyright © 2020 MacFreak's  "Rt". All rights reserved.
//

import UIKit

class PostView: UIViewController {
    @IBOutlet weak var postview: UIView!
    
    @IBOutlet weak var savebtn: UIButton!
    @IBOutlet weak var resalebtn: UIButton!
    @IBOutlet weak var flatbtn: UIButton!
    @IBOutlet weak var rentbtn: UIButton!
    @IBOutlet weak var pgbtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        postview.layer.cornerRadius = 35
        rentbtn.layer.cornerRadius = 8
        savebtn.layer.cornerRadius = 8
        pgbtn.layer.cornerRadius = 8
        flatbtn.layer.cornerRadius = 8
        resalebtn.layer.cornerRadius = 8
        
        
    }
    

 
}
