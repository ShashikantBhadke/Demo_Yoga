//
//  Ext-Colors.swift
//  Yoga
//
//  Created by Shashikant's_Macmini on 10/07/20.
//  Copyright © 2020 redbytes. All rights reserved.
//

import UIKit

// MARK:- Extension For:- Color
extension UIColor {
    
    // MARK:- Static Colors
    static let y_Mongoose = UIColor.hexStringToUIColor(hex: "#B9A089")
    static let y_LunarGreen = UIColor.hexStringToUIColor(hex: "#484948")
    static let y_Schooner = UIColor.hexStringToUIColor(hex: "#8D8784")
    static let y_Nobel = UIColor.hexStringToUIColor(hex: "#B7AFAFB")
    static let y_viewBack = UIColor.hexStringToUIColor(hex: "#F5F5F5")
    
    
    // MARK:- Methods
    static func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
} // extension



