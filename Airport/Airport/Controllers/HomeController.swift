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

class HomeController: UIViewController {
	
	let headerLabel = UILabel()
	let tableView = UITableView()
	
	var airportData: AirportData
	
	let registeredAirports: Array<AirportCode> = [.SYD, .MEX]
	let locationManager = CLLocationManager()
	
	init() {
	
		locationManager.requestLocation()
		
		airportData = AirportData()
	
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		for eachAirport in registeredAirports { createGeofence(passedCode: eachAirport) }
	
		tableView.delegate = self
		tableView.dataSource = self
		
        tableView.register(MenuCell.self, forCellReuseIdentifier: "MenuCell")
		
		self.view.backgroundColor = UIColor.white
		
		headerLabel.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
		headerLabel.text = airportData.airportHeader
		headerLabel.numberOfLines = 0
		
        tableView.estimatedRowHeight = 88.0
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor.clear
		
		headerLabel.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
		
		self.view.addSubview(headerLabel)
        self.view.addSubview(tableView)
		
        self.view.addConstraints([
			
			// Header Label
			NSLayoutConstraint(item: headerLabel, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 16),
			NSLayoutConstraint(item: headerLabel, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: 70),
			NSLayoutConstraint(item: self.view!, attribute: .trailing, relatedBy: .equal, toItem: headerLabel, attribute: .trailing, multiplier: 1.0, constant: 0),
			
			// Table View
			NSLayoutConstraint(item: tableView, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: tableView, attribute: .top, relatedBy: .equal, toItem: headerLabel, attribute: .bottom, multiplier: 1.0, constant: 30),
			NSLayoutConstraint(item: self.view!, attribute: .trailing, relatedBy: .equal, toItem: tableView, attribute: .trailing, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: self.view!, attribute: .bottom, relatedBy: .equal, toItem: tableView, attribute: .bottom, multiplier: 1.0, constant: 0)
			
        ])
		
    }
	
}

extension HomeController: UITableViewDelegate, UITableViewDataSource {

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return airportData.homeData.count
    }
	
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let menuCell = self.tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuCell
		menuCell.populateCell(passedData: airportData.homeData[indexPath.row])
		
		return menuCell
		
    }
	
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { return }

}

extension HomeController: AirportDelegate {
	
	func updateAirport(passedCode: AirportCode) {
		
		loadData(passedCode: passedCode)
		
		for eachAirport in registeredAirports { createGeofence(passedCode: eachAirport) }
		
	}
	
}

extension HomeController {

	func createGeofence(passedCode: AirportCode) {
	
		let airportObject = AirportNotification(airportCode: passedCode)
	
		let notificationRegion = CLCircularRegion(center: airportObject.airportLocation, radius: airportObject.airpotRadius, identifier: airportObject.airportCode.rawValue)
		notificationRegion.notifyOnEntry = true
		
		locationManager.startMonitoring(for: notificationRegion)
	
	}
	
	func loadData(passedCode: AirportCode) {
	
		DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.0, execute: {
		
			self.airportData = AirportData(passedCode: passedCode)
			
			self.headerLabel.text = self.airportData.airportHeader
			self.tableView.reloadData()
		
		})
	
	}

}

