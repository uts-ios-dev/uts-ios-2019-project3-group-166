//
//  AppData.swift
//  Airport
//
//  Created by Charlie on 29/5/19.
//  Copyright © 2019 UTS. All rights reserved.
//

import Foundation

class AppData: TableData {

	var dataType: TableDataType
	var appTitle: String
	var appDescription: String
	var appURL: URL
	var appIcon: String
	
	init?(passedDictionary: Dictionary<String, Any>) {
	
		guard let appTitle = passedDictionary["title"] as? String, let appDescription = passedDictionary["description"] as? String, let appID = passedDictionary["id"] as? String, let appIcon = passedDictionary["icon"] as? String else { return nil }
	
		self.dataType = .App
		self.appTitle = appTitle
		self.appDescription = appDescription
		self.appURL = URL(string: "itms-apps://itunes.apple.com/au/app/\(appID)")!
		self.appIcon = appIcon
	
	}

}
