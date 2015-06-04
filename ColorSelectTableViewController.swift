//
//  ColorSelectTableViewController.swift
//  Color Picker Modal
//
//  Created by Cameron Moreau on 6/4/15.
//  Copyright (c) 2015 Cameron Moreau. All rights reserved.
//

import UIKit

class ColorSelectTableViewController: UITableViewController {
    
    @IBAction func actionCancel(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    //Insert color picker stuff here
    @IBAction func actionColorPicker(sender: AnyObject) {
    }
    
    //Data to be passed back
    var onDataAvailable: ((data: SelectedColor) -> ())?
    
    var colors = [SelectedColor]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.colors = [
            SelectedColor(), //Default SelectedColor
            SelectedColor(title: "Purple", color: 0x5856d6),
            SelectedColor(title: "Royal Blue", color: 0x007aff),
            SelectedColor(title: "Blue", color: 0x34aadc),
            SelectedColor(title: "Light Blue", color: 0x5ac8fa),
            SelectedColor(title: "Green", color: 0x4cd964),
            SelectedColor(title: "Magenta", color: 0xff2d55),
            SelectedColor(title: "Dark Orange", color: 0xff3b30),
            SelectedColor(title: "Orange", color: 0xff9500),
            SelectedColor(title: "Yellow", color: 0xffcc00),
            SelectedColor(title: "Gray", color: 0x8e8e93),
            SelectedColor(title: "Black", color: 0x1f1f21)
        ]
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! ColorSelectTableViewCell
        
        cell.loadSelectedColor(colors[indexPath.row])
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        let color = colors[indexPath.row]
        self.onDataAvailable?(data: color)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
