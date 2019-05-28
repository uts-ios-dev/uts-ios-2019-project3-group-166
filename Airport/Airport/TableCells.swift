//
//  HeaderCell.swift
//  Airport
//
//  Created by Charlie on 29/5/19.
//  Copyright © 2019 UTS. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class HeaderCell: UITableViewCell {

	@IBOutlet weak var headerText: UILabel!
	
}

class ContentCell: UITableViewCell {

	@IBOutlet weak var contentText: UILabel!
	
}

class MapCell: UITableViewCell {

	@IBOutlet weak var mapView: MKMapView!
	
}

class ImageCell: UITableViewCell {

	@IBOutlet weak var mapImage: UIImageView!
	

}
