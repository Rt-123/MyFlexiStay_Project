//
//  Upload PIctures.swift
//  My FlexiStay
//
//  Created by Apple on 10/10/20.
//  Copyright © 2020 MacFreak's  "Rt". All rights reserved.
//

import UIKit

var indexPathRow = 0
var imageArr = [UIImage]()
class UploadController: UIViewController{

    @IBOutlet weak var photoUploaded: UILabel!
    @IBOutlet weak var detailv: UIView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var mainv: UIView!
    @IBOutlet weak var uploadbtn: UIButton!
    @IBOutlet weak var secondViewHeight: NSLayoutConstraint!
    @IBOutlet weak var mainViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var lineView: UIView!
    @IBOutlet weak var subbtn: UIButton!
    let imgurl = "https://myflexistay-dev-icons.s3.ap-south-1.amazonaws.com/48+%C3%97+48+area+in+64+%C3%97+64+(xhdpi)-18.png"
    let imgurl2 = "https://myflexistay-dev-icons.s3.ap-south-1.amazonaws.com/Icons/Back1+48+%C3%97+48+area+in+64+%C3%97+64+(xhdpi)-14.png"
    
    @IBOutlet weak var collectionViewRef: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        subbtn.layer.cornerRadius = 17
        detailv.layer.cornerRadius = 40
//        img1.upload(urlstring: imgurl)
//        img2.upload(urlstring: imgurl2)
        
        uploadbtn.layer.cornerRadius = 10
        mainv.layer.borderWidth = 1
        mainv.layer.cornerRadius = 20
        mainv.layer.borderColor = UIColor.blue.cgColor
        mainViewHeight.constant = 180
        secondViewHeight.constant = 0
        lineView.isHidden = true
        collectionViewRef.register(UINib(nibName: "UploadImageCell", bundle: .main), forCellWithReuseIdentifier: "UploadImageCell")
        photoUploaded.isHidden = true
    }
    

    @IBAction func uploadClick(_ sender: UIButton) {
               photoUploaded.isHidden = false

        mainViewHeight.constant = 370
               secondViewHeight.constant = 200
               lineView.isHidden = false
        let imageController = UIImagePickerController()
          imageController.delegate = self
          imageController.sourceType = UIImagePickerController.SourceType.photoLibrary
        //  collectionRef.reloadData()
          present(imageController, animated: true, completion: nil)
        collectionViewRef.reloadData()

          
    }
    

}
//extension UIImageView {
//    func upload(urlstring : String) {
//        guard let url = URL(string: urlstring)else {
//            return
//        }
//        DispatchQueue.global().async { [weak self] in
//
//            if let data = try? Data(contentsOf: url) {
//                if let image = UIImage(data: data) {
//                    DispatchQueue.main.async {
//                        self?.image = image
//                    }
//                }
//            }
//        }
//    }
//}

extension UploadController:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{

       func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            if  imageArr.isEmpty {
                         return 3
                       }else{
                return imageArr.count
                
        }
                       
        }
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {


             let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UploadImageCell", for: indexPath) as? UploadImageCell
            cell?.removeBtn.addTarget(self, action: #selector(removeSelectItem(sender:)), for: .touchUpInside)
            cell?.removeBtn.tag = indexPath.row
            cell?.layer.cornerRadius = 10
            
            
            cell?.clipsToBounds = true
            cell?.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            cell?.layer.borderWidth = 1
            if imageArr.isEmpty{

                cell?.uploadImage.image = UIImage(named: "blank-photo")

            }else{
                cell!.uploadImage.image = imageArr[indexPath.row]
          }

            return cell!
        }
       
        @objc func removeSelectItem(sender:UIButton){
            collectionViewRef.reloadData()
            imageArr.remove(at: sender.tag)
        }

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: floor((collectionView.frame.size.width-40)/3), height: floor((collectionView.frame.size.width-40)/3))
        }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 5
        }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            5
        }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        }

    }
   
extension UploadController:UINavigationControllerDelegate,UIImagePickerControllerDelegate{


        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
             let selectImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            //        self.dismiss(animated: true, completion: nil)

            
            imageArr.append(selectImage!)

            print(imageArr.count)
            picker.dismiss(animated: true, completion: nil)
            collectionViewRef.reloadData()
        }
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true, completion: nil)
        }
    
    
}



