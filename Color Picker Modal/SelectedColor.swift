//
//  SelectedColor.swift
//  Color Picker Modal
//
//  Created by Cameron Moreau on 6/4/15.
//  Copyright (c) 2015 Cameron Moreau. All rights reserved.
//

import UIKit

class SelectedColor: NSObject {
    var title: String
    var color: UIColor
    
    override init() {
        self.title = "Default"
        self.color = UIColor.whiteColor()
        super.init();
        self.color = UIColorFromHex(0xffffff);
    }
    
    init(title: String, color: UInt32) {
        self.title = title
        self.color = UIColor.whiteColor()
        super.init()
        self.color = UIColorFromHex(color)
    }
    
    func UIColorFromHex(rgbValue:UInt32)->UIColor {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        
        return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(1))
    }
}
