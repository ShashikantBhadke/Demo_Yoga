//
//  TabItemView.swift
//  Yoga
//
//  Created by Shashikant's_Macmini on 10/07/20.
//  Copyright © 2020 redbytes. All rights reserved.
//

import UIKit

final class TabItemView: UIView {

    // MARK:- Outlet
    @IBOutlet private weak var imgvIcon: UIImageView!
    @IBOutlet private weak var lblTitle: UILabel!

    // MARK:- Default Methods
    override func awakeFromNib() {
        imgvIcon.tintColor = .y_LunarGreen
        lblTitle.font = UIFont.getWithSize(size: 14)
    }
    
    // MARK:- Custome Methods
    func setAsSelected(_ status: Bool) {
        let clr: UIColor = status ? .y_Mongoose : .y_LunarGreen
        imgvIcon.tintColor = clr
        lblTitle.textColor = clr
    }

} //class
