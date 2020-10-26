//
//  Amenities.swift
//  My FlexiStay
//
//  Created by Apple on 10/10/20.
//  Copyright © 2020 MacFreak's  "Rt". All rights reserved.
//

import UIKit

class Amenities: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var txt1: UITextField!
    @IBOutlet weak var savebtn: UIButton!
    @IBOutlet weak var txt2: UITextField!
    @IBOutlet weak var txt3: UITextField!
    @IBOutlet weak var txt4: UITextField!
        @IBOutlet weak var txt5: UITextField!
    @IBOutlet weak var txt6: UITextField!
    @IBOutlet weak var txt7: UITextField!
    @IBOutlet weak var txt8: UITextField!
    @IBOutlet weak var txt9: UITextField!
    @IBOutlet weak var txt10: UITextField!
    @IBOutlet weak var txt11: UITextField!
    @IBOutlet weak var txt12: UITextField!
    @IBOutlet weak var txt13: UITextField!
    @IBOutlet weak var txt14: UITextField!
    @IBOutlet weak var txt15: UITextField!
    @IBOutlet weak var txt16: UITextField!
    @IBOutlet weak var txt17: UITextField!
    @IBOutlet weak var txt18: UITextField!
    @IBOutlet weak var txt19: UITextField!
    @IBOutlet weak var txt20: UITextField!
    @IBOutlet weak var txt21: UITextField!
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var view1: UIView!
    
    let imgurl = "https://myflexistay-dev-icons.s3.ap-south-1.amazonaws.com/48+%C3%97+48+area+in+64+%C3%97+64+(xhdpi)-18.png"
    let imgurl2 = "https://myflexistay-dev-icons.s3.ap-south-1.amazonaws.com/Icons/Back1+48+%C3%97+48+area+in+64+%C3%97+64+(xhdpi)-14.png"
        
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

        img1.Amenities(urlstring: imgurl)
        img2.Amenities(urlstring: imgurl2)
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
        txt4.layer.borderWidth = 1
        txt4.layer.borderColor = UIColor.gray.cgColor
        txt4.layer.cornerRadius = 10
        txt5.layer.borderWidth = 1
        txt5.layer.borderColor = UIColor.gray.cgColor
        txt5.layer.cornerRadius = 10
        txt6.layer.borderWidth = 1
        txt6.layer.borderColor = UIColor.gray.cgColor
        txt6.layer.cornerRadius = 10
        txt7.layer.borderWidth = 1
        txt7.layer.borderColor = UIColor.gray.cgColor
        txt7.layer.cornerRadius = 10
        txt8.layer.borderWidth = 1
        txt8.layer.borderColor = UIColor.gray.cgColor
        txt8.layer.cornerRadius = 10
        txt9.layer.borderWidth = 1
        txt9.layer.borderColor = UIColor.gray.cgColor
        txt9.layer.cornerRadius = 10
        txt10.layer.borderWidth = 1
        txt10.layer.borderColor = UIColor.gray.cgColor
        txt10.layer.cornerRadius = 10
        txt11.layer.borderWidth = 1
        txt11.layer.borderColor = UIColor.gray.cgColor
        txt11.layer.cornerRadius = 10
        txt12.layer.borderWidth = 1
        txt12.layer.borderColor = UIColor.gray.cgColor
        txt12.layer.cornerRadius = 10
        txt13.layer.borderWidth = 1
        txt13.layer.borderColor = UIColor.gray.cgColor
        txt13.layer.cornerRadius = 10
        txt14.layer.borderWidth = 1
        txt14.layer.borderColor = UIColor.gray.cgColor
        txt14.layer.cornerRadius = 10
        txt15.layer.borderWidth = 1
        txt15.layer.borderColor = UIColor.gray.cgColor
        txt15.layer.cornerRadius = 10
        txt16.layer.borderWidth = 1
        txt16.layer.borderColor = UIColor.gray.cgColor
        txt16.layer.cornerRadius = 10
        txt17.layer.borderWidth = 1
        txt17.layer.borderColor = UIColor.gray.cgColor
        txt17.layer.cornerRadius = 10
        txt18.layer.borderWidth = 1
        txt18.layer.borderColor = UIColor.gray.cgColor
        txt18.layer.cornerRadius = 10
        txt19.layer.borderWidth = 1
        txt19.layer.borderColor = UIColor.gray.cgColor
        txt19.layer.cornerRadius = 10
        txt20.layer.borderWidth = 1
        txt20.layer.borderColor = UIColor.gray.cgColor
        txt20.layer.cornerRadius = 10
        txt21.layer.borderWidth = 1
        txt21.layer.borderColor = UIColor.gray.cgColor
        txt21.layer.cornerRadius = 10
        txt2.delegate = self

        
    }
        func textFieldDidBeginEditing(_ textField: UITextField) {
                self.arrData.removeAll()
                
                switch textField {
                  case self.txt2 :
                    isOpenCustomview = true
                    textfield.text = "Water Supply"
                    arrData.append(["24/7 Available", "Limited Supply"])
                    activetextfield = self.txt2
                    
                default:
                    print("another selected")
                    isOpenCustomview = false
                    self.arrData.append([])
                }

                if isOpenCustomview{
                    UIView.animate(withDuration: 1, delay: 0, options: .transitionCrossDissolve, animations: {
                        self.customviewBottomAnchor.isActive = false
                        self.customviewBottomAnchor = self.customview.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -8)
                        self.customviewBottomAnchor.isActive = true
                        self.view.layoutIfNeeded()
                    }, completion: nil)
                }else{
                    UIView.animate(withDuration: 1, delay: 0, options: .transitionCrossDissolve, animations: {
                        self.customviewBottomAnchor.isActive = false
                        self.customviewBottomAnchor = self.customview.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 250)
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
                self.customviewBottomAnchor = customview.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 250)
                self.customviewBottomAnchor.isActive = true
                customview.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
                customview.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
                customview.heightAnchor.constraint(equalToConstant: 200).isActive = true
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
                pickerview.bottomAnchor.constraint(equalTo: self.customview.bottomAnchor, constant: -20).isActive = true
                
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

        extension Amenities:UIPickerViewDelegate,UIPickerViewDataSource{
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
//                self.textfield.text = "\(self.arrData[0][row])"
                activevlue = self.arrData[0][row]
            }
}
extension UIImageView {
    func Amenities(urlstring : String) {
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

//tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
//    let str=""
//
//    var urlrequest=URLRequest(url: URL(string: str)!)
//    urlrequest.httpMethod="GET"
//    let config = URLSessionConfiguration.default
//    let sessionobj=URLSession(configuration: config)
//    let task=sessionobj.dataTask(with: urlrequest){(data, method, error)in
//
//        let resultdic=try!
//    JSONSerialization.jsonObject(with: data!, options: .allowFragments)as! NSDictionary
//
//        var status = resultdic.value(forKey:"status")as! String
//        var resultarray = resultdic.value(forKey: "result")as! NSArray
//
//        for obj in resultarray{
//            var dicobj=obj as! NSDictionary
//            var pname=dicobj.value(forKey:"person_name")as! String
//            var pemail = dicobj.value(forKey: "person_email")as! String
//            var plat = dicobj.value(forKey: "person_lat")as! String
//            self.pnamearray.append(pname)
//            self.pnamearray.append(pemail)
//            self.pnamearray.append(plat)
//        }
//        DispatchQueue.main.async{
//            self.tableView.reloadData()
//        }
//
//    }
//    task.resume()
//}
//
//
//override func numberOfSections(in tableView: UITableView) -> Int {
//    // #warning Incomplete implementation, return the number of sections
//    return 1
//}
//
//override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//    // #warning Incomplete implementation, return the number of rows
//    return pnamearray.count
//}
//
//
//override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//    let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)
//
//
//    cell.textLabel?.text = pnamearray[indexPath.row]
//    cell.textLabel?.text = pnamearray[indexPath.row]
//    cell.textLabel?.text = pnamearray[indexPath.row]
//
//
//
//    return cell
//}
