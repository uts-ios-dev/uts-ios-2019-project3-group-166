//
//  DetailController.swift
//  Airport
//
//  Created by Charlie on 29/5/19.
//  Copyright © 2019 UTS. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

class DetailController: UIViewController {

	let tableView = UITableView()

	let navView: NavView
	let tableData: Array<TableData>
	
	init(tableData: Array<TableData>, navHeader: String) {
		self.tableData = tableData
		self.navView = NavView(navText: navHeader)
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		tableView.delegate = self
		tableView.dataSource = self
		
		tableView.register(HeaderCell.self, forCellReuseIdentifier: "HeaderCell")
		tableView.register(ContentCell.self, forCellReuseIdentifier: "ContentCell")
		tableView.register(MapCell.self, forCellReuseIdentifier: "MapCell")
		tableView.register(AppCell.self, forCellReuseIdentifier: "AppCell")
		tableView.register(SpaceCell.self, forCellReuseIdentifier: "SpaceCell")
		tableView.register(VendorCell.self, forCellReuseIdentifier: "VendorCell")
		tableView.register(ExchangeCell.self, forCellReuseIdentifier: "ExchangeCell")
		
		tableView.estimatedRowHeight = 88.0
		tableView.rowHeight = UITableView.automaticDimension
		tableView.separatorStyle = .none
		tableView.showsVerticalScrollIndicator = false
		
		navView.translatesAutoresizingMaskIntoConstraints = false
		tableView.translatesAutoresizingMaskIntoConstraints = false
		
		self.view.addSubview(tableView)
		self.view.addSubview(navView)
		
		self.view.addConstraints([
		
			// Table View
			NSLayoutConstraint(item: tableView, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: tableView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: self.view!, attribute: .trailing, relatedBy: .equal, toItem: tableView, attribute: .trailing, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: self.view!, attribute: .bottom, relatedBy: .equal, toItem: tableView, attribute: .bottom, multiplier: 1.0, constant: 0),
		
			// Nav View
			NSLayoutConstraint(item: navView, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: navView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: self.view!, attribute: .trailing, relatedBy: .equal, toItem: navView, attribute: .trailing, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: navView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 100)
		
		])
		
		navView.closeButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissDetail)))
	
	}
	
}

extension DetailController: UITableViewDelegate, UITableViewDataSource {

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
            
			case .Space:
			let spaceCell = self.tableView.dequeueReusableCell(withIdentifier: "SpaceCell", for: indexPath) as! SpaceCell
			return spaceCell
			
			case .Vendor:
			let vendorCell = self.tableView.dequeueReusableCell(withIdentifier: "VendorCell", for: indexPath) as! VendorCell
			vendorCell.populateCell(passedData: tableData[indexPath.row] as! VendorData)
			return vendorCell
			
			case .Exchange:
			let exchangeCell = self.tableView.dequeueReusableCell(withIdentifier: "ExchangeCell", for: indexPath) as! ExchangeCell
			exchangeCell.populateCell(passedData: tableData[indexPath.row] as! ExchangeData)
			return exchangeCell
			
		}
		
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		switch tableData[indexPath.row].dataType {
		
			case .App:
			let appData = tableData[indexPath.row] as! AppData
			if UIApplication.shared.canOpenURL(appData.appURL) {
				UIApplication.shared.open(appData.appURL, options: [:], completionHandler: nil)
			} else {
				print(appData.storeURL)
				UIApplication.shared.open(appData.storeURL, options: [:], completionHandler: nil)
			}
	
			default:
			return
		
		}
	
	}

}

extension DetailController {

	@objc func dismissDetail() {
		self.dismiss(animated: true, completion: nil)
	}

}
