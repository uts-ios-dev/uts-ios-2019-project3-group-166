//
//  ExchangeData.swift
//  Airport
//
//  Created by Charlie on 4/6/19.
//  Copyright © 2019 UTS. All rights reserved.
//

import Foundation

struct ExchangeData: TableData {

	var dataType: TableDataType
	var exchangeTitle: String
	var exchangeRate: String
	var exchangeIcon: String

	init?(passedDictionary: Dictionary<String, Any>) {
	
		guard let exchangeTitle = passedDictionary["title"] as? String, let exchangeRate = passedDictionary["rate"] as? String, let exchangeIcon = passedDictionary["icon"] as? String else { return nil }
	
		self.dataType = .Exchange
		self.exchangeTitle = exchangeTitle
		self.exchangeRate = exchangeRate
		self.exchangeIcon = exchangeIcon
		
	}

}
