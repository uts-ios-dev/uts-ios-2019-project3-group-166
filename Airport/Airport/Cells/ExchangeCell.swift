//
//  ExchangeCell.swift
//  Airport
//
//  Created by Charlie on 4/6/19.
//  Copyright © 2019 UTS. All rights reserved.
//

import Foundation
import UIKit

class ExchangeCell: UITableViewCell {
	
    let exchangeIcon = UIImageView()
    let exchangeTitle = UILabel()
    let exchangeRate = UILabel()
	
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
		
        self.selectionStyle = .none
		
        exchangeTitle.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        exchangeTitle.textColor = UIColor.black
        exchangeRate.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        exchangeRate.textColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 0.85)
        exchangeTitle.numberOfLines = 0
        exchangeRate.numberOfLines = 0
		
        exchangeIcon.translatesAutoresizingMaskIntoConstraints = false
        exchangeTitle.translatesAutoresizingMaskIntoConstraints = false
        exchangeRate.translatesAutoresizingMaskIntoConstraints = false
		
        self.addSubview(exchangeIcon)
        self.addSubview(exchangeTitle)
        self.addSubview(exchangeRate)
		
        self.addConstraints([
			
            // Exchange Icon
            NSLayoutConstraint(item: exchangeIcon, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 16),
            NSLayoutConstraint(item: exchangeIcon, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 16),
            NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .greaterThanOrEqual, toItem: exchangeIcon, attribute: .bottom, multiplier: 1.0, constant: 16),
            NSLayoutConstraint(item: exchangeIcon, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 40),
            NSLayoutConstraint(item: exchangeIcon, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 40),
			
            // Exchange Title
            NSLayoutConstraint(item: exchangeTitle, attribute: .leading, relatedBy: .equal, toItem: exchangeIcon, attribute: .trailing, multiplier: 1.0, constant: 12),
            NSLayoutConstraint(item: exchangeTitle, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 16),
            NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: exchangeTitle, attribute: .trailing, multiplier: 1.0, constant: 16),
			
            // Exchange Description
            NSLayoutConstraint(item: exchangeRate, attribute: .leading, relatedBy: .equal, toItem: exchangeIcon, attribute: .trailing, multiplier: 1.0, constant: 12),
            NSLayoutConstraint(item: exchangeRate, attribute: .top, relatedBy: .equal, toItem: exchangeTitle, attribute: .bottom, multiplier: 1.0, constant: 2),
             NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: exchangeRate, attribute: .trailing, multiplier: 1.0, constant: 16),
            NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .greaterThanOrEqual, toItem: exchangeRate, attribute: .bottom, multiplier: 1.0, constant: 14),
			
		])
		
    }
	
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
	
    func populateCell(passedData: ExchangeData) {
		
		exchangeIcon.image = UIImage(named: passedData.exchangeIcon)
        exchangeTitle.text = passedData.exchangeTitle
        exchangeRate.text = passedData.exchangeRate
		
    }
	
}
