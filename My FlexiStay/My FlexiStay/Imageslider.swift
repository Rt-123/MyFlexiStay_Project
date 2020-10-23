//
//  Imageslider.swift
//  My FlexiStay
//
//  Created by Apple on 30/09/20.
//  Copyright © 2020 MacFreak's  "Rt". All rights reserved.
//

import UIKit

class Imageslider: UIViewController {

//    @IBOutlet weak var pagedemo: UIPageControl!
    @IBOutlet weak var collect: UICollectionView!
//    @IBOutlet weak var pagedata: UIPageControl!
//    @IBOutlet weak var imgslide: UICollectionView!
    
    
    var imgdata = [#imageLiteral(resourceName: "name1"), #imageLiteral(resourceName: "name2"), #imageLiteral(resourceName: "name3")]
    
    var timer = Timer()
    var counter = 0
    override func viewDidLoad() {
        super.viewDidLoad()

//                pagedemo.numberOfPages = imgdata.count
//                  pagedemo.currentPage = 0
                DispatchQueue.main.async {
                    self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.changeImage), userInfo: nil, repeats: true)
                }
            }
        
       
           @objc func changeImage() {
        
            if counter < imgdata.count {
                let index = IndexPath.init(item: counter, section: 0)
                self.collect.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
//                  pagedemo.currentPage = counter
                counter += 1
            } else {
                counter = 0
                let index = IndexPath.init(item: counter, section: 0)
                self.collect.scrollToItem(at: index, at: .centeredHorizontally, animated: false)
//                pagedemo.currentPage = counter
                counter = 1
            }
        
            }
        

    }


extension Imageslider: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgdata.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        if let vc = cell.viewWithTag(111) as? UIImageView {
            vc.image = imgdata[indexPath.row]
        }
        return cell
    }
}

extension Imageslider: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collect.frame.size
        return CGSize(width: size.width, height: size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
}
