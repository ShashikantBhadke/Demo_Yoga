//
//  Ext-View.swift
//  Yoga
//
//  Created by Shashikant's_Macmini on 10/07/20.
//  Copyright © 2020 redbytes. All rights reserved.
//

import UIKit

// MARK:- Extension For :- UIView
extension UIView {
    
    func setCorner(_ radii: CGFloat = 5.0) {
        layer.cornerRadius = radii
        layer.masksToBounds = true
    }
    
    func roundCorner(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
        
    func setShadow(clr: UIColor = .lightGray, sRadius: CGFloat = 4.0, cornerRadiue: CGFloat) {
        self.layer.masksToBounds = false
        self.layer.cornerRadius = cornerRadiue
        self.layer.shadowRadius  = sRadius
        self.layer.shadowColor   = clr.cgColor
        self.layer.shadowOffset  = CGSize(width: 2.0, height: 2.0)
        self.layer.shadowOpacity = 0.3
        self.layer.contentsScale = UIScreen.main.scale
    }
    
} //extension
