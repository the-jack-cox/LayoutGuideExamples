//
//  SecondViewController.swift
//  LayoutGuides
//
//  Created by Jack Cox on 7/22/15.
//  Copyright © 2015 Jack Cox. All rights reserved.
//

import UIKit

class GroupingViewController: UIViewController {

    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    
    var lhLayout = UILayoutGuide()
    var rhLayout = UILayoutGuide()
    
    @IBOutlet weak var label5: UILabel!
    @IBOutlet weak var label6: UILabel!
    @IBOutlet weak var label7: UILabel!
    @IBOutlet weak var label8: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // add layout guides
        self.view.addLayoutGuide(rhLayout)
        self.view.addLayoutGuide(lhLayout)
        
        // groups are the same width
        lhLayout.widthAnchor.constraintEqualToAnchor(rhLayout.widthAnchor).active = true
        lhLayout.heightAnchor.constraintEqualToAnchor(rhLayout.heightAnchor).active = true
        
        // left view -44 from self.view leading edget
        self.view.leadingAnchor.constraintEqualToAnchor(lhLayout.leadingAnchor, constant: -44).active = true
        
        // left and right abut each other
        lhLayout.trailingAnchor.constraintEqualToAnchor(rhLayout.leadingAnchor).active = true
        // right view 44 from view trailing edge
        self.view.trailingAnchor.constraintEqualToAnchor(rhLayout.trailingAnchor, constant: 44).active = true
        
        lhLayout.bottomAnchor.constraintEqualToAnchor(rhLayout.bottomAnchor, constant: 0).active = true
        self.view.bottomAnchor.constraintEqualToAnchor(lhLayout.bottomAnchor, constant: 100).active = true
        
        // label 5 is 10 from the leading edgh of left hand view
        lhLayout.leadingAnchor.constraintEqualToAnchor(label5.leadingAnchor, constant: -10).active = true
        // label 5 is 10 from trailing edge of the left hand view
        lhLayout.trailingAnchor.constraintEqualToAnchor(label5.trailingAnchor, constant: 10).active = true
        
        // label 7 is 10 from the trailing edge of right hand view
        rhLayout.trailingAnchor.constraintEqualToAnchor(label7.trailingAnchor, constant: 10).active = true
        // label 7 is 10 from the leading edge of right hand view
        rhLayout.leadingAnchor.constraintEqualToAnchor(label7.leadingAnchor, constant: -10).active = true
        
        // make the layout guides encapsulate the fields
        lhLayout.bottomAnchor.constraintEqualToAnchor(label6.bottomAnchor).active = true
        rhLayout.bottomAnchor.constraintEqualToAnchor(label8.bottomAnchor).active = true
        
        lhLayout.topAnchor.constraintEqualToAnchor(label5.topAnchor).active = true
        rhLayout.topAnchor.constraintEqualToAnchor(label7.topAnchor).active = true
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // show where my layout guides are
        self.view.showLayoutGuides()
    }


}

