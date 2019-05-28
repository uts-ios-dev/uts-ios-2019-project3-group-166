//
//  TableData.swift
//  Airport
//
//  Created by Charlie on 29/5/19.
//  Copyright © 2019 UTS. All rights reserved.
//

import Foundation
import CoreLocation

enum TableDataType {
	case Header, Content, Map
}

protocol TableData {
	var dataType: TableDataType { get set }
}

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
	var mapCenter: CLLocation
	var mapDots: Array<CLLocation>

}
