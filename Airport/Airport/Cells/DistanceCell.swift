//
//  DistanceCell.swift
//  Airport
//
//  Created by Charlie on 4/6/19.
//  Copyright © 2019 UTS. All rights reserved.
//

import Foundation
import UIKit

class DistanceCell: UITableViewCell {

	let distanceView = UIView()
	let airportEmoji = UILabel()
	let airportName = UILabel()
	let airportDistance = UILabel()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
	
		self.selectionStyle = .none
	
		distanceView.layer.cornerRadius = 18
		distanceView.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.00)
	
		airportEmoji.font = UIFont.systemFont(ofSize: 20)
		airportName.font = UIFont.systemFont(ofSize: 14, weight: .bold)
		airportDistance.font = UIFont.systemFont(ofSize: 12, weight: .heavy)
		airportName.textAlignment = .left
		airportDistance.textAlignment = .left
		
		airportDistance.alpha = 0.50
		
		airportEmoji.translatesAutoresizingMaskIntoConstraints = false
		airportName.translatesAutoresizingMaskIntoConstraints = false
		airportDistance.translatesAutoresizingMaskIntoConstraints = false
		distanceView.translatesAutoresizingMaskIntoConstraints = false
		
		distanceView.addSubview(airportEmoji)
		distanceView.addSubview(airportName)
		distanceView.addSubview(airportDistance)
		self.addSubview(distanceView)
		
		distanceView.addConstraints([
		
			// Airport Emoji
			NSLayoutConstraint(item: airportEmoji, attribute: .leading, relatedBy: .equal, toItem: distanceView, attribute: .leading, multiplier: 1.0, constant: 16),
			NSLayoutConstraint(item: airportEmoji, attribute: .top, relatedBy: .greaterThanOrEqual, toItem: distanceView, attribute: .top, multiplier: 1.0, constant: 10),
			NSLayoutConstraint(item: distanceView, attribute: .bottom, relatedBy: .greaterThanOrEqual, toItem: airportEmoji, attribute: .bottom, multiplier: 1.0, constant: 10),
			NSLayoutConstraint(item: airportEmoji, attribute: .centerY, relatedBy: .equal, toItem: distanceView, attribute: .centerY, multiplier: 1.0, constant: 0),
		
			// Airport Name
			NSLayoutConstraint(item: airportName, attribute: .leading, relatedBy: .equal, toItem: airportEmoji, attribute: .trailing, multiplier: 1.0, constant: 12),
			NSLayoutConstraint(item: airportName, attribute: .top, relatedBy: .equal, toItem: distanceView, attribute: .top, multiplier: 1.0, constant: 10),

			// Airport Distance
			NSLayoutConstraint(item: airportDistance, attribute: .leading, relatedBy: .equal, toItem: airportEmoji, attribute: .trailing, multiplier: 1.0, constant: 12),
			NSLayoutConstraint(item: airportDistance, attribute: .top, relatedBy: .equal, toItem: airportName, attribute: .bottom, multiplier: 1.0, constant: 2),
			NSLayoutConstraint(item: distanceView, attribute: .bottom, relatedBy: .equal, toItem: airportDistance, attribute: .bottom, multiplier: 1.0, constant: 12)
		
		])
		
		self.addConstraints([
		
			// Distance View
			NSLayoutConstraint(item: distanceView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 16),
			NSLayoutConstraint(item: distanceView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 10),
			NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: distanceView, attribute: .trailing, multiplier: 1.0, constant: 16),
			NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: distanceView, attribute: .bottom, multiplier: 1.0, constant: 10)
		
		])
		
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
