//
//  Profile Page.swift
//  My FlexiStay
//
//  Created by Apple on 07/10/20.
//  Copyright © 2020 MacFreak's  "Rt". All rights reserved.
//

import UIKit

class Profile_Page: UIViewController {
    @IBOutlet weak var wish: UIButton!
    @IBOutlet weak var uiview2: UIView!
    
    @IBOutlet weak var uiview1: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getProfile()
        uiview1.layer.cornerRadius = 35
        uiview2.layer.cornerRadius = 35

    }
    
    func getProfile(){

     let url1 = URL(string: "https://acabc9536i.execute-api.ap-south-1.amazonaws.com/development/getProfile")
     var dict : [String:Any] = [
    "token": "gmxguQrLozCrAZ45tSD0vAce2eK7OQc6Q11k1LG1QVnzeUo4syOflqU9ocr48Nix"]
             let session = URLSession.shared
             var request = URLRequest(url: url1!)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
             request.httpMethod = "POST"
             request.httpBody = try?
             JSONSerialization.data(withJSONObject: dict, options: [])
             session.dataTask(with: request) { (read, response, error) in
             if let data = read{
             do{
         guard  let jsonResponse = try? JSONSerialization.jsonObject(with: data, options: [])  else {return}
         dict = jsonResponse as! [String:Any]
         DispatchQueue.main.async {
         print(jsonResponse)
         }
     }catch{
     print(error.localizedDescription)
      }
     }
         }.resume()
     }

}
//tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
//    let str="http://bitcodetech.in/android/getAllPeople.php?cmd=get"
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

