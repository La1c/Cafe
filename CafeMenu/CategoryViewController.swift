//
//  ViewController.swift
//  CafeMenu
//
//  Created by Vladimir on 14.10.16.
//  Copyright © 2016 Vladimir Ageev. All rights reserved.
//

import UIKit

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
        let category1 = CategoryItem(category: .bakery)
        let item1 = MenuItem()
        item1.name = "Muffin"
        item1.descriptionText = "I am a great muffin"
        item1.picture = #imageLiteral(resourceName: "muffin")
        category1.items.append(item1)
        typesOfFood.append(category1)

        
        let category2 = CategoryItem(category: .cakes)
        let item2 = MenuItem()
        item2.name = "Cake"
        item2.descriptionText = "I am a big cake"
        item2.picture = #imageLiteral(resourceName: "cake")
        category2.items.append(item2)
        typesOfFood.append(category2)
        
        let category3 = CategoryItem(category: .coffee)
        let item3 = MenuItem()
        item3.name = "Espresso"
        item3.descriptionText = "I am a strong coffee"
        item3.picture = #imageLiteral(resourceName: "coffee")
        category3.items.append(item3)
        typesOfFood.append(category3)
        
        let category4 = CategoryItem(category: .food)
        let item4 = MenuItem()
        item4.name = "Sandwich"
        item4.descriptionText = "I have a fish inside of me!"
        item4.picture = #imageLiteral(resourceName: "sandwich")
        category4.items.append(item4)
        typesOfFood.append(category4)
        
            }
}



