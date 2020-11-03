//
//  Schedule.swift
//  My FlexiStay
//
//  Created by Apple on 12/10/20.
//  Copyright © 2020 MacFreak's  "Rt". All rights reserved.
//

import UIKit

class Schedule: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var savebtn: UIButton!
    @IBOutlet weak var txt1: UITextField!
    @IBOutlet weak var txt2: UITextField!
    @IBOutlet weak var txt3: UITextField!
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var view1: UIView!
    
    let imgurl = "https://myflexistay-dev-icons.s3.ap-south-1.amazonaws.com/48+%C3%97+48+area+in+64+%C3%97+64+(xhdpi)-18.png"
    let imgurl2 = "https://myflexistay-dev-icons.s3.ap-south-1.amazonaws.com/Icons/Back1+48+%C3%97+48+area+in+64+%C3%97+64+(xhdpi)-14.png"
    
    ///Drop Down List
    var customview = UIView()
      var textfield = UITextField()
      var pickerview = UIPickerView()
      var arrData = [[String]]()
      var isOpenCustomview:Bool = false
      var customviewBottomAnchor:NSLayoutConstraint!
      var activetextfield = UITextField()
      var activevlue = String()
    var newInstance = NetworkManager()
    
    var schedulePostDatapass = postAPIManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        ///Drop Down list
        loadAndSetupCustomview()
        loadAndSetupTextFieldAndPickerView()
        setButtonToRightSideOfTextField()
        arrData = [[]]
        
        img2.schedule(urlstring: imgurl)
        img1.schedule(urlstring: imgurl2)
        view1.layer.cornerRadius = 40
        savebtn.layer.cornerRadius = 17
        txt1.layer.borderWidth = 1
        txt1.layer.borderColor = UIColor.gray.cgColor
        txt1.layer.cornerRadius = 10
        
        txt2.layer.borderWidth = 1
        txt2.layer.borderColor = UIColor.gray.cgColor
        txt2.layer.cornerRadius = 10
        
        txt3.layer.borderWidth = 1
        txt3.layer.borderColor = UIColor.gray.cgColor
        txt3.layer.cornerRadius = 10
        
        txt1.delegate = self
        txt2.delegate = self
        txt3.delegate = self
        pickerview.selectRow(1, inComponent: 0, animated: true)
 
      //  print(newInstance.CallGetAPI(urlstring: ApiURL.availabilityTypeLink))
        schedulePostDatapass.allPostAPICall(urlString: postAPILinks.createUpadatescheduleLnik, parameters: PostAPIParameters.CraeteUpadtescheduleParamerter)
        
    }
    
    ///Drop Down List
    func textFieldDidBeginEditing(_ textField: UITextField) {
                //  self.arrData.removeAll()
                  
                  switch textField {
                    case self.txt1 :
                      isOpenCustomview = true
                      self.txt1.text = "Availability"
                     // self.arrData.append(["Every Day(Mon-Sun)", "Weekdays(Mon-fri)", "Weekends(sat-sun)"])
                      newInstance.CallGetAPI(urlstring: ApiURL.availabilityTypeLink)
                      activetextfield = self.txt1
                      
                  default:
                      print("another selected")
                      isOpenCustomview = false
                     // self.arrData.append([])
                  }

                  if isOpenCustomview{
                      UIView.animate(withDuration: 1, delay: 0, options: .transitionCrossDissolve, animations: {
                          self.customviewBottomAnchor.isActive = false
                          self.customviewBottomAnchor = self.customview.bottomAnchor.constraint(equalTo: self.savebtn.topAnchor, constant: -8)
                          self.customviewBottomAnchor.isActive = true
                          self.view.layoutIfNeeded()
                      }, completion: nil)
                  }else{
                      UIView.animate(withDuration: 1, delay: 0, options: .transitionCrossDissolve, animations: {
                          self.customviewBottomAnchor.isActive = false
                          self.customviewBottomAnchor = self.customview.bottomAnchor.constraint(equalTo: self.savebtn.topAnchor, constant: 250)
                          self.customviewBottomAnchor.isActive = true
                          self.view.layoutIfNeeded()
                      }, completion: nil)
                  }
                  
              }
          
              func loadAndSetupCustomview(){
                  customview.backgroundColor = UIColor(red: 232/255, green: 232/255, blue: 232/255, alpha: 1)
                  self.view.addSubview(customview)
                  
                  customview.translatesAutoresizingMaskIntoConstraints = false
                  self.customviewBottomAnchor = customview.bottomAnchor.constraint(equalTo: savebtn.topAnchor, constant: 250)
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
                  textfield.heightAnchor.constraint(equalToConstant: 30).isActive = true
                  
                  
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

extension Schedule:UIPickerViewDelegate,UIPickerViewDataSource{
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
                  
            print(PropertyDetailsDataModel.NewArrData)
            self.textfield.text = "\(PropertyDetailsDataModel.NewArrData[row])"
            activevlue = PropertyDetailsDataModel.NewArrData[row]
        }
 
}

extension UIImageView {
    func schedule(urlstring: String) {
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
