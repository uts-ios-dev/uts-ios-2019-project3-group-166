//
//  TableController.swift
//  Airport
//
//  Created by Charlie on 29/5/19.
//  Copyright © 2019 UTS. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

class TableController: UIViewController {

	let navView = NavView(navText: "Transport")
	let tableView = UITableView()

	let tableData: Array<TableData> = [
		HeaderData(dataType: .Header, headerString: "Header"),
		ContentData(dataType: .Content, contentString: "Contentkna sdk asdjhas djas djhas djhas djahs dajsh dajsh dajsh dajshd ajs djashd jahs djahs djahsd jahsd jashd jashd jahs djahs djahs djahs djhas djhas djahs djahs djhas djhas djhas djhas djhas djhas djhas d."),
		AppData(appTitle: "TripView", appDescription: "Real time public transport information for Sydney & Melbourne", appID: "id294730339", appIcon: "TripView"),
		AppData(appTitle: "TripView", appDescription: "Real time public transport information for Sydney & Melbourne", appID: "id294730339", appIcon: "TripView"),
		MapData(dataType: .Map, mapCenter: CLLocationCoordinate2D(latitude: -33.936847, longitude: 151.166352), mapPins: [
			MapPin(pinLocation: CLLocationCoordinate2D(latitude: -33.936416, longitude: 151.165605), pinTitle: "Bank"),
			MapPin(pinLocation: CLLocationCoordinate2D(latitude: -33.936876, longitude: 151.167154), pinTitle: "ATM")
		]),
		SpaceData(),
		HeaderData(dataType: .Header, headerString: "Header"),
		ContentData(dataType: .Content, contentString: "Contentkna sdk asdjhas djas djhas djhas djahs dajsh dajsh dajsh dajshd ajs djashd jahs djahs djahsd jahsd jashd jashd jahs djahs djahs djahs djhas djhas djahs djahs djhas djhas djhas djhas djhas djhas djhas d."),
		AppData(appTitle: "TripView", appDescription: "Real time public transport information for Sydney & Melbourne", appID: "id294730339", appIcon: "TripView"),
		AppData(appTitle: "TripView", appDescription: "Real time public transport information for Sydney & Melbourne", appID: "id294730339", appIcon: "TripView"),
		MapData(dataType: .Map, mapCenter: CLLocationCoordinate2D(latitude: -33.936847, longitude: 151.166352), mapPins: [
			MapPin(pinLocation: CLLocationCoordinate2D(latitude: -33.936416, longitude: 151.165605), pinTitle: "Bank"),
			MapPin(pinLocation: CLLocationCoordinate2D(latitude: -33.936876, longitude: 151.167154), pinTitle: "ATM")
		])
	]
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		tableView.delegate = self
		tableView.dataSource = self
		
		tableView.register(HeaderCell.self, forCellReuseIdentifier: "HeaderCell")
		tableView.register(ContentCell.self, forCellReuseIdentifier: "ContentCell")
		tableView.register(MapCell.self, forCellReuseIdentifier: "MapCell")
		tableView.register(AppCell.self, forCellReuseIdentifier: "AppCell")
		tableView.register(SpaceCell.self, forCellReuseIdentifier: "SpaceCell")
		
		tableView.estimatedRowHeight = 88.0
		tableView.rowHeight = UITableView.automaticDimension
		
		navView.translatesAutoresizingMaskIntoConstraints = false
		
		self.view.addSubview(navView)
		
		self.view.addConstraints([
		
			// Nav View
			NSLayoutConstraint(item: navView, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: navView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: self.view!, attribute: .trailing, relatedBy: .equal, toItem: navView, attribute: .trailing, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: navView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 100)
		
		])
	
	}
	
}

extension TableController: UITableViewDelegate, UITableViewDataSource {

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return tableData.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
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
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

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
