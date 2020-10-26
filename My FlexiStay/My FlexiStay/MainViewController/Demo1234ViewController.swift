//
//  Demo1234ViewController.swift
//  My FlexiStay
//
//  Created by Apple on 19/10/20.
//  Copyright © 2020 MacFreak's  "Rt". All rights reserved.
//

import UIKit

class Demo1234ViewController: UIViewController {
    
    @IBOutlet weak var date1: UIDatePicker!
    
    @IBOutlet weak var cities : UITextField!
//    let datepicker2 = UIDatePicker()

        override func viewDidLoad() {
            super.viewDidLoad()
            
            date1.datePickerMode = .date
//          createdatepicker()
    }
//    func createdatepicker() {
//        cities.textAlignment = .center
//
//        //toolbar
//        let toolbar = UIToolbar()
//        toolbar.sizeToFit()
//
//        let donebtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donepressed))
//        toolbar.setItems([donebtn], animated: true)
//
//        cities.inputAccessoryView = toolbar
//        cities.inputView = datepicker2
//    }
//    @objc func donepressed() {
//        let formatter = DateFormatter()
//        formatter.dateStyle = .medium
//        formatter.timeStyle = .none
//
//        cities.text = formatter.string(from: datepicker2.date)
//        self.view.endEditing(true)
//    }
}
   
