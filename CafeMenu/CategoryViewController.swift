//
//  ViewController.swift
//  CafeMenu
//
//  Created by Vladimir on 14.10.16.
//  Copyright © 2016 Vladimir Ageev. All rights reserved.
//

import UIKit
import SwiftyJSON

class CategoryViewController: UIViewController {
    
    var typesOfFood:[CategoryItem]
    
    required init?(coder aDecoder: NSCoder) {
        typesOfFood = [CategoryItem]()
        super.init(coder: aDecoder)
        loadMenu()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func CategoryButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "ShowMenu", sender: sender.titleLabel?.text)
    }
    
    //TO-DO: rewrite this
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowMenu" {
            if let vc = segue.destination as? MenuViewController{
                if let newTitle = sender as? String{
                    vc.title = newTitle
                    if let elementIndex = typesOfFood.index(where: {$0.categoryName == newTitle}){
                        vc.menuForThisCategory = typesOfFood[elementIndex]
                    }
                }
            }
        }
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
                            typesOfFood.append(newCategory)
                    }
            }
    }
}



