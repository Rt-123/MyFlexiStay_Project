//
//  Property Details.swift
//  My FlexiStay
//
//  Created by Apple on 09/10/20.
//  Copyright © 2020 MacFreak's  "Rt". All rights reserved.
//

import UIKit

class Property_Details: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var txt1: UITextField!
    @IBOutlet weak var txt2: UITextField!
    @IBOutlet weak var txt3: UITextField!
    @IBOutlet weak var txt4: UITextField!
    @IBOutlet weak var txt5: UITextField!
    @IBOutlet weak var txt6: UITextField!
    @IBOutlet weak var txt7: UITextField!
    @IBOutlet weak var txt8: UITextField!
    @IBOutlet weak var txt9: UITextField!
    @IBOutlet weak var btn1: UIButton!
    
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img1: UIImageView!
//    var picker = UIPickerView()
    
    
//    let villaname = ["Apartment", "Independant House/Villa", "Gated community Villa"]
//    let villaname1 = ["Demo", "Data", "House"]
//    let villaname2 = ["1BHK", "2BHK", "3BHK", "4BHK"]
//    let villanme3 = ["1Rk", "2Rk", "3Rk", "4Rk"]
    
//    var villa = [[String]]()
//    var aprview = UIPickerView()
//    var bhkview = UIPickerView()
//    var floortype = UIPickerView()
//    var totalfloor = UIPickerView()
//
    let imgn1 = "https://myflexistay-dev-icons.s3.ap-south-1.amazonaws.com/48+%C3%97+48+area+in+64+%C3%97+64+(xhdpi)-18.png"
    let imgn2 = "https://myflexistay-dev-icons.s3.ap-south-1.amazonaws.com/Icons/Back1+48+%C3%97+48+area+in+64+%C3%97+64+(xhdpi)-14.png"
    
    var customview = UIView()
       var textfield = UITextField()
       var pickerview = UIPickerView()
       var arrData = [[String]]()
       
       var isOpenCustomview:Bool = false
       var customviewBottomAnchor:NSLayoutConstraint!
       var activetextfield = UITextField()
       var activevlue = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        loadAndSetupCustomview()
        loadAndSetupTextFieldAndPickerView()
        setButtonToRightSideOfTextField()
              
              arrData = [[]]
        
        img1.Property(urlstring: imgn1)
        img2.Property(urlstring: imgn2)
        btn1.layer.cornerRadius = 13
        txt1.layer.borderWidth = 1
        txt1.layer.borderColor = UIColor.darkGray.cgColor
        txt2.layer.borderWidth = 1
        txt2.layer.borderColor = UIColor.darkGray.cgColor
        txt3.layer.borderWidth = 1
        txt3.layer.borderColor = UIColor.darkGray.cgColor
        txt4.layer.borderWidth = 1
        txt4.layer.borderColor = UIColor.darkGray.cgColor
        txt5.layer.borderWidth = 1
        txt5.layer.borderColor = UIColor.darkGray.cgColor
        txt6.layer.borderWidth = 1
        txt6.layer.borderColor = UIColor.darkGray.cgColor
        txt7.layer.borderWidth = 1
        txt7.layer.borderColor = UIColor.darkGray.cgColor
        txt8.layer.borderWidth = 1
        txt8.layer.borderColor = UIColor.darkGray.cgColor
        txt9.layer.borderWidth = 1
        txt9.layer.borderColor = UIColor.darkGray.cgColor
        txt1.layer.cornerRadius = 10
        txt2.layer.cornerRadius = 10
        txt3.layer.cornerRadius = 10
        txt4.layer.cornerRadius = 10
        txt5.layer.cornerRadius = 10
        txt6.layer.cornerRadius = 10
        txt7.layer.cornerRadius = 10
        txt8.layer.cornerRadius = 10
        txt9.layer.cornerRadius = 10
        
        txt1.delegate = self
         txt2.delegate = self
         txt3.delegate = self
         txt6.delegate = self
         txt7.delegate = self
         txt8.delegate = self
//        aprview.dataSource = self
        txt4.delegate = self
//        bhkview.dataSource = self
        txt5.delegate = self
