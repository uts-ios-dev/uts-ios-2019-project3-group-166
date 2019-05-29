//
//  AppCell.swift
//  Airport
//
//  Created by Charlie on 29/5/19.
//  Copyright © 2019 UTS. All rights reserved.
//

import Foundation
import UIKit

class AppCell: UITableViewCell {

	let appBackground = UIView()
	let appIcon = UIImageView()
	let appTitle = UILabel()
	let appDescription = UILabel()
	let appDownload = AppDownload()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		self.selectionStyle = .none
		
		appBackground.backgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1.00)
		appBackground.layer.cornerRadius = 30
		
		appIcon.layer.cornerRadius = 14
		appIcon.clipsToBounds = true
		appTitle.font = UIFont.systemFont(ofSize: 18, weight: .bold)
		appTitle.textColor = UIColor.black
		appDescription.font = UIFont.systemFont(ofSize: 12, weight: .medium)
		appDescription.textColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 0.85)
		appTitle.numberOfLines = 0
		appDescription.numberOfLines = 0
		
		appBackground.translatesAutoresizingMaskIntoConstraints = false
		appIcon.translatesAutoresizingMaskIntoConstraints = false
		appTitle.translatesAutoresizingMaskIntoConstraints = false
		appDescription.translatesAutoresizingMaskIntoConstraints = false
		appDownload.translatesAutoresizingMaskIntoConstraints = false
		
		appBackground.addSubview(appIcon)
		appBackground.addSubview(appTitle)
		appBackground.addSubview(appDescription)
		appBackground.addSubview(appDownload)
		self.addSubview(appBackground)
		
		self.addConstraints([
			
			// App Background
			NSLayoutConstraint(item: appBackground, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 14),
			NSLayoutConstraint(item: appBackground, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 10),
			NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: appBackground, attribute: .trailing, multiplier: 1.0, constant: 14),
			NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: appBackground, attribute: .bottom, multiplier: 1.0, constant: 10)
		
		])

		appBackground.addConstraints([

			// App Icon
			NSLayoutConstraint(item: appIcon, attribute: .leading, relatedBy: .equal, toItem: appBackground, attribute: .leading, multiplier: 1.0, constant: 16),
			NSLayoutConstraint(item: appIcon, attribute: .top, relatedBy: .equal, toItem: appBackground, attribute: .top, multiplier: 1.0, constant: 16),
			NSLayoutConstraint(item: appBackground, attribute: .bottom, relatedBy: .greaterThanOrEqual, toItem: appIcon, attribute: .bottom, multiplier: 1.0, constant: 16),
			NSLayoutConstraint(item: appIcon, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 50),
			NSLayoutConstraint(item: appIcon, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 50),
		
			// App Title
			NSLayoutConstraint(item: appTitle, attribute: .leading, relatedBy: .equal, toItem: appIcon, attribute: .trailing, multiplier: 1.0, constant: 12),
			NSLayoutConstraint(item: appTitle, attribute: .top, relatedBy: .equal, toItem: appBackground, attribute: .top, multiplier: 1.0, constant: 16),

			// App Description
			NSLayoutConstraint(item: appDescription, attribute: .leading, relatedBy: .equal, toItem: appIcon, attribute: .trailing, multiplier: 1.0, constant: 12),
			NSLayoutConstraint(item: appDescription, attribute: .top, relatedBy: .equal, toItem: appTitle, attribute: .bottom, multiplier: 1.0, constant: 2),
			NSLayoutConstraint(item: appBackground, attribute: .bottom, relatedBy: .greaterThanOrEqual, toItem: appDescription, attribute: .bottom, multiplier: 1.0, constant: 14),

			// App Download
			NSLayoutConstraint(item: appDownload, attribute: .leading, relatedBy: .equal, toItem: appTitle, attribute: .trailing, multiplier: 1.0, constant: 12),
			NSLayoutConstraint(item: appDownload, attribute: .leading, relatedBy: .equal, toItem: appDescription, attribute: .trailing, multiplier: 1.0, constant: 12),
			NSLayoutConstraint(item: appBackground, attribute: .trailing, relatedBy: .equal, toItem: appDownload, attribute: .trailing, multiplier: 1.0, constant: 16),
			NSLayoutConstraint(item: appDownload, attribute: .centerY, relatedBy: .equal, toItem: appBackground, attribute: .centerY, multiplier: 1.0, constant: 0)
		
		])
		
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func populateCell(passedData: AppData) {
	
		appIcon.image = UIImage(named: passedData.appIcon)
		appTitle.text = passedData.appTitle
		appDescription.text = passedData.appDescription
	
	}
	
}
