//
//  DetailCategoryTableViewCell.swift
//  Lesson 5 - Version 2
//
//  Created by BinhPQ on 10/23/18.
//  Copyright © 2018 BinhPQ. All rights reserved.
//

import UIKit

class DetailCategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var detailLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
