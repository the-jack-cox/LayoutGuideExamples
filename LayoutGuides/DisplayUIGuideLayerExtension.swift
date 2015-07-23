//
//  GuideDisplayLayer.swift
//  
//  Displays the location of UILayoutGuides visually
//
//  Created by Jack Cox on 7/23/15.
//  Copyright © 2015 CapTech Consulting. All rights reserved.
//

import UIKit

extension UIView {
    
    func showLayoutGuides() {
        
        // recurse into subviews to show layout guides
        for sub in subviews {
            sub.showLayoutGuides()
        }

        // bail out if the view has no sublayers
        guard let verifiedSubLayers = self.layer.sublayers else { return }
        
        // clean up any old display layers
        for layer in verifiedSubLayers {
            if layer is LayoutGuideDisplayLayer {
                layer.removeFromSuperlayer()
            }
        }
        
        // add new display layers
        for guide in self.layoutGuides {
            let l = LayoutGuideDisplayLayer(guide:guide)
            self.layer.addSublayer(l)
        }
    }
    
}

class LayoutGuideDisplayLayer: CAShapeLayer {

    init(guide:UILayoutGuide) {
        super.init()

        self.path = UIBezierPath(rect: guide.layoutFrame).CGPath
        self.strokeColor = UIColor.redColor().CGColor
        self.lineWidth = 0.5
        self.lineDashPattern = [2, 2, 2, 2]
        self.fillColor = UIColor.clearColor().CGColor
        
        // animate the dashed line
        let anim = CABasicAnimation(keyPath: "lineDashPhase")
        anim.duration = 0.75
        anim.repeatCount = Float.infinity
        anim.fromValue = 0
        anim.toValue = 3
        self.addAnimation(anim, forKey: "lineDashPhase")
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}