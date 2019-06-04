//
//  HomeController.swift
//  Airport
//
//  Created by Charlie on 29/5/19.
//  Copyright © 2019 UTS. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation
import MapKit

class HomeController: UIViewController {
	
	let mapView = MKMapView()
	let headerView = UIView()
	let headerLabel = UILabel()
	let tableView = UITableView()
	
	var airportData = AirportData()
	
	var airportLocations: Array<AirportLocation> = Array<AirportCode>.init([.SYD, .MEX]).map({ AirportLocation(airportCode: $0)
	})
	
	let locationManager = CLLocationManager()
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		for eachLocation in airportLocations { createGeofence(passedLocation: eachLocation) }
		
		tableView.delegate = self
		tableView.dataSource = self
		locationManager.delegate = self

		locationManager.desiredAccuracy = kCLLocationAccuracyBest
		locationManager.startUpdatingLocation()
		locationManager.startMonitoringSignificantLocationChanges()
		
        tableView.register(MenuCell.self, forCellReuseIdentifier: "MenuCell")
        tableView.register(DistanceCell.self, forCellReuseIdentifier: "DistanceCell")
		
		self.view.backgroundColor = UIColor.white
		
		headerView.backgroundColor = UIColor.white
		headerView.layer.cornerRadius = 30
		headerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
		
		headerLabel.font = UIFont.systemFont(ofSize: 18, weight: .heavy)
		headerLabel.text = airportData.airportHeader
		headerLabel.numberOfLines = 0
		
        tableView.estimatedRowHeight = 88.0
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor.clear
        tableView.showsVerticalScrollIndicator = false
		
		mapView.isUserInteractionEnabled = false
		mapView.showsUserLocation = true
		
		mapView.translatesAutoresizingMaskIntoConstraints = false
		headerView.translatesAutoresizingMaskIntoConstraints = false
		headerLabel.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
		
		headerView.addSubview(headerLabel)
		self.view.addSubview(mapView)
		self.view.addSubview(headerView)
        self.view.addSubview(tableView)
		
		headerView.addConstraints([
		
			// Header Label
			NSLayoutConstraint(item: headerLabel, attribute: .leading, relatedBy: .equal, toItem: headerView, attribute: .leading, multiplier: 1.0, constant: 20),
			NSLayoutConstraint(item: headerLabel, attribute: .top, relatedBy: .equal, toItem: headerView, attribute: .top, multiplier: 1.0, constant: 30),
			NSLayoutConstraint(item: headerView, attribute: .trailing, relatedBy: .equal, toItem: headerLabel, attribute: .trailing, multiplier: 1.0, constant: 20),
			NSLayoutConstraint(item: headerView, attribute: .bottom, relatedBy: .equal, toItem: headerLabel, attribute: .bottom, multiplier: 1.0, constant: 10)
		
		])
		
        self.view.addConstraints([
			
			// Map View
			NSLayoutConstraint(item: mapView, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: mapView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: self.view!, attribute: .trailing, relatedBy: .equal, toItem: mapView, attribute: .trailing, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: mapView, attribute: .height, relatedBy: .equal, toItem: mapView, attribute: .width, multiplier: 1.0, constant: 30),
			
			// Header View
			NSLayoutConstraint(item: headerView, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: headerView, attribute: .top, relatedBy: .equal, toItem: mapView, attribute: .bottom, multiplier: 1.0, constant: -30),
			NSLayoutConstraint(item: self.view!, attribute: .trailing, relatedBy: .equal, toItem: headerView, attribute: .trailing, multiplier: 1.0, constant: 0),

			// Table View
			NSLayoutConstraint(item: tableView, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: tableView, attribute: .top, relatedBy: .equal, toItem: headerView, attribute: .bottom, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: self.view!, attribute: .trailing, relatedBy: .equal, toItem: tableView, attribute: .trailing, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: self.view!, attribute: .bottom, relatedBy: .equal, toItem: tableView, attribute: .bottom, multiplier: 1.0, constant: 0)
			
        ])
		
