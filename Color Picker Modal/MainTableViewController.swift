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
    
    var selectedColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        if cell == outletSelectedColor {
            if let color = self.selectedColor {
                outletSelectedColor.loadSelectedColor(color)
            } else {
                outletSelectedColor.loadSelectedColor(UIColor.whiteColor())
            }
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //if segue.identifier == "cell" {
            let viewController: ColorSelectCollectionViewController = (segue.destinationViewController as! UINavigationController).topViewController as! ColorSelectCollectionViewController
            
            viewController.delegate = self
        //}
    }
    
    func didSelectColor(color: UIColor) {
        self.selectedColor = color
        outletSelectedColor.loadSelectedColor(color)
    }
}

