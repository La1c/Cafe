//
//  DataModel.swift
//  CafeMenu
//
//  Created by Vladimir on 18.10.16.
//  Copyright © 2016 Vladimir Ageev. All rights reserved.
//

import Foundation
import SwiftyJSON

class DataModel {
    var cafeMenu = [CategoryItem]()
    
    init() {
        loadMenu()
    }
    
    
    func loadMenu() {
        if let path = Bundle.main.path(forResource: "data", ofType: "json"), let data = NSData(contentsOfFile: path) {
            let json = JSON(data: data as Data)
            let elements = json.arrayValue
            for element in elements{
                let categoryName = element["categoryItem"]["name"].stringValue
                let newCategory = CategoryItem(category: Categories(rawValue: categoryName)!)
                let menuItems = element["categoryItem"]["items"].arrayValue
                for menuItem in menuItems{
                    let newMenuItem = MenuItem()
                    newMenuItem.name = menuItem["menuItem"]["name"].stringValue
                    newMenuItem.descriptionText = menuItem["menuItem"]["description"].stringValue
                    if let imagePath = Bundle.main.path(forResource: menuItem["menuItem"]["picture"].stringValue, ofType: nil),
                        let img = NSData(contentsOfFile: imagePath){
                        newMenuItem.picture = UIImage(data: img as Data)
                    }
                    newCategory.items.append(newMenuItem)
                }
                cafeMenu.append(newCategory)
            }
        }
    }
}
