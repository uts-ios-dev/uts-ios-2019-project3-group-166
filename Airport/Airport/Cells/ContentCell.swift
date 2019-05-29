//
//  ContentCell.swift
//  Airport
//
//  Created by Charlie on 29/5/19.
//  Copyright © 2019 UTS. All rights reserved.
//

import Foundation
import UIKit

class ContentCell: UITableViewCell {
	
	var contentText = UILabel()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		self.selectionStyle = .none
		
		contentText.font = UIFont.systemFont(ofSize: 15, weight: .medium)
		contentText.textColor = UIColor.black
		contentText.numberOfLines = 0
		
		contentText.translatesAutoresizingMaskIntoConstraints = false
		
		self.addSubview(contentText)
		
		self.addConstraints([
			
			// Content Text
			NSLayoutConstraint(item: contentText, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 20),
			NSLayoutConstraint(item: contentText, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 2),
			NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: contentText, attribute: .trailing, multiplier: 1.0, constant: 20),
			NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: contentText, attribute: .bottom, multiplier: 1.0, constant: 10)
		
		])
		
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func populateCell(passedData: ContentData) {
		contentText.text = passedData.contentString
	}
	
}

