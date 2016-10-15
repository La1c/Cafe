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
                if let elements = json.array{
                    for element in elements{
                        if let categoryName = element["categoryItem"]["name"].string{
                            let newCategory = CategoryItem(category: Categories(rawValue: categoryName)!)
                            
                            if let menuItems = element["categoryItem"]["items"].array{
                                for menuItem in menuItems{
                                    let newMenuItem = MenuItem()
                                    newMenuItem.name = menuItem["menuItem"]["name"].string!
                                    newMenuItem.descriptionText = menuItem["menuItem"]["description"].string
                                    if let imagePath = Bundle.main.path(forResource: menuItem["menuItem"]["picture"].string, ofType: nil),
                                        let img = NSData(contentsOfFile: imagePath){
                                        newMenuItem.picture = UIImage(data: img as Data)
                                    }
                                    newCategory.items.append(newMenuItem)
                                }
                            }
                            
                            typesOfFood.append(newCategory)
                        }
                    }
                    }
            }
        
    }
}



