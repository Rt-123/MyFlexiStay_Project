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
