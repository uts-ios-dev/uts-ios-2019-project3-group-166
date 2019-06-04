//
//  MapData.swift
//  Airport
//
//  Created by Charlie on 2/6/19.
//  Copyright © 2019 UTS. All rights reserved.
//

import Foundation
import CoreLocation


struct MapPin {

	var pinLocation: CLLocationCoordinate2D
	var pinTitle: String
	
	init?(passedDictionary: Dictionary<String, Any>) {
	
		guard let pinLatitude = passedDictionary["latitude"] as? Double, let pinLongitude = passedDictionary["longitude"] as? Double, let pinTitle = passedDictionary["title"] as? String else { return nil }
		
		self.pinLocation = CLLocationCoordinate2D(latitude: pinLatitude, longitude: pinLongitude)
		self.pinTitle = pinTitle
	
	}

}

struct MapData: TableData {

	var dataType: TableDataType
	var mapCenter: CLLocationCoordinate2D
	var mapPins: Array<MapPin>
	
	init?(passedDictionary: Dictionary<String, Any>) {
	
		guard let mapLatitude = passedDictionary["latitude"] as? Double, let mapLongitude = passedDictionary["longitude"] as? Double else { return nil }
		
		self.dataType = .Map
		self.mapCenter = CLLocationCoordinate2D(latitude: mapLatitude, longitude: mapLongitude)
		
		if let pinsData = passedDictionary["pins"] as? Array<Dictionary<String, Any>> {
			self.mapPins = pinsData.compactMap({ MapPin(passedDictionary: $0) })
		} else {
			self.mapPins = []
		}
	
	}

}
