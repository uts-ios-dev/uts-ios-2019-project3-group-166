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

struct Airport {

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

