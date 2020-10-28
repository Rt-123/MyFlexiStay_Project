//
//  Property Details.swift
//  My FlexiStay
//
//  Created by Apple on 09/10/20.
//  Copyright © 2020 MacFreak's  "Rt". All rights reserved.
//

import UIKit

class Property_Details: UIViewController,UITextFieldDelegate{
    
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
    
    var CommontextFields = [UITextField]()
    
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
    
    
    var networkManageClassInatnace = NetworkManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //txt1.addTarget(self, action: #selector(validOrNot(sender:)), for: .touchUpInside)
        
        
        networkManageClassInatnace.CallGetAPI(urlstring: ApiURL.propertyDetailsLink)
        
        loadAndSetupCustomview()
        loadAndSetupTextFieldAndPickerView()
        setButtonToRightSideOfTextField()
        
        CommontextFields = [txt1, txt2,txt3, txt4, txt5, txt6, txt7,txt8,txt9]
        CommontextFields.forEach {
            $0.delegate = self
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.darkGray.cgColor
            $0.layer.cornerRadius = 10
            
        }
        img1.Property(urlstring: imgn1)
        img2.Property(urlstring: imgn2)
        btn1.layer.cornerRadius = 13
        
        
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // self.arrData.removeAll()
        
        switch textField {
        case self.txt1:
            self.textfield.text = "Select Apartment Type"
            isOpenCustomview = true
            //  self.arrData.append(["Apartment","Independent House/villa","Gated community villa"])
//            if txt1.text!.isEmpty{
//                txt1.layer.borderColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
//            }else{
//                txt1.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
//            }
            activetextfield = self.txt1
            
        case txt2:
            
            if txt1.text!.isEmpty{
                
                
                txt1.layer.borderColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
            }else{
                txt1.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            }
            activetextfield = self.txt1
        case self.txt3:
            self.textfield.text = "Select BHK Type"
            isOpenCustomview = true
            // self.arrData.append(["1Rk", "1BHK", "2BHK", "3BHK"])
            if txt2.text!.isEmpty{
                txt2.layer.borderColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
            }else{
                txt2.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            }
            
            activetextfield = self.txt3
        case self.txt4:
            self.textfield.text = "Select Floor*"
            isOpenCustomview = true
            // self.arrData.append(["1", "2", "3", "4","5"])
            
            if txt3.text!.isEmpty{
                           txt3.layer.borderColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
                       }else{
                           txt3.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                       }
            activetextfield = self.txt4
        case self.txt5:
            self.textfield.text = "Select Floor"
            isOpenCustomview = true
            // self.arrData.append(["1", "2", "3", "4", "5"])
            if txt4.text!.isEmpty{
                txt4.layer.borderColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
            }else{
                txt4.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            }
            activetextfield = self.txt5
        case self.txt6:
            self.textfield.text = "Select property Age*"
            isOpenCustomview = true
            // self.arrData.append(["Under Construction", "Less than a Year","1 to 3 Year"])
            if txt5.text!.isEmpty{
                txt5.layer.borderColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
            }else{
                txt5.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            }
            activetextfield = self.txt6
        case self.txt9:
            textfield.text = "Select Floor"
            isOpenCustomview = true
            // self.arrData.append(["North", "East", "South", "West"])
            activetextfield = self.txt9
        case txt7:
            if txt6.text!.isEmpty{
                           txt6.layer.borderColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
                       }else{
                           txt6.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                       }
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
    
    @IBAction func saveAndCotinue(_ sender: UIButton) {
      
        
        
        if txt1.text!.isEmpty{
            txt1.layer.borderColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        }else if txt2.text!.isEmpty {
          txt2.layer.borderColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        }else if txt3.text!.isEmpty{
            txt3.layer.borderColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        }else if txt4.text!.isEmpty{
            txt4.layer.borderColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        }else if txt5.text!.isEmpty{
            txt5.layer.borderColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        }else  if txt6.text!.isEmpty{
            txt6.layer.borderColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        }else{
             txt1.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
             txt2.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            txt3.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            txt4.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
             txt5.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            txt6.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        }
        

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
        return PropertyDetailsDataModel.NewArrData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return PropertyDetailsDataModel.NewArrData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        self.textfield.text = "\(PropertyDetailsDataModel.NewArrData[row])"
        activevlue = PropertyDetailsDataModel.NewArrData[row]
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



