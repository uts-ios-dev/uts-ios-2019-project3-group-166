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

class HomeController: UITableViewController {
	
	let locationManager = CLLocationManager()
	let registeredAirports: Array<AirportCode> = [.SYD, .MEX]
	
    let tableData: Array<TableData> = [
//        HeaderData(dataType: .Header, headerString: "Welcome to Sydney Airport"),
//        MenuData(menuTitle: "Transport Information", menuDescription: "Public Transport, Taxi", menuIcon: "Transport"),
//        MenuData(menuTitle: "Currency Exchange", menuDescription: "Currency Exchange, Money Apps", menuIcon: "Currency"),
//        MenuData(menuTitle: "Retail", menuDescription: "Shops, Duty-Free", menuIcon: "Shopping"),
//        MenuData(menuTitle: "Food", menuDescription: "Fast Food, Cafes", menuIcon: "Food")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
		
		self.tableView.backgroundColor = UIColor.green
		
        self.tableView.register(HeaderCell.self, forCellReuseIdentifier: "HeaderCell")
        self.tableView.register(MenuCell.self, forCellReuseIdentifier: "ContentCell")
        
        self.tableView.estimatedRowHeight = 88.0
        self.tableView.rowHeight = UITableView.automaticDimension
		
        registeredAirports.map({ createGeofence(passedCode: $0) })
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch tableData[indexPath.row].dataType {
            
        case .Header:
            let headerCell = self.tableView.dequeueReusableCell(withIdentifier: "HeaderCell", for: indexPath) as! HeaderCell
            headerCell.populateCell(passedData: tableData[indexPath.row] as! HeaderData)
            return headerCell
            
        case .Content:
            let contentCell = self.tableView.dequeueReusableCell(withIdentifier: "ContentCell", for: indexPath) as! ContentCell
            contentCell.populateCell(passedData: tableData[indexPath.row] as! ContentData)
            return contentCell
            
        case .Map:
            let mapCell = self.tableView.dequeueReusableCell(withIdentifier: "MapCell", for: indexPath) as! MapCell
            mapCell.populateCell(passedData: tableData[indexPath.row] as! MapData)
            return mapCell
            
        case .App:
            let appCell = self.tableView.dequeueReusableCell(withIdentifier: "AppCell", for: indexPath) as! AppCell
            appCell.populateCell(passedData: tableData[indexPath.row] as! AppData)
            return appCell
            
        case .Menu:
            let menuCell = self.tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! AppCell
            menuCell.populateCell(passedData: tableData[indexPath.row] as! AppData)
            return menuCell
            
        case .Space:
            let spaceCell = self.tableView.dequeueReusableCell(withIdentifier: "SpaceCell", for: indexPath) as! SpaceCell
            return spaceCell
            
        }
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch tableData[indexPath.row].dataType {
            
        case .App:
            let appData = tableData[indexPath.row] as! AppData
            if UIApplication.shared.canOpenURL(appData.appURL) {
                UIApplication.shared.open(appData.appURL, options: [:], completionHandler: nil)
            }
            
        default:
            return
            
        }
        
    }
	
}

extension HomeController {

	func createGeofence(passedCode: AirportCode) {
	
		let airportObject = Airport(airportCode: passedCode)
	
		let notificationRegion = CLCircularRegion(center: airportObject.airportLocation, radius: airportObject.airpotRadius, identifier: airportObject.airportCode.rawValue)
		notificationRegion.notifyOnEntry = true
		
		locationManager.startMonitoring(for: notificationRegion)
	
	}

}

