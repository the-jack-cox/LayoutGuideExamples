//
//  FirstViewController.swift
//  LayoutGuides
//
//  Created by Jack Cox on 7/22/15.
//  Copyright © 2015 Jack Cox. All rights reserved.
//

import UIKit

class CenteringViewController: UIViewController {
    
    @IBOutlet weak var shoeLabel: UILabel!
    @IBOutlet weak var shoeImage: UIImageView!
    
    // create the layout guide
    var containerLayoutGuide:UILayoutGuide = UILayoutGuide()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // add the layout guide to the view
        self.view.addLayoutGuide(containerLayoutGuide)
        
        // center the layout guide
        self.view.centerXAnchor.constraintEqualToAnchor(containerLayoutGuide.centerXAnchor).active = true
        // make the image leading equal to the guide leading
        self.shoeImage.leadingAnchor.constraintEqualToAnchor(containerLayoutGuide.leadingAnchor).active = true
        // make the label trailing equal to the guide trailing
        self.shoeLabel.trailingAnchor.constraintEqualToAnchor(containerLayoutGuide.trailingAnchor).active = true
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.view.showLayoutGuides()
    }
    
}

