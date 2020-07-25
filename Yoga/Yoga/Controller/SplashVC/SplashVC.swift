//
//  SplashVC.swift
//  Yoga
//
//  Created by Shashikant's_Macmini on 10/07/20.
//  Copyright © 2020 redbytes. All rights reserved.
//

import UIKit

final class SplashVC: UIViewController {
    
    // MARK:- Outlets
    @IBOutlet private var btnStart: UIButton!
    
    // MARK:- Variables
    
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
        btnStart.setCorner(btnStart.frame.height * 0.5)
        btnStart.titleLabel?.font = UIFont.getWithSize(size: 18)
        btnStart.setTitleColor(.white, for: .normal)
        btnStart.backgroundColor = .y_Mongoose
    }
    
    // MARK:- Button Actions
    @IBAction private func btnStartPressed(_ sender: UIButton) {
        pushTabBarVC()
    }
    
    // MARK:- Push Methods
    private func pushTabBarVC() {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: String(describing: TabBarVC.self)) as? TabBarVC else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    // MARK:- ReceiveMemoryWarning
    override func didReceiveMemoryWarning() {
        debugPrint("⚠️🤦‍♂️⚠️ Receive Memory Warning on \(self) ⚠️🤦‍♂️⚠️")
    }
    
    // MARK:-
    deinit {
        debugPrint("🏹 Controller is removed from memory \(self) 🎯 🏆")
    }
    
} //class