        NotificationCenter.default.addObserver(self, selector: #selector(checkLocation), name: UIApplication.willEnterForegroundNotification, object: nil)
		
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		checkLocation()
	}
	
}

extension HomeController: UITableViewDelegate, UITableViewDataSource {

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
	
		if airportData.outsideAirport {
			return airportData.distanceData.count
		} else {
			return airportData.homeData.count
		}
		
    }
	
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		if airportData.outsideAirport {
		
			let distanceCell = self.tableView.dequeueReusableCell(withIdentifier: "DistanceCell", for: indexPath) as! DistanceCell
			
			distanceCell.airportEmoji.text = airportData.distanceData[indexPath.row].airportEmoji
			distanceCell.airportName.text = airportData.distanceData[indexPath.row].airportName
			distanceCell.airportDistance.text = "\(airportData.distanceData[indexPath.row].airportDistance) km away"
			
			return distanceCell
		
		} else {
			
			let menuCell = self.tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuCell
			menuCell.populateCell(passedData: airportData.homeData[indexPath.row])
			
			return menuCell
			
		}
		
    }
	
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
		if airportData.outsideAirport { return }
		
		switch airportData.homeData[indexPath.row].menuType {
		
			case .Transport:
			self.present(DetailController(tableData: airportData.transportData, navHeader: "Transport"), animated: true, completion: nil)
			
			case .Restaurant:
			self.present(DetailController(tableData: airportData.restaurantData, navHeader: "Restaurants"), animated: true, completion: nil)
			
			case .Shopping:
			self.present(DetailController(tableData: airportData.shoppingData, navHeader: "Shopping"), animated: true, completion: nil)
			
			case .Currency:
			self.present(DetailController(tableData: airportData.currencyData, navHeader: "Currency"), animated: true, completion: nil)
		
		}
		
	}

}

extension HomeController: CLLocationManagerDelegate {

	func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
		print("Error: Failed to retrieve location - \(error.localizedDescription)")
		self.airportData.errorLocating()
		updateData(passedAirport: self.airportData)
	}

	func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
		
		guard let userLocation = locations.first else {
			self.airportData.errorLocating()
			updateData(passedAirport: self.airportData)
			return
		}
		
		mapView.setCamera(MKMapCamera(lookingAtCenter: userLocation.coordinate, fromDistance: 10000, pitch: 0.0, heading: 0.0), animated: true)
		
		for (eachIndex, eachLocation) in airportLocations.enumerated() {
		
			let userDistance = userLocation.distance(from: CLLocation(latitude: eachLocation.airportLocation.latitude, longitude: eachLocation.airportLocation.longitude))
			
			airportLocations[eachIndex].updateDistance(passedDistance: Int(userDistance / 1000))
		
			if userDistance < eachLocation.airportRadius {
				
				updateData(passedAirport: AirportData(passedCode: eachLocation.airportCode))
				return
				
			}
		
		}
		
		airportData.outsideAirport(airportLocations: airportLocations)
		updateData(passedAirport: airportData)
		
		return
		
    }

}

extension HomeController: AirportDelegate {
	
	func updateAirport(passedCode: AirportCode) {
		updateData(passedAirport: AirportData(passedCode: passedCode))
	}
	
}

extension HomeController {

	@objc func checkLocation() {
		locationManager.requestLocation()
	}

	func createGeofence(passedLocation: AirportLocation) {
	
		let notificationObject = AirportNotification(airportLocation: passedLocation)
	
		let notificationRegion = CLCircularRegion(center: notificationObject.airportLocation.airportLocation, radius: notificationObject.airportLocation.airportRadius, identifier: notificationObject.airportLocation.airportCode.rawValue)
		notificationRegion.notifyOnEntry = true
		
		locationManager.startMonitoring(for: notificationRegion)
	
	}
	
	func updateData(passedAirport: AirportData) {
	
		DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.0, execute: {
		
			for eachLocation in self.airportLocations { self.createGeofence(passedLocation: eachLocation) }
			
			self.airportData = passedAirport
			
			self.headerLabel.text = self.airportData.airportHeader
			self.tableView.reloadData()
		
		})
	
	}

}

