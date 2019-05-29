//
//  AppViews.swift
//  Airport
//
//  Created by Charlie on 29/5/19.
//  Copyright © 2019 UTS. All rights reserved.
//

import Foundation
import UIKit

class AppDownload: UIView {

	let viewText = UILabel()
	
	init() {
		super.init(frame: CGRect.zero)
	
		self.backgroundColor = UIColor(red: 0.18, green: 0.51, blue: 0.88, alpha: 1.00)
		self.layer.cornerRadius = 13
		
		viewText.textColor = UIColor.white
		viewText.text = "VIEW"
		viewText.font = UIFont.systemFont(ofSize: 12, weight: .heavy)
		viewText.textAlignment = .center
		
		viewText.translatesAutoresizingMaskIntoConstraints = false
		
		self.addSubview(viewText)
		
		self.addConstraints([
		
			// View Text
			NSLayoutConstraint(item: viewText, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: viewText, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: self, attribute: .trailing	, relatedBy: .equal, toItem: viewText, attribute: .trailing, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: viewText, attribute: .bottom, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: viewText, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 70),
			NSLayoutConstraint(item: viewText, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 28)
		
		])
	
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
