//
//  Locality Details.swift
//  My FlexiStay
//
//  Created by Apple on 09/10/20.
//  Copyright © 2020 MacFreak's  "Rt". All rights reserved.
//

import UIKit

class Locality_Details: UIViewController {
    @IBOutlet weak var srchbar: UISearchBar!
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var txt1: UITextField!
    @IBOutlet weak var txt2: UITextField!
    @IBOutlet weak var txt3: UITextField!
    @IBOutlet weak var txt4: UITextField!
    @IBOutlet weak var subbtn: UIButton!
    
    let imgna1 = "https://myflexistay-dev-icons.s3.ap-south-1.amazonaws.com/48+%C3%97+48+area+in+64+%C3%97+64+(xhdpi)-18.png"
    let imgna2 = "https://myflexistay-dev-icons.s3.ap-south-1.amazonaws.com/Icons/Back1+48+%C3%97+48+area+in+64+%C3%97+64+(xhdpi)-14.png"
    override func viewDidLoad() {
        super.viewDidLoad()

        img1.local(urlstring: imgna1)
        img2.local(urlstring: imgna2)
        subbtn.layer.cornerRadius = 17
        
        srchbar.layer.borderWidth = 1
        srchbar.layer.borderColor = UIColor.gray.cgColor
        srchbar.layer.cornerRadius = 17
        txt1.layer.borderWidth = 1
        txt1.layer.borderColor = UIColor.darkGray.cgColor
        txt1.layer.cornerRadius = 10
        
        txt2.layer.borderWidth = 1
        txt2.layer.borderColor = UIColor.darkGray.cgColor
        txt2.layer.cornerRadius = 10

        txt3.layer.borderWidth = 1
        txt3.layer.borderColor = UIColor.darkGray.cgColor
        txt3.layer.cornerRadius = 10

        txt4.layer.borderWidth = 1
        txt4.layer.borderColor = UIColor.darkGray.cgColor
        txt4.layer.cornerRadius = 10

            }
    

}
extension UIImageView {
    func local(urlstring : String) {
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
// tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
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
