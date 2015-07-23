//
//  SecondViewController.swift
//  LayoutGuides
//
//  Created by Jack Cox on 7/22/15.
//  Copyright © 2015 Jack Cox. All rights reserved.
//

import UIKit

class SpacingViewController: UIViewController {
    
    @IBOutlet weak var shoe1: UIImageView!
    @IBOutlet weak var shoe2: UIImageView!
    @IBOutlet weak var shoe3: UIImageView!
    
    var layoutGuide1 = UILayoutGuide()
    var layoutGuide2 = UILayoutGuide()
    var layoutGuide3 = UILayoutGuide()
    var layoutGuide4 = UILayoutGuide()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // add the layout guides to the view
        self.view.addLayoutGuide(layoutGuide1)
        self.view.addLayoutGuide(layoutGuide2)
        self.view.addLayoutGuide(layoutGuide3)
        self.view.addLayoutGuide(layoutGuide4)
        
        // make them all the same size
        self.layoutGuide1.widthAnchor.constraintEqualToAnchor(layoutGuide2.widthAnchor).active = true
        self.layoutGuide1.widthAnchor.constraintEqualToAnchor(layoutGuide3.widthAnchor).active = true
        self.layoutGuide1.widthAnchor.constraintEqualToAnchor(layoutGuide4.widthAnchor).active = true
        
        // string the layout guides and show images together leading to trailing across the screen
        self.view.leadingAnchor.constraintEqualToAnchor(layoutGuide1.leadingAnchor).active = true
        self.layoutGuide1.trailingAnchor.constraintEqualToAnchor(shoe1.leadingAnchor).active = true
        self.shoe1.trailingAnchor.constraintEqualToAnchor(layoutGuide2.leadingAnchor).active = true
        self.layoutGuide2.trailingAnchor.constraintEqualToAnchor(shoe2.leadingAnchor).active = true
        self.shoe2.trailingAnchor.constraintEqualToAnchor(layoutGuide3.leadingAnchor).active = true
        self.layoutGuide3.trailingAnchor.constraintEqualToAnchor(shoe3.leadingAnchor).active = true
        self.shoe3.trailingAnchor.constraintEqualToAnchor(layoutGuide4.leadingAnchor).active = true
        self.layoutGuide4.trailingAnchor.constraintEqualToAnchor(self.view.trailingAnchor).active = true
        
        
        self.view.addConstraint(NSLayoutConstraint(item: self.view,
            attribute: .Leading,
            relatedBy: .Equal,
            toItem: layoutGuide1,
            attribute: .Leading,
            multiplier: 1,
            constant: 0))
        

    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.view.showLayoutGuides()
    }

}

