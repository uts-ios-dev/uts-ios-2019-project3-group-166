//
//  MenuData.swift
//  Airport
//
//  Created by Yasmin Zaidi on 1/6/19.
//  Copyright © 2019 UTS. All rights reserved.
//

import Foundation

class MenuData: TableData {
    
    var dataType: TableDataType
    var menuTitle: String
    var menuDescription: String
    var menuIcon: String
    
    init(menuTitle: String, menuDescription: String, menuIcon: String) {
        
        self.dataType = .Menu
        self.menuTitle = menuTitle
        self.menuDescription = menuDescription
        self.menuIcon = menuIcon
        
    }
    
}
 

