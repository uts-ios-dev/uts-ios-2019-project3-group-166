//
//  SpaceCell.swift
//  Airport
//
//  Created by Charlie on 29/5/19.
//  Copyright © 2019 UTS. All rights reserved.
//

import Foundation
import UIKit

class SpaceCell: UITableViewCell {

	let spaceView = UIView()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		self.selectionStyle = .none
		
		spaceView.translatesAutoresizingMaskIntoConstraints = false
		
		self.addSubview(spaceView)
		
		self.addConstraints([
		
			// Space View
			NSLayoutConstraint(item: spaceView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: spaceView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: spaceView, attribute: .trailing, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: spaceView, attribute: .bottom, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: spaceView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 50),
			
		])
		
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
