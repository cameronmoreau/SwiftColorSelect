//
//  ViewController.swift
//  Color Picker Modal
//
//  Created by Cameron Moreau on 6/2/15.
//  Copyright (c) 2015 Cameron Moreau. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController, ColorSelectCollectionViewControllerDelegate {
    
    @IBOutlet weak var outletSelectedColor: ColorSelectTableViewCell!
    
    //weak var selectedColor = UIColor.whiteColor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Init setup for the SelectedColor
        //outletSelectedColor.loadSelectedColor(selectedColor!)
        //println("Loaded with color: \(selectedColor)")
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //if segue.identifier == "cell" {
            let viewController: ColorSelectCollectionViewController = (segue.destinationViewController as! UINavigationController).topViewController as! ColorSelectCollectionViewController
            
            viewController.delegate = self
        //}
    }
    
    func didSelectColor(color: UIColor) {
        outletSelectedColor.loadSelectedColor(color)
    }
}

