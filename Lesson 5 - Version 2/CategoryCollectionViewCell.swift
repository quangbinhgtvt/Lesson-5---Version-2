//
//  CategoryCollectionViewCell.swift
//  Lesson 5 - Version 2
//
//  Created by BinhPQ on 10/22/18.
//  Copyright © 2018 BinhPQ. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageCollectionViewCell: UIImageView!
    @IBOutlet weak var categoryItemLabel: UILabel!
    @IBOutlet weak var numberofItems: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
