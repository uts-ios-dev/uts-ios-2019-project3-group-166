//
//  MenuCell.swift
//  Airport
//
//  Created by Yasmin Zaidi on 1/6/19.
//  Copyright © 2019 UTS. All rights reserved.
//

import Foundation
import UIKit

class MenuCell: UITableViewCell {
    
    let menuBackground = UIView()
    let menuIcon = UIImageView()
    let menuTitle = UILabel()
    let menuDescription = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        
        menuBackground.backgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1.00)
        menuBackground.layer.cornerRadius = 30
        
        menuIcon.layer.cornerRadius = 14
        menuIcon.clipsToBounds = true
        menuTitle.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        menuTitle.textColor = UIColor.black
        menuDescription.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        menuDescription.textColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 0.85)
        menuTitle.numberOfLines = 0
        menuDescription.numberOfLines = 0
        
        menuBackground.translatesAutoresizingMaskIntoConstraints = false
        menuIcon.translatesAutoresizingMaskIntoConstraints = false
        menuTitle.translatesAutoresizingMaskIntoConstraints = false
        menuDescription.translatesAutoresizingMaskIntoConstraints = false
        
        menuBackground.addSubview(menuIcon)
        menuBackground.addSubview(menuTitle)
        menuBackground.addSubview(menuDescription)
        self.addSubview(menuBackground)
        
        self.addConstraints([
            
            // Menu Background
            NSLayoutConstraint(item: menuBackground, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 14),
            NSLayoutConstraint(item: menuBackground, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 10),
            NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: menuBackground, attribute: .trailing, multiplier: 1.0, constant: 14),
            NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: menuBackground, attribute: .bottom, multiplier: 1.0, constant: 10)
            
		])
        
        menuBackground.addConstraints([
            
            // Menu Icon
            NSLayoutConstraint(item: menuIcon, attribute: .leading, relatedBy: .equal, toItem: menuBackground, attribute: .leading, multiplier: 1.0, constant: 16),
            NSLayoutConstraint(item: menuIcon, attribute: .top, relatedBy: .equal, toItem: menuBackground, attribute: .top, multiplier: 1.0, constant: 16),
            NSLayoutConstraint(item: menuBackground, attribute: .bottom, relatedBy: .greaterThanOrEqual, toItem: menuIcon, attribute: .bottom, multiplier: 1.0, constant: 16),
            NSLayoutConstraint(item: menuIcon, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 50),
            NSLayoutConstraint(item: menuIcon, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 50),
            
            // Menu Title
            NSLayoutConstraint(item: menuTitle, attribute: .leading, relatedBy: .equal, toItem: menuIcon, attribute: .trailing, multiplier: 1.0, constant: 12),
            NSLayoutConstraint(item: menuTitle, attribute: .top, relatedBy: .equal, toItem: menuBackground, attribute: .top, multiplier: 1.0, constant: 16),
            
            // Menu Description
            NSLayoutConstraint(item: menuDescription, attribute: .leading, relatedBy: .equal, toItem: menuIcon, attribute: .trailing, multiplier: 1.0, constant: 12),
            NSLayoutConstraint(item: menuDescription, attribute: .top, relatedBy: .equal, toItem: menuTitle, attribute: .bottom, multiplier: 1.0, constant: 2),
            NSLayoutConstraint(item: menuBackground, attribute: .bottom, relatedBy: .greaterThanOrEqual, toItem: menuDescription, attribute: .bottom, multiplier: 1.0, constant: 14)
        
		])
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func populateCell(passedData: MenuData) {
        
        menuIcon.image = UIImage(named: passedData.menuIcon)
        menuTitle.text = passedData.menuTitle
        menuDescription.text = passedData.menuDescription
        
    }
    
}

