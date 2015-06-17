//
//  ColorSelectTableViewCell.swift
//  Color Picker Modal
//
//  Created by Cameron Moreau on 6/4/15.
//  Copyright (c) 2015 Cameron Moreau. All rights reserved.
//

import UIKit

class ColorSelectTableViewCell: UITableViewCell {
    
    @IBOutlet weak var viewColorPreview: UIView!
    
    func loadSelectedColor(color: UIColor) {
        self.viewColorPreview.backgroundColor = color
        self.viewColorPreview.layer.cornerRadius = 4
        self.viewColorPreview.layer.borderColor = UIColor.blackColor().colorWithAlphaComponent(0.15).CGColor
        self.viewColorPreview.layer.borderWidth = 1
    }

}
