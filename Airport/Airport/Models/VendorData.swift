//
//  VendorData.swift
//  Airport
//
//  Created by Charlie on 4/6/19.
//  Copyright © 2019 UTS. All rights reserved.
//

import Foundation

struct VendorData: TableData {

	var dataType: TableDataType
	var vendorTitle: String
	var vendorDescription: String
	var vendorIcon: String
	var vendorStars: Int

	init?(passedDictionary: Dictionary<String, Any>) {
	
		guard let vendorTitle = passedDictionary["title"] as? String, let vendorDescription = passedDictionary["description"] as? String, let vendorIcon = passedDictionary["icon"] as? String, let vendorStars = passedDictionary["stars"] as? Int else { return nil }
	
		self.dataType = .Vendor
		self.vendorTitle = vendorTitle
		self.vendorDescription = vendorDescription
		self.vendorIcon = vendorIcon
		self.vendorStars = vendorStars
		
	}

}
