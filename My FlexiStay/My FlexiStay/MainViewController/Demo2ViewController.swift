//
//  Demo2ViewController.swift
//  My FlexiStay
//
//  Created by Apple on 05/10/20.
//  Copyright © 2020 MacFreak's  "Rt". All rights reserved.
//

import UIKit

class Demo2ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    @IBAction func demobtn(_ sender: Any) {
        
        
        let detaildemo = self.storyboard?.instantiateViewController(identifier: "DemoViewController") as! DemoViewController
        
        self.navigationController?.pushViewController(detaildemo, animated: true)
        
        
    }
    
}
