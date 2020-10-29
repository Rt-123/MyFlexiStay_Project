//
//  AminitiesCollectionViewCell.swift
//  My FlexiStay
//
//  Created by Dasharath Naik on 29/10/20.
//  Copyright © 2020 MacFreak's  "Rt". All rights reserved.
//

import UIKit

class AminitiesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var designView: UIView!
    @IBOutlet weak var aminitiesImg: UIImageView!
    @IBOutlet weak var checkButon: UIButton!
    @IBOutlet weak var aminitiesName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        designView.layer.cornerRadius = 10
        designView.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        designView.layer.borderWidth = 0.5
    }

}
