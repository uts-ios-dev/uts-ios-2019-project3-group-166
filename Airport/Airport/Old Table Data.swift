//
//  TableData.swift
//  Airport
//
//  Created by Charlie on 29/5/19.
//  Copyright © 2019 UTS. All rights reserved.
//

import Foundation
import CoreLocation


struct HeaderData: TableData {
	
	var dataType: TableDataType = .Header
	var headerString: String
	
}

struct ContentData: TableData {

	var dataType: TableDataType = .Content
	var contentString: String

}

struct MapData: TableData {

	var dataType: TableDataType = .Map
	var mapCenter: CLLocationCoordinate2D
	var mapPins: Array<MapPin>

}

struct MapPin {

	var pinLocation: CLLocationCoordinate2D
	var pinTitle: String

}
