//
//  TabbarView.swift
//  Yoga
//
//  Created by Shashikant's_Macmini on 10/07/20.
//  Copyright © 2020 redbytes. All rights reserved.
//

import UIKit

final class TabbarView: UIView {
    
    // MARK:- Objects
    enum TabItems: String {
        case Yoga = "Yoga"
        case Chats = "Chats"
        case Articles = "Articles"
        case Settings = "Settings"
    }
    
    // MARK:- Outlets
    @IBOutlet private weak var viewYoga     : TabItemView!
    @IBOutlet private weak var viewChat     : TabItemView!
    @IBOutlet private weak var viewArticles : TabItemView!
    @IBOutlet private weak var viewSettings : TabItemView!
    
    // MARK:- Variables
    var gesYoga: UITapGestureRecognizer?
    var gesChat: UITapGestureRecognizer?
    var gesArti: UITapGestureRecognizer?
    var gesSett: UITapGestureRecognizer?
    var onItemPressed: ((TabItems)->(Bool))?
    
    // MARK:- Default Methods
    override func awakeFromNib() {
        setUpGestures()
    }
    
    private func setUpGestures() {
        gesYoga = UITapGestureRecognizer(target: self, action: #selector(tapGestureOnViewTapped(_ :)))
        gesChat = UITapGestureRecognizer(target: self, action: #selector(tapGestureOnViewTapped(_ :)))
        gesArti = UITapGestureRecognizer(target: self, action: #selector(tapGestureOnViewTapped(_ :)))
        gesSett = UITapGestureRecognizer(target: self, action: #selector(tapGestureOnViewTapped(_ :)))
        
        if let ges = gesYoga {
            viewYoga.addGestureRecognizer(ges)
        }
        if let ges = gesChat {
            viewChat.addGestureRecognizer(ges)
        }
        if let ges = gesArti {
            viewArticles.addGestureRecognizer(ges)
        }
        if let ges = gesSett {
            viewSettings.addGestureRecognizer(ges)
        }
    }
    
    // MARK:- Custom Methods
    func setSelectedIndex(_ type: TabItems) {
        switch type {
        case .Yoga:
            viewYoga.setAsSelected(true)
        case .Chats:
            viewChat.setAsSelected(true)
        case .Articles:
            viewArticles.setAsSelected(true)
        case .Settings:
            viewSettings.setAsSelected(true)
        }
    }
    
    
    // MARK:- TapView Methods
    @objc func tapGestureOnViewTapped(_ gesture: UITapGestureRecognizer) {
        
        viewYoga.setAsSelected(false)
        viewChat.setAsSelected(false)
        viewArticles.setAsSelected(false)
        viewSettings.setAsSelected(false)
        
        switch gesture {
        case gesYoga:
            if onItemPressed?(.Yoga) ?? false {
                viewYoga.setAsSelected(true)
            }
        case gesChat:
            if onItemPressed?(.Chats) ?? false {
                viewChat.setAsSelected(true)
            }
        case gesArti:
            if onItemPressed?(.Articles) ?? false {
                viewArticles.setAsSelected(true)
            }
        case gesSett:
            if onItemPressed?(.Settings) ?? false {
                viewSettings.setAsSelected(true)
            }
        default:
            break
        }
    }
    
    
    
} //class
