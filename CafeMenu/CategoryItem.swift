//
//  CategoryItem.swift
//  CafeMenu
//
//  Created by Vladimir on 14.10.16.
//  Copyright © 2016 Vladimir Ageev. All rights reserved.
//

import Foundation
import UIKit

class CategoryItem {
    fileprivate var name: String
    var items = [MenuItem]()
    
    var categoryName: String{
        get{
            return name
        }
    }
    
    init(category: Categories) {
        name = category.rawValue
    }
}
