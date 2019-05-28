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

class TableController: UITableViewController {

	let tableData: Array<TableData> = [
		HeaderData(dataType: .Header, headerString: "Header"),
		ContentData(dataType: .Content, contentString: "Contentkna sdk asdjhas djas djhas djhas djahs dajsh dajsh dajsh dajshd ajs djashd jahs djahs djahsd jahsd jashd jashd jahs djahs djahs djahs djhas djhas djahs djahs djhas djhas djhas djhas djhas djhas djhas d."),
		MapData(dataType: .Map, mapCenter: CLLocation(latitude: 0.0, longitude: 0.0), mapDots: [])
	]
	
	override func viewDidLoad() {
		super.viewDidLoad()
	
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return tableData.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		switch tableData[indexPath.row].dataType {
			
			case .Header:
			let cellData = tableData[indexPath.row] as! HeaderData
			let newCell = self.tableView.dequeueReusableCell(withIdentifier: "HeaderCell", for: indexPath) as! HeaderCell
			newCell.headerText?.text = cellData.headerString
			
			return newCell
		
			case .Content:
			let cellData = tableData[indexPath.row] as! ContentData
			let newCell = self.tableView.dequeueReusableCell(withIdentifier: "ContentCell", for: indexPath) as! ContentCell
			newCell.contentText?.text = cellData.contentString
			
			return newCell
			
			case .Map:
			let cellData = tableData[indexPath.row] as! MapData
			let newCell = self.tableView.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath) as! ImageCell
			newCell.mapImage.image = UIImage(named: "MAP")!
			
			return newCell
			
			default:
			return UITableViewCell()
		
		}
		
		
	}

}
