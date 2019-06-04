//
//  VendorCell.swift
//  Airport
//
//  Created by Charlie on 4/6/19.
//  Copyright © 2019 UTS. All rights reserved.
//

import Foundation
import UIKit

class VendorCell: UITableViewCell {
	
    let vendorIcon = UIImageView()
    let vendorTitle = UILabel()
    let vendorDescription = UILabel()
	
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
		
        self.selectionStyle = .none
		
        vendorTitle.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        vendorTitle.textColor = UIColor.black
        vendorDescription.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        vendorDescription.textColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 0.85)
        vendorTitle.numberOfLines = 0
        vendorDescription.numberOfLines = 0
		
        vendorIcon.translatesAutoresizingMaskIntoConstraints = false
        vendorTitle.translatesAutoresizingMaskIntoConstraints = false
        vendorDescription.translatesAutoresizingMaskIntoConstraints = false
		
        self.addSubview(vendorIcon)
        self.addSubview(vendorTitle)
        self.addSubview(vendorDescription)
		
        self.addConstraints([
			
            // Vendor Icon
            NSLayoutConstraint(item: vendorIcon, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 16),
            NSLayoutConstraint(item: vendorIcon, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 16),
            NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .greaterThanOrEqual, toItem: vendorIcon, attribute: .bottom, multiplier: 1.0, constant: 16),
            NSLayoutConstraint(item: vendorIcon, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 40),
            NSLayoutConstraint(item: vendorIcon, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 40),
			
            // Vendor Title
            NSLayoutConstraint(item: vendorTitle, attribute: .leading, relatedBy: .equal, toItem: vendorIcon, attribute: .trailing, multiplier: 1.0, constant: 12),
            NSLayoutConstraint(item: vendorTitle, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 16),
            NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: vendorTitle, attribute: .trailing, multiplier: 1.0, constant: 16),
			
            // Vendor Description
            NSLayoutConstraint(item: vendorDescription, attribute: .leading, relatedBy: .equal, toItem: vendorIcon, attribute: .trailing, multiplier: 1.0, constant: 12),
            NSLayoutConstraint(item: vendorDescription, attribute: .top, relatedBy: .equal, toItem: vendorTitle, attribute: .bottom, multiplier: 1.0, constant: 2),
             NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: vendorDescription, attribute: .trailing, multiplier: 1.0, constant: 16),
            NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .greaterThanOrEqual, toItem: vendorDescription, attribute: .bottom, multiplier: 1.0, constant: 14),
			
		])
		
    }
	
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
	
    func populateCell(passedData: VendorData) {
		
		vendorIcon.image = UIImage(named: passedData.vendorIcon)
        vendorTitle.text = passedData.vendorTitle
        vendorDescription.text = passedData.vendorDescription
		
    }
	
}
