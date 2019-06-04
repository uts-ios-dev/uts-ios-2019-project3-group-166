//
//  NavViews.swift
//  Airport
//
//  Created by Charlie on 31/5/19.
//  Copyright © 2019 UTS. All rights reserved.
//

import Foundation
import UIKit

class NavView: UIView {

	let navHeader = UILabel()
	let closeButton = UIImageView()
	let navTop = UIView()
	let navFade = UIImageView()
	
	init(navText: String) {
		super.init(frame: CGRect.zero)
	
		navTop.backgroundColor = UIColor.white
	
		navFade.image = UIImage(named: "NavBackground")
		closeButton.image = UIImage(named: "CloseIcon")
		
		navHeader.text = navText
		navHeader.font = UIFont.systemFont(ofSize: 14, weight: .heavy)
		navHeader.numberOfLines = 1
		
		closeButton.isUserInteractionEnabled = true
		
		navTop.translatesAutoresizingMaskIntoConstraints = false
		navFade.translatesAutoresizingMaskIntoConstraints = false
		navHeader.translatesAutoresizingMaskIntoConstraints = false
		closeButton.translatesAutoresizingMaskIntoConstraints = false
		
		self.addSubview(navTop)
		self.addSubview(navFade)
		self.addSubview(navHeader)
		self.addSubview(closeButton)
		
		self.addConstraints([
		
			// Nav Top
			NSLayoutConstraint(item: navTop, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: navTop, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: navTop, attribute: .trailing, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: navTop, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 70),
			
			// Nav Fade
			NSLayoutConstraint(item: navFade, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: navFade, attribute: .top, relatedBy: .equal, toItem: navTop, attribute: .bottom, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: navFade, attribute: .trailing, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: navFade, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 30),
		
			// Nav Header
			NSLayoutConstraint(item: navHeader, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 20),
			NSLayoutConstraint(item: navHeader, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 56),

			// Close Button
			NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: closeButton, attribute: .trailing, multiplier: 1.0, constant: 18),
			NSLayoutConstraint(item: closeButton, attribute: .centerY, relatedBy: .equal, toItem: navHeader, attribute: .centerY, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: closeButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 20),
			NSLayoutConstraint(item: closeButton, attribute: .width, relatedBy: .equal, toItem: closeButton, attribute: .height, multiplier: 1.0, constant: 0)
		
		])
	
	
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

}
