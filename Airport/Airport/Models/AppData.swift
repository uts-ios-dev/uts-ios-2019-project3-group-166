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
	
	init(appTitle: String, appDescription: String, appID: String, appIcon: String) {
	
		self.dataType = .App
		self.appTitle = appTitle
		self.appDescription = appDescription
		self.appURL = URL(string: "itms-apps://itunes.apple.com/au/app/\(appID)")!
		self.appIcon = appIcon
	
	}

}
