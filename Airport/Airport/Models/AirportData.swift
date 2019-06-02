//
//  AirportData.swift
//  Airport
//
//  Created by Charlie on 2/6/19.
//  Copyright © 2019 UTS. All rights reserved.
//

import Foundation
import CoreLocation

enum AirportCode: String {
	case SYD, MEX
}

struct AirportNotification {

	let airportCode: AirportCode
	let airportLocation: CLLocationCoordinate2D
	let airpotRadius: CLLocationDistance
	
	let notificationTitle: String
	let notificationSubtitle: String
	let notificationBody: String
	
	init(airportCode: AirportCode) {
	
		self.airportCode = airportCode
	
		switch airportCode {
		
			case .SYD:
			self.airportLocation = CLLocationCoordinate2D(latitude: -33.936310, longitude: 151.166538)
			self.airpotRadius = 1000
			self.notificationTitle = "G'day!"
			self.notificationSubtitle = "Welcome to Sydney International Aiport 🇦🇺"
			self.notificationBody = "Come check out all the latest deals, find currency exchanges and transport information."
			
			case .MEX:
			self.airportLocation = CLLocationCoordinate2D(latitude: 19.435328, longitude: -99.082448)
			self.airpotRadius = 2000
			self.notificationTitle = "Hola!"
			self.notificationSubtitle = "Welcome to Mexico City International Aiport 🇲🇽"
			self.notificationBody = "Come check out all the latest deals, find currency exchanges and transport information."
		
		}
	
	}

}

struct AirportData {

	let airportCode: AirportCode?
	let airportHeader: String
	let airportImage: String
	var homeData: Array<MenuData>
	var transportData: Array<TableData>

	init() {
		
		self.airportCode = nil
		self.airportHeader = "Hmm...\nYou don't seem to be at an Airport."
		self.airportImage = ""
		self.transportData = []
		self.homeData = []
	
	}

	init(passedCode: AirportCode) {
	
		self.airportCode = passedCode
		self.transportData = []
		self.homeData = []
	
		guard let jsonPath = Bundle.main.path(forResource: passedCode.rawValue, ofType: "json"), let jsonData = try? Data(contentsOf: URL(fileURLWithPath: jsonPath), options: .mappedIfSafe), let jsonSerialised = try? JSONSerialization.jsonObject(with: jsonData, options: .allowFragments), let jsonDictionary = jsonSerialised as? Dictionary<String, Any> else {
		
			self.airportHeader = "Error loading JSON data"
			self.airportImage = ""
			
			return
		
		}
		
		if let airportHeader = jsonDictionary["header"] as? String, let airportImage = jsonDictionary["image"] as? String {
			
			self.airportHeader = airportHeader
			self.airportImage = airportImage
			
		} else {
		
			self.airportHeader = "Error parsing JSON"
			self.airportImage = ""
		
		}
		
		if let transportData = jsonDictionary["transport"] as? Array<Dictionary<String, Any>> {
			
			self.transportData = transportData.compactMap({ createData(passedDictionary: $0) })
			if self.transportData.count > 0 { self.homeData.append(MenuData(menuTitle: "Transport Information", menuDescription: "Public Transport, Taxi", menuIcon: "Transport")) }
			
		}
		
		// Other Home Cells
//		MenuData(menuTitle: "Currency Exchange", menuDescription: "Currency Exchange, Money Apps", menuIcon: "Currency"),
//        MenuData(menuTitle: "Retail", menuDescription: "Shops, Duty-Free", menuIcon: "Shopping"),
//        MenuData(menuTitle: "Food", menuDescription: "Fast Food, Cafes", menuIcon: "Food")
	
	}
	
	func createData(passedDictionary: Dictionary<String, Any>) -> TableData? {
	
		guard let stringType = passedDictionary["type"] as? String, let dataType = TableDataType.init(rawValue: stringType) else { return nil }
		
		switch dataType {
		
			case .Header:
			return HeaderData(passedDictionary: passedDictionary)
			
			case .Content:
			return ContentData(passedDictionary: passedDictionary)
			
			case .App:
			return AppData(passedDictionary: passedDictionary)
			
			case .Map:
			return MapData(passedDictionary: passedDictionary)
			
			case .Space:
			return SpaceData()
			
		}
	
	}
	
}
