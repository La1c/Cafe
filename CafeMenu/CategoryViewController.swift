//
//  ViewController.swift
//  CafeMenu
//
//  Created by Vladimir on 14.10.16.
//  Copyright © 2016 Vladimir Ageev. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {
    
    var menu:DataModel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func CategoryButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "ShowMenu", sender: sender.titleLabel?.text)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowMenu" {
            if let vc = segue.destination as? MenuViewController{
                if let newTitle = sender as? String{
                    vc.title = newTitle
                    if let elementIndex = menu.cafeMenu.index(where: {$0.categoryName == newTitle}){
                        vc.menuForThisCategory = menu.cafeMenu[elementIndex]
                    }
                }
            }
        }
    }
}



