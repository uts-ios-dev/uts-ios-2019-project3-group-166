//
//  HeaderCell.swift
//  Airport
//
//  Created by Charlie on 29/5/19.
//  Copyright © 2019 UTS. All rights reserved.
//

import Foundation
import UIKit

class HeaderCell: UITableViewCell {
	
	var headerText = UILabel()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		self.selectionStyle = .none
		
		headerText.font = UIFont.systemFont(ofSize: 22, weight: .heavy)
		headerText.textColor = UIColor.black
		headerText.numberOfLines = 0
		
		headerText.translatesAutoresizingMaskIntoConstraints = false
		
		self.addSubview(headerText)
		
		self.addConstraints([
			
			// Header Text
			NSLayoutConstraint(item: headerText, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 20),
			NSLayoutConstraint(item: headerText, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 30),
			NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: headerText, attribute: .trailing, multiplier: 1.0, constant: 20),
			NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: headerText, attribute: .bottom, multiplier: 1.0, constant: 10)
		
		])
		
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func populateCell(passedData: HeaderData) {
		headerText.text = passedData.headerString
	}
	
}