//        floortype.dataSource = self
        txt9.delegate = self
//        totalfloor.dataSource = self
        
//        txt1.inputView = aprview
//        txt4.inputView = bhkview
//        txt5.inputView = floortype
//        txt9.inputView = totalfloor

//        picker.delegate = self
//        picker.dataSource = self
//       // txt1.inputView = picker
//        txt1.delegate = self
//        txt2.delegate = self
//        villa = [["Apartment", "Independant House/Villa", "Gated community Villa"],
//                ["Apartment", "Independant House/Villa", "Gated community Villa"],
//                ["Apartment", "Independant House/Villa", "Gated community Villa"]
//]
//        aprview.tag = 1
//        bhkview.tag = 2
//        floortype.tag = 3
//        totalfloor.tag = 4

        
    }
     func textFieldDidBeginEditing(_ textField: UITextField) {
            self.arrData.removeAll()
            
            switch textField {
            case self.txt1:
                self.textfield.text = "Select Apartment Type"
                isOpenCustomview = true
                self.arrData.append(["Apartment","Independent House/villa","Gated community villa"])
                activetextfield = self.txt1
            case self.txt3:
                self.textfield.text = "Select BHK Type"
                isOpenCustomview = true
                self.arrData.append(["1Rk", "1BHK", "2BHK", "3BHK"])
                activetextfield = self.txt3
            case self.txt4:
                self.textfield.text = "Select Floor*"
                isOpenCustomview = true
                self.arrData.append(["1", "2", "3", "4","5"])
                activetextfield = self.txt4
            case self.txt5:
                self.textfield.text = "Select Floor"
                isOpenCustomview = true
                self.arrData.append(["1", "2", "3", "4", "5"])
                activetextfield = self.txt5
            case self.txt6:
                self.textfield.text = "Select property Age*"
                isOpenCustomview = true
                self.arrData.append(["Under Construction", "Less than a Year","1 to 3 Year"])
                activetextfield = self.txt6
            case self.txt9:
                textfield.text = "Select Floor"
                isOpenCustomview = true
                self.arrData.append(["North", "East", "South", "West"])
                activetextfield = self.txt9
            default:
                print("another selected")
                isOpenCustomview = false
                self.arrData.append([])
            }

            if isOpenCustomview{
                UIView.animate(withDuration: 1, delay: 0, options: .transitionCrossDissolve, animations: {
                    self.customviewBottomAnchor.isActive = false
                    self.customviewBottomAnchor = self.customview.bottomAnchor.constraint(equalTo: self.btn1.topAnchor, constant: -8)
                    self.customviewBottomAnchor.isActive = true
                    self.view.layoutIfNeeded()
                }, completion: nil)
            }else{
                UIView.animate(withDuration: 1, delay: 0, options: .transitionCrossDissolve, animations: {
                    self.customviewBottomAnchor.isActive = false
                    self.customviewBottomAnchor = self.customview.bottomAnchor.constraint(equalTo: self.btn1.topAnchor, constant: 250)
                    self.customviewBottomAnchor.isActive = true
                    self.view.layoutIfNeeded()
                }, completion: nil)
            }
            self.pickerview.reloadAllComponents()
            
        }
    
        func loadAndSetupCustomview(){
            customview.backgroundColor = UIColor(red: 232/255, green: 232/255, blue: 232/255, alpha: 1)
            self.view.addSubview(customview)
            
            customview.translatesAutoresizingMaskIntoConstraints = false
            self.customviewBottomAnchor = customview.bottomAnchor.constraint(equalTo: btn1.topAnchor, constant: 250)
            self.customviewBottomAnchor.isActive = true
            customview.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
            customview.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
            customview.heightAnchor.constraint(equalToConstant: 150).isActive = true
        }
        
        func loadAndSetupTextFieldAndPickerView(){
            textfield.backgroundColor = .lightGray
            textfield.textAlignment = .center
            self.customview.addSubview(textfield)
            textfield.translatesAutoresizingMaskIntoConstraints = false
            textfield.topAnchor.constraint(equalTo: self.customview.topAnchor, constant: 0).isActive = true
            textfield.leadingAnchor.constraint(equalTo: self.customview.leadingAnchor, constant: 0).isActive = true
            textfield.trailingAnchor.constraint(equalTo: self.customview.trailingAnchor, constant: 0).isActive = true
            textfield.heightAnchor.constraint(equalToConstant: 34).isActive = true
            
            
            pickerview.delegate = self
            pickerview.dataSource = self
            self.customview.addSubview(pickerview)
            pickerview.translatesAutoresizingMaskIntoConstraints = false
            pickerview.topAnchor.constraint(equalTo: self.textfield.bottomAnchor, constant: 8).isActive = true
            pickerview.leadingAnchor.constraint(equalTo: self.customview.leadingAnchor, constant: 8).isActive = true
            pickerview.trailingAnchor.constraint(equalTo: self.customview.trailingAnchor, constant: 8).isActive = true
            pickerview.bottomAnchor.constraint(equalTo: self.customview.bottomAnchor, constant: -8).isActive = true
            
        }
        
        func setButtonToRightSideOfTextField(){
                var doneBtn = UIButton(type: .custom)
                doneBtn.setTitle("Done  ", for: .normal)
                doneBtn.setTitleColor(.blue, for: .normal)
                doneBtn.addTarget(self, action: #selector(doneBtnClick(_:)), for: .touchUpInside)
                
                textfield.rightViewMode = .always
                textfield.rightView = doneBtn
            }
        
        @objc func doneBtnClick(_ sender:UIButton){
                print("Done click")
            activetextfield.text = activevlue
            }
        
        
        
    }

    extension Property_Details:UIPickerViewDelegate,UIPickerViewDataSource{
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
        
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return self.arrData[0].count
        }
        
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return self.arrData[0][row]
        }
        
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            
            print(self.arrData[0][row])
            self.textfield.text = "\(self.arrData[0][row])"
            activevlue = self.arrData[0][row]
        }
    
    
}

