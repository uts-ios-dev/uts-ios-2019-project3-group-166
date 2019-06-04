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

struct AirportLocation {

	let airportCode: AirportCode
	let airportLocation: CLLocationCoordinate2D
	let airportRadius: CLLocationDistance
	let airportEmoji: String
	let airportName: String
	var airportDistance: Int
	
	init(airportCode: AirportCode) {
	
		self.airportCode = airportCode
		self.airportDistance = 0
	
		switch airportCode {
		
			case .SYD:
			self.airportLocation = CLLocationCoordinate2D(latitude: -33.936310, longitude: 151.166538)
			self.airportRadius = 1000
			self.airportName = "Sydney International Airport"
			self.airportEmoji = "🇦🇺"
			
			case .MEX:
			self.airportLocation = CLLocationCoordinate2D(latitude: 19.435328, longitude: -99.082448)
			self.airportRadius = 2000
			self.airportName = "Mexico City International Airport"
			self.airportEmoji = "🇲🇽"
			
		}
	
	}
	
	mutating func updateDistance(passedDistance: Int) { self.airportDistance = passedDistance }

}

struct AirportNotification {

	let notificationTitle: String
	let notificationSubtitle: String
	let notificationBody: String
	let airportLocation: AirportLocation
	
	init(airportLocation: AirportLocation) {
	
		self.airportLocation = airportLocation
	
		switch airportLocation.airportCode {
		
			case .SYD:
			self.notificationTitle = "G'day!"
			self.notificationSubtitle = "Welcome to Sydney International Aiport"
			self.notificationBody = "Come check out all the latest deals, find currency exchanges and transport information."
			
			case .MEX:
			self.notificationTitle = "Hola!"
			self.notificationSubtitle = "Welcome to Mexico City International Aiport"
			self.notificationBody = "Come check out all the latest deals, find currency exchanges and transport information."
		
		}
	
	}

}

struct AirportData {

	var airportCode: AirportCode?
	var airportHeader: String
	var airportImage: String
	var homeData: Array<MenuData> = []
	var distanceData: Array<AirportLocation> = []
	var transportData: Array<TableData> = []
	var restaurantData: Array<TableData> = []
	var shoppingData: Array<TableData> = []
	var currencyData: Array<TableData> = []
	var outsideAirport: Bool

	init() {
		
		self.airportCode = nil
		self.airportHeader = "Loading..."
		self.airportImage = ""
		self.outsideAirport = false
	
	}

	init(passedCode: AirportCode) {
	
		self.airportCode = passedCode
		self.outsideAirport = false
	
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
			if self.transportData.count > 0 { self.homeData.append(MenuData(menuType: .Transport)) }
			
		}
		
		if let restaurantData = jsonDictionary["restaurants"] as? Array<Dictionary<String, Any>> {
			
			self.restaurantData = restaurantData.compactMap({ createData(passedDictionary: $0) })
			if self.restaurantData.count > 0 { self.homeData.append(MenuData(menuType: .Restaurant)) }
			
		}
		
		if let shoppingData = jsonDictionary["shopping"] as? Array<Dictionary<String, Any>> {
			
			self.shoppingData = shoppingData.compactMap({ createData(passedDictionary: $0) })
			if self.shoppingData.count > 0 { self.homeData.append(MenuData(menuType: .Shopping)) }
			
		}
		if let currencyData = jsonDictionary["currency"] as? Array<Dictionary<String, Any>> {
			
			self.currencyData = currencyData.compactMap({ createData(passedDictionary: $0) })
			if self.currencyData.count > 0 { self.homeData.append(MenuData(menuType: .Currency)) }
			
		}
		
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
			
			case .Vendor:
			return VendorData(passedDictionary: passedDictionary)
			
			case .Exchange:
			return ExchangeData(passedDictionary: passedDictionary)
			
		}
	
	}
	
	mutating func errorLocating() {
	
		self.airportCode = nil
		self.airportHeader = "Thinking..."
		self.airportImage = ""
		self.transportData = []
		self.homeData = []
		self.distanceData = []
		self.outsideAirport = false
	
	}
	
	mutating func outsideAirport(airportLocations: Array<AirportLocation>) {
	
		self.airportCode = nil
		self.airportHeader = "Nearest Airports"
		self.airportImage = ""
		self.transportData = []
		self.homeData = []
		self.distanceData = airportLocations.sorted(by: { $0.airportDistance < $1.airportDistance })
		self.outsideAirport = true
	
	}
	
}
