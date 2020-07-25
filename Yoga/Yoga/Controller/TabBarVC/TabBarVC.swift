//
//  TabBarVC.swift
//  Yoga
//
//  Created by Shashikant's_Macmini on 10/07/20.
//  Copyright © 2020 redbytes. All rights reserved.
//

import UIKit

protocol HandleTabBarDelegate: class {
    func dismissToStartApp()
}


final class TabBarVC: UIViewController {
    
    // MARK:- Outlets
    @IBOutlet private weak var viewTabBg        : UIView!
    @IBOutlet private weak var tabView          : TabbarView!
    
    // MARK:- Variables
    var containerNav: UINavigationController?
    
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
        DispatchQueue.main.async {
            self.viewTabBg.roundCorner(corners: [.topLeft, .topRight], radius: self.tabView.frame.height * 0.5)
            self.tabView.roundCorner(corners: [.topLeft, .topRight], radius: self.tabView.frame.height * 0.5)
        }
        tabView.onItemPressed = didPressTabBarItem
        tabView.setSelectedIndex(.Yoga)
    }
    
    // MARK:- Segue Methods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "TabContainerNavVC", let navContainerVC = segue.destination as? UINavigationController else { return }
        containerNav = navContainerVC
        pushYogaVC()
    }
    
    // MARK:- TabbarMethods Methods
    private func didPressTabBarItem(_ type: TabbarView.TabItems)-> Bool {
        switch type {
        case .Yoga:
            pushYogaVC()
        default:
            pushOtherVC(type.rawValue)
        }
        return true
    }
    
    // MARK:- Push Methods
    private func pushYogaVC() {
        guard let navVC = containerNav else { return }
        var _vc: YogaVC?
        
        for vc in navVC.viewControllers {
            if let vc_ = vc as? YogaVC {
                _vc = vc_
                break
            }
        }
        if let vc_ = _vc {
            vc_.delegate = self
            navVC.popToViewController(vc_, animated: true)
        } else {
            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: String(describing: YogaVC.self)) as? YogaVC else { return }
            vc.delegate = self
            navVC.pushViewController(vc, animated: true)
        }
    }
    
    private func pushOtherVC(_ strTitle: String) {
        guard let navVC = containerNav else { return }
        var _vc: OtherVC?
        
        for vc in navVC.viewControllers {
            if let vc_ = vc as? OtherVC {
                _vc = vc_
                break
            }
        }
        if let vc_ = _vc {
            vc_.navTitle = strTitle
            vc_.uiUpdate()
            navVC.popToViewController(vc_, animated: true)
        } else {
            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: String(describing: OtherVC.self)) as? OtherVC else { return }
            vc.navTitle = strTitle
            navVC.pushViewController(vc, animated: true)
        }
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

// MARK:- Extension For :- HandleTabBarDelegate
extension TabBarVC: HandleTabBarDelegate {
    func dismissToStartApp() {
        self.navigationController?.popToRootViewController(animated: true)
    }
} //extension
