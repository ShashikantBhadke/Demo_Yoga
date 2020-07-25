//
//  Ext-Font.swift
//  Yoga
//
//  Created by Shashikant's_Macmini on 10/07/20.
//  Copyright © 2020 redbytes. All rights reserved.
//

import UIKit

// MARK:- Extension for - UIFont
extension UIFont {
    
    static let customRegular    = "Ubuntu"
    static let customMedium     = "Ubuntu-Medium"
    static let customBold       = "Ubuntu-Bold"
        
    static func getWithSize(size: CGFloat)->UIFont? {
        return UIFont(name: customRegular, size: size)
    }
    
    static func getMediumWithSize(size: CGFloat)->UIFont? {
        return UIFont(name: customMedium, size: size)
    }
    
    static func getBoldFontSize(size: CGFloat)->UIFont? {
        return UIFont(name: customBold, size: size)
    }
    
} //extension
