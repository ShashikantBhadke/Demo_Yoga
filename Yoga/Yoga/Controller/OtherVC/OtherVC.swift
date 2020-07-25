//
//  OtherVC.swift
//  Yoga
//
//  Created by Shashikant's_Macmini on 10/07/20.
//  Copyright © 2020 redbytes. All rights reserved.
//

import UIKit

final class OtherVC: UIViewController {
    
    // MARK:- Outlets
    @IBOutlet private weak var lblTitle             : UILabel!
    @IBOutlet private weak var lblNote              : UILabel!
    
    // MARK:- Variables
    var navTitle: String?
    
    // MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    // MARK:- SetUpView
    private func setUpView() {
        lblTitle.text = navTitle ?? ""
        
        lblTitle.font = UIFont.getBoldFontSize(size: 20)
        lblNote.font = UIFont.getWithSize(size: 16)
        
        lblTitle.textColor = .y_Mongoose
        lblNote.textColor = .y_Schooner
    }
    
    func uiUpdate() {
        lblTitle.text = navTitle ?? ""
    }
    
    // MARK:- Button Actions
    @objc private func btnBackPressed() {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK:- Custom Methods
    
    // MARK:- ReceiveMemoryWarning
    override func didReceiveMemoryWarning() {
        debugPrint("⚠️🤦‍♂️⚠️ Receive Memory Warning on \(self) ⚠️🤦‍♂️⚠️")
    }
    
    // MARK:-
    deinit {
        debugPrint("🏹 Controller is removed from memory \(self) 🎯 🏆")
    }
    
} //class
