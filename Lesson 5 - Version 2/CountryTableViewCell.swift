//
//  CountryTableViewCell.swift
//  Lesson 5 - Version 2
//
//  Created by BinhPQ on 10/19/18.
//  Copyright © 2018 BinhPQ. All rights reserved.
//

import UIKit

class CountryTableViewCell: UITableViewCell {

    @IBOutlet weak var countryTextField: UILabel!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
