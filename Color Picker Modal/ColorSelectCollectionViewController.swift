//
//  ColorSelectCollectionViewController.swift
//  Color Picker Modal
//
//  Created by Cameron Moreau on 6/17/15.
//  Copyright (c) 2015 Cameron Moreau. All rights reserved.
//

import UIKit

let reuseIdentifier = "Cell"

protocol ColorSelectCollectionViewControllerDelegate {
    func didSelectColor(color: UIColor)
}

class ColorSelectCollectionViewController: UICollectionViewController {
    
    var delegate: ColorSelectCollectionViewControllerDelegate? = nil
    var colors = [UIColor]()
    
    @IBAction func actionCancel(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    //Launch color picker here
    @IBAction func actionShowColorPicker(sender: AnyObject) {
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.colors = [
            UIColorFromHex(0xFFFFFF),
            UIColorFromHex(0x5856d6),
            UIColorFromHex(0x007aff),
            UIColorFromHex(0x34aadc),
            UIColorFromHex(0x5ac8fa),
            UIColorFromHex(0x4cd964),
            UIColorFromHex(0xff2d55),
            UIColorFromHex(0xff3b30),
            UIColorFromHex(0xff9500),
            UIColorFromHex(0xffcc00),
            UIColorFromHex(0x8e8e93),
            UIColorFromHex(0x1f1f21)
        ]

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! UICollectionViewCell
    
        cell.layer.cornerRadius = cell.frame.size.width / 2;
        cell.clipsToBounds = true
        cell.backgroundColor = colors[indexPath.item];
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.blackColor().colorWithAlphaComponent(0.15).CGColor
    
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let color = colors[indexPath.item]
        
        if let delegate = self.delegate {
            delegate.didSelectColor(colors[indexPath.item])
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    func UIColorFromHex(rgbValue:UInt32)->UIColor {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        
        return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(1))
    }

}
