//
//  DemoViewController.swift
//  My FlexiStay
//
//  Created by Apple on 01/10/20.
//  Copyright © 2020 MacFreak's  "Rt". All rights reserved.
//

import UIKit

class DemoViewController: UIViewController {

//    @IBOutlet weak var name: UIView!
    @IBOutlet var views: UIView!
    
    var city = ["Demo", "Name", "pass"]
    
    override func viewDidLoad() {
        super.viewDidLoad()


        views.backgroundColor = UIColor(red: 47/255, green: 92/255, blue: 145/255, alpha: 1)
    
//        name.layer.cornerRadius = 30
        // Do any additional setup after loading the view.
    }
    
    @IBAction func txt1(_ sender: UITextField) {
        UIView.animate(withDuration: 0.2) {
            print(self.city)
            self.city = ["nksjn"]
        }
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
}
