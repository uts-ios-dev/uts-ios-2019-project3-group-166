//
//  MenuCell.swift
//  Menu
//
//  Created by Yasmin Zaidi on 1/6/19.
//  Copyright © 2019 UTS. All rights reserved.
//

import Foundation
import UIKit

class MenuCell: UITableViewCell {

	let menuView = UIView()
	let menuEmoji = UILabel()
	let menuName = UILabel()
	let menuDescription = UILabel()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
	
		self.selectionStyle = .none
	
		menuView.layer.cornerRadius = 18
	
		menuEmoji.font = UIFont.systemFont(ofSize: 20)
		menuName.font = UIFont.systemFont(ofSize: 14, weight: .bold)
		menuDescription.font = UIFont.systemFont(ofSize: 12, weight: .heavy)
		menuName.textAlignment = .left
		menuDescription.textAlignment = .left
		
		menuDescription.alpha = 0.50
		
		menuEmoji.translatesAutoresizingMaskIntoConstraints = false
		menuName.translatesAutoresizingMaskIntoConstraints = false
		menuDescription.translatesAutoresizingMaskIntoConstraints = false
		menuView.translatesAutoresizingMaskIntoConstraints = false
		
		menuView.addSubview(menuEmoji)
		menuView.addSubview(menuName)
		menuView.addSubview(menuDescription)
		self.addSubview(menuView)
		
		menuView.addConstraints([
		
			// Menu Emoji
			NSLayoutConstraint(item: menuEmoji, attribute: .leading, relatedBy: .equal, toItem: menuView, attribute: .leading, multiplier: 1.0, constant: 16),
			NSLayoutConstraint(item: menuEmoji, attribute: .top, relatedBy: .greaterThanOrEqual, toItem: menuView, attribute: .top, multiplier: 1.0, constant: 10),
			NSLayoutConstraint(item: menuView, attribute: .bottom, relatedBy: .greaterThanOrEqual, toItem: menuEmoji, attribute: .bottom, multiplier: 1.0, constant: 10),
			NSLayoutConstraint(item: menuEmoji, attribute: .centerY, relatedBy: .equal, toItem: menuView, attribute: .centerY, multiplier: 1.0, constant: 0),
		
			// Menu Name
			NSLayoutConstraint(item: menuName, attribute: .leading, relatedBy: .equal, toItem: menuEmoji, attribute: .trailing, multiplier: 1.0, constant: 12),
			NSLayoutConstraint(item: menuName, attribute: .top, relatedBy: .equal, toItem: menuView, attribute: .top, multiplier: 1.0, constant: 10),

			// Menu Description
			NSLayoutConstraint(item: menuDescription, attribute: .leading, relatedBy: .equal, toItem: menuEmoji, attribute: .trailing, multiplier: 1.0, constant: 12),
			NSLayoutConstraint(item: menuDescription, attribute: .top, relatedBy: .equal, toItem: menuName, attribute: .bottom, multiplier: 1.0, constant: 2),
			NSLayoutConstraint(item: menuView, attribute: .bottom, relatedBy: .equal, toItem: menuDescription, attribute: .bottom, multiplier: 1.0, constant: 12)
		
		])
		
		self.addConstraints([
		
			// Menu View
			NSLayoutConstraint(item: menuView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 16),
			NSLayoutConstraint(item: menuView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 10),
			NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: menuView, attribute: .trailing, multiplier: 1.0, constant: 16),
			NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: menuView, attribute: .bottom, multiplier: 1.0, constant: 10)
		
		])
		
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
    
    func populateCell(passedData: MenuData) {
		
		menuEmoji.text = passedData.menuEmoji
		menuName.text = passedData.menuTitle
		menuDescription.text = passedData.menuDescription
		menuView.backgroundColor = passedData.menuBackground
        
    }
    
}

