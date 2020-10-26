//
//  Posting done.swift
//  My FlexiStay
//
//  Created by Apple on 12/10/20.
//  Copyright © 2020 MacFreak's  "Rt". All rights reserved.
//

import UIKit

class Posting_done: UIViewController {
    
    @IBOutlet weak var img3: UIImageView!
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var view1: UIView!
    
    let imgurl1 = "https://myflexistay-dev-icons.s3.ap-south-1.amazonaws.com/48+%C3%97+48+area+in+64+%C3%97+64+(xhdpi)-18.png"
    let imgurl2 = "https://myflexistay-dev-icons.s3.ap-south-1.amazonaws.com/Icons/Back1+48+%C3%97+48+area+in+64+%C3%97+64+(xhdpi)-14.png"
    let imgurl3 = "https://myflexistay-dev-icons.s3.ap-south-1.amazonaws.com/Other+Icons-04.png"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        img1.posting(urlstring: imgurl1)
        img2.posting(urlstring: imgurl2)
        img3.posting(urlstring: imgurl3)
        view1.layer.cornerRadius = 40
        btn1.layer.borderColor = UIColor.gray.cgColor
        btn1.layer.cornerRadius = 10
        btn1.layer.borderWidth = 1
        
        btn2.layer.borderColor = UIColor.gray.cgColor
        btn2.layer.cornerRadius = 10
        btn2.layer.borderWidth = 1
    }
}
    extension UIImageView {
        func posting(urlstring: String) {
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

