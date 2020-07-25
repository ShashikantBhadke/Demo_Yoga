//
//  YogaVC.swift
//  Yoga
//
//  Created by Shashikant's_Macmini on 10/07/20.
//  Copyright © 2020 redbytes. All rights reserved.
//

import UIKit

final class YogaVC: UITableViewController {
    
    // MARK:- Outlets
    @IBOutlet private weak var imgvMain             : UIImageView!    
    @IBOutlet private weak var alHeightImgView      : NSLayoutConstraint! //30
    @IBOutlet private weak var alHeightRatingView	: NSLayoutConstraint! //330
    @IBOutlet private weak var alBackTop            : NSLayoutConstraint! //10
    
    // Rating View
    @IBOutlet private weak var viewRating           : UIView!
    @IBOutlet private weak var lblRating            : UILabel!
    @IBOutlet private weak var lblRatingValue       : UILabel!
    
    // Event Details View
    @IBOutlet private weak var lblName             : UILabel!
    @IBOutlet private weak var lblAddress          : UILabel!
    @IBOutlet private weak var lblWeekdays_        : UILabel!
    @IBOutlet private weak var lblWeekdays         : UILabel!
    @IBOutlet private weak var lblWeekends_        : UILabel!
    @IBOutlet private weak var lblWeekends         : UILabel!
    @IBOutlet private weak var lblOpenWhen_        : UILabel!
    @IBOutlet private weak var lblDescriptions_    : UILabel!
    @IBOutlet private weak var lblDescriptions     : UILabel!
    @IBOutlet private weak var btnSeeOnMap         : UIButton!
    @IBOutlet private weak var btnReview           : UIButton!
    
    // MARK:- Variables
    var statusBarHeight: CGFloat = 10.0
    weak var delegate: HandleTabBarDelegate?
    
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
                
        if #available(iOS 13.0, *) {
            statusBarHeight = UIApplication.shared.keyWindow?.windowScene?.statusBarManager?.statusBarFrame.height ?? statusBarHeight
        } else {
            statusBarHeight = UIApplication.shared.statusBarFrame.height
        }
        
        self.view.backgroundColor = .y_viewBack
        
        tableView.contentInset = UIEdgeInsets(top: -statusBarHeight, left: 0, bottom: 0, right: 0)
        tableView.reloadData()
        
        alBackTop.constant = statusBarHeight - 10.0
        
        DispatchQueue.main.async {
            self.addGradientOnImg()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            UIView.animate(withDuration: 0.5) {
                self.alHeightImgView.constant = 30
                self.alHeightRatingView.constant = 300
                self.view.layoutIfNeeded()
            }
        }
        
        setRatingView()
        setOtherView()
    }
    
    private func addGradientOnImg() {
        imgvMain.layer.sublayers?.forEach { $0.removeFromSuperlayer() }
        
        let width = imgvMain.bounds.width
        let height = imgvMain.bounds.height * 0.3
        let shadow = UIColor.black.withAlphaComponent(0.6).cgColor
        
        let topImageGradient = CAGradientLayer()
        topImageGradient.frame = CGRect(x: 0, y: 0, width: width, height: height)
        topImageGradient.colors = [shadow, UIColor.clear.cgColor]
        imgvMain.layer.insertSublayer(topImageGradient, at: 0)
        
        imgvMain.roundCorner(corners: [.bottomRight, .bottomLeft], radius: 30)
        
        alHeightImgView.constant = 150
        alHeightRatingView.constant = 150
        self.view.layoutIfNeeded()
    }
    
    private func setRatingView() {
        viewRating.setShadow(clr: .lightGray, cornerRadiue: viewRating.frame.height * 0.5)
        lblRating.font = UIFont.getWithSize(size: 12)
        lblRatingValue.font = UIFont.getWithSize(size: 12)
        
        lblRatingValue.textColor = .y_Mongoose
    }
    
    private func setOtherView() {
        // Fonts
        lblName.font = UIFont.getWithSize(size: 18)
        lblAddress.font = UIFont.getWithSize(size: 14)
        lblWeekdays_.font = UIFont.getWithSize(size: 14)
        lblWeekends_.font = UIFont.getWithSize(size: 14)
        lblWeekdays.font = UIFont.getWithSize(size: 12)
        lblWeekends.font = UIFont.getWithSize(size: 12)
        lblOpenWhen_.font = UIFont.getWithSize(size: 20)
        lblDescriptions_.font = UIFont.getWithSize(size: 16)
        lblDescriptions.font = UIFont.getWithSize(size: 14)
        
        btnSeeOnMap.titleLabel?.font = UIFont.getWithSize(size: 14)
        btnReview.titleLabel?.font = UIFont.getWithSize(size: 20)
        
        // Color
        lblName.textColor = .y_LunarGreen
        lblAddress.textColor = .y_Nobel
        lblWeekdays.textColor = .y_Nobel
        lblWeekends.textColor = .y_Nobel
        lblOpenWhen_.textColor = .y_Nobel
        lblDescriptions_.textColor = .y_LunarGreen
        lblDescriptions.textColor = .y_Nobel
        
        btnSeeOnMap.setTitleColor(.y_Mongoose, for: .normal)
        btnReview.setTitleColor(.y_Mongoose, for: .normal)
    }
    
    
    // MARK:- Button Actions
    @IBAction private func btnBackPressed() {
        delegate?.dismissToStartApp()
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

// MARK:- Extension For :- UITableView Delegate Methods
extension YogaVC {
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .leastNonzeroMagnitude
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return .leastNonzeroMagnitude
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0 :
            return (self.view.frame.height * 0.6) + statusBarHeight
        default:
            return UITableView.automaticDimension
        }
    }
    
    
} //extension
