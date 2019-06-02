//
//  ContentData.swift
//  Airport
//
//  Created by Charlie on 2/6/19.
//  Copyright © 2019 UTS. All rights reserved.
//

import Foundation

struct ContentData: TableData {

	var dataType: TableDataType
	var contentString: String
	
	init?(passedDictionary: Dictionary<String, Any>) {
	
		guard let contentString = passedDictionary["content"] as? String else { return nil }
		
		self.dataType = .Content
		self.contentString = contentString
	
	}

}
