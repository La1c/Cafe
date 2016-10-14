//
//  MenuViewController.swift
//  CafeMenu
//
//  Created by Vladimir on 14.10.16.
//  Copyright © 2016 Vladimir Ageev. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func productButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "ShowDetails", sender: sender.titleLabel)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetails" {
            if let vc = segue.destination as? DetailsViewController{
                if let newTitle = sender as? String{
                    vc.title = newTitle
                }
            }
        }
    }
}
