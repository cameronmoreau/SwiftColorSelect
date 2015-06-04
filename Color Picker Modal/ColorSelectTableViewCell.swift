//
//  ColorSelectTableViewCell.swift
//  Color Picker Modal
//
//  Created by Cameron Moreau on 6/4/15.
//  Copyright (c) 2015 Cameron Moreau. All rights reserved.
//

import UIKit

class ColorSelectTableViewCell: UITableViewCell {
    
    @IBOutlet weak var labelColor: UILabel!
    @IBOutlet weak var viewColorPreview: UIView!
    
    func loadSelectedColor(color: SelectedColor) {
        self.labelColor.text = color.title
        self.viewColorPreview.backgroundColor = color.color
    }

}
