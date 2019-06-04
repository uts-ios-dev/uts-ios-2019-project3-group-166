//
//  MenuData.swift
//  Airport
//
//  Created by Yasmin Zaidi on 1/6/19.
//  Copyright © 2019 UTS. All rights reserved.
//

import Foundation
import UIKit

enum MenuType {
	case Transport, Restaurant, Shopping, Currency
}

class MenuData {
	
    var menuType: MenuType
    var menuTitle: String
    var menuEmoji: String
    var menuDescription: String
    var menuBackground: UIColor
	
    init(menuType: MenuType) {
		
		self.menuType = menuType
		
		switch menuType {
		
			case .Transport:
			self.menuTitle = "Transport"
			self.menuDescription = "Public Transportation, Local Ride Shares & More"
			self.menuEmoji = "🚎"
			self.menuBackground = UIColor(red: 0.84, green: 0.97, blue: 0.89, alpha: 1.00)
			
			case .Restaurant:
			self.menuTitle = "Food & Drink"
			self.menuDescription = "Great Restaurants & Quick Snacks"
			self.menuEmoji = "🛒"
			self.menuBackground = UIColor(red: 0.97, green: 0.92, blue: 0.84, alpha: 1.00)
			
			case .Shopping:
			self.menuTitle = "Shopping"
			self.menuDescription = "Exclusive Deals & Duty Free Savings"
			self.menuEmoji = "🍔"
			self.menuBackground = UIColor(red: 0.97, green: 0.86, blue: 0.86, alpha: 1.00)
			
			case .Currency:
			self.menuTitle = "Currency"
			self.menuDescription = "Best Exchange Rates & Sim Plans"
			self.menuEmoji = "💰"
			self.menuBackground = UIColor(red: 0.84, green: 0.93, blue: 0.97, alpha: 1.00)
		
		}
		
    }
    
}
 

