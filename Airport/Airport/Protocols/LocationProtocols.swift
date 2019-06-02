//
//  LocationProtocols.swift
//  Airport
//
//  Created by Charlie on 2/6/19.
//  Copyright © 2019 UTS. All rights reserved.
//

import Foundation

protocol AirportDelegate: class {

	func updateAirport(passedCode: AirportCode)

}