extension UITextField {
    func txtfield() {
//    txt1.layer.borderColor = UIColor.black.cgColor
    self.layer.borderColor = UIColor.darkGray.cgColor
    self.layer.shadowOpacity = 1.0
    }
}

extension UIImageView {
    func Property(urlstring : String) {
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

//extension Property_Details : UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate{
//
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1
//    }
//
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        switch pickerView.tag {
//        case 1:
//            return villaname.count
//        case 2:
//            return villaname1.count
//        case 3:
//            return villaname2.count
//        case 4:
//            return villanme3.count
//        default:
//            return 1
//        }
//    }
//
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        switch pickerView.tag {
//     case 1:
//         return villaname[row]
//     case 2:
//         return villaname1[row]
//     case 3:
//         return villaname2[row]
//     case 4:
//         return villanme3[row]
//     default:
//         return "Data not found"
//     }
//
//    }
//
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        switch pickerView.tag {
//            case 1:
//                txt1.text = villaname[row]
//                txt1.resignFirstResponder()
//            case 2:
//                 txt4.text = villaname1[row]
//                 txt4.resignFirstResponder()
//            case 3:
//                txt5.text = villaname2[row]
//                txt5.resignFirstResponder()
//            case 4:
//                 txt9.text = villanme3[row]
//                txt9.resignFirstResponder()
//            default:
//                return
//  }
//    }
//
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        if textField == txt1{
//                  print("txt1")
//        }
//        else if textField == txt2{
//            print("txt2")
//        }
//    }
//
        
    
    

//let citiesname = ["CapeTown", "Firefox", "Demo", "Ahmadabad", "Mumbai"]
//var pickerview = UIPickerView()
//
//
//@IBOutlet weak var cities : UITextField!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        pickerview.delegate = self
//        pickerview.dataSource = self
//        citiesfield.inputView = pickerview
//        citiesfield.placeholder = "PickerView"
//}
//func numberOfComponents(in pickerView: UIPickerView) -> Int {
//    return 1
//}
//
//func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//    return citiesname.count
//}
//
//func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//    return citiesname[row]
//}
//
//func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//    citiesfield.text = citiesname[row]
//    citiesfield.resignFirstResponder()
//}
