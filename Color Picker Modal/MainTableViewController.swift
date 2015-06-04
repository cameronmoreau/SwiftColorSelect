//
//  ViewController.swift
//  Color Picker Modal
//
//  Created by Cameron Moreau on 6/2/15.
//  Copyright (c) 2015 Cameron Moreau. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    @IBOutlet weak var outletSelectedColor: ColorSelectTableViewCell!
    var selectedColor: SelectedColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Init setup for the SelectedColor
        outletSelectedColor.loadSelectedColor(SelectedColor())
    }
    
    func updateSelectedColor(color: SelectedColor) {
        self.selectedColor = color;
        outletSelectedColor.loadSelectedColor(selectedColor)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let viewController = segue.destinationViewController as? ColorSelectTableViewController {
            viewController.onDataAvailable = { [weak self]
                (data) in
                if let weakSelf = self {
                    weakSelf.updateSelectedColor(data)
                }
            }
        }
    }
    
}

