//
//  NavViews.swift
//  Airport
//
//  Created by Charlie on 31/5/19.
//  Copyright © 2019 UTS. All rights reserved.
//

import Foundation
import UIKit

class NavView: UIImageView {

	let navHeader = UILabel()
	let closeButton = UIImageView()
	
	init(navText: String) {
		super.init(frame: CGRect.zero)
	
		self.image = UIImage(named: "NavBackground")
		closeButton.image = UIImage(named: "CloseIcon")
		
		navHeader.text = navText
		navHeader.font = UIFont.systemFont(ofSize: 14, weight: .heavy)
		navHeader.numberOfLines = 1
		
		navHeader.translatesAutoresizingMaskIntoConstraints = false
		closeButton.translatesAutoresizingMaskIntoConstraints = false
		
		self.addSubview(navHeader)
		self.addSubview(closeButton)
		
		self.addConstraints([
		
			// Nav Header
			NSLayoutConstraint(item: navHeader, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 20),
			NSLayoutConstraint(item: navHeader, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0),
			
			// Close Button
			NSLayoutConstraint(item: closeButton, attribute: .leading, relatedBy: .equal, toItem: navHeader, attribute: .trailing, multiplier: 1.0, constant: 20),
			NSLayoutConstraint(item: closeButton, attribute: .top, relatedBy: .greaterThanOrEqual, toItem: self, attribute: .top, multiplier: 1.0, constant: 10),
			NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: closeButton, attribute: .trailing, multiplier: 1.0, constant: 20),
			NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .greaterThanOrEqual, toItem: closeButton, attribute: .bottom, multiplier: 1.0, constant: 10),
			NSLayoutConstraint(item: closeButton, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: closeButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: closeButton, attribute: .width, relatedBy: .equal, toItem: closeButton, attribute: .width, multiplier: 1.0, constant: 0)
		
		])
	
	
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

}
