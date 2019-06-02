//
//  HeaderData.swift
//  Airport
//
//  Created by Charlie on 2/6/19.
//  Copyright © 2019 UTS. All rights reserved.
//

import Foundation

struct HeaderData: TableData {
	
	var dataType: TableDataType
	var headerString: String
	
	init?(passedDictionary: Dictionary<String, Any>) {
	
		guard let headerString = passedDictionary["header"] as? String else { return nil }
		
		self.dataType = .Header
		self.headerString = headerString
	
	}
	
}
