//
//  MenuViewController.swift
//  CafeMenu
//
//  Created by Vladimir on 14.10.16.
//  Copyright © 2016 Vladimir Ageev. All rights reserved.
//

import UIKit

class MenuViewController: UITableViewController {

    var menuForThisCategory:CategoryItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuForThisCategory.items.count
    }
    
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuItem", for: indexPath)
        configure(cell, withItem: menuForThisCategory.items[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = menuForThisCategory.items[indexPath.row]
        performSegue(withIdentifier: "ShowDetails", sender: item)
    }
    
    func configure(_ cell: UITableViewCell, withItem: MenuItem){
        let imageView = cell.viewWithTag(101) as! UIImageView
        let label = cell.viewWithTag(102) as! UILabel
        
        label.text = withItem.name
        if let image = withItem.picture{
            imageView.image = image
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetails" {
            let passedItem = sender as! MenuItem
            if let vc = segue.destination as? DetailsViewController{
                    vc.itemToShow = passedItem
            }
        }
    }
}
