//
//  MapCell.swift
//  Airport
//
//  Created by Charlie on 29/5/19.
//  Copyright © 2019 UTS. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class MapCell: UITableViewCell {

	var mapView = MKMapView(frame: CGRect.zero)
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
	
		self.selectionStyle = .none
	
		mapView.translatesAutoresizingMaskIntoConstraints = false
		mapView.isUserInteractionEnabled = false
		mapView.showsBuildings = true
		mapView.showsUserLocation = true
		mapView.showsPointsOfInterest = true
		
		self.addSubview(mapView)
		
		self.addConstraints([
		
			// Map View
			NSLayoutConstraint(item: mapView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: mapView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 10),
			NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: mapView, attribute: .trailing, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: mapView, attribute: .bottom, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: mapView, attribute: .height, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1.0, constant: 0)
			
		])
	
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func populateCell(passedData: MapData) {
	
		mapView.camera = MKMapCamera(lookingAtCenter: passedData.mapCenter, fromDistance: CLLocationDistance(floatLiteral: 700.0), pitch: 0.0, heading: CLLocationDirection(floatLiteral: 0.0))
		
		for eachPin in passedData.mapPins {
		
			let mapPin = MKPointAnnotation()
			mapPin.coordinate = eachPin.pinLocation
			mapPin.title = eachPin.pinTitle

			mapView.addAnnotation(mapPin)
		
		}
		
	}
	
}
