//
//  DetailsViewController.swift
//  CafeMenu
//
//  Created by Vladimir on 14.10.16.
//  Copyright © 2016 Vladimir Ageev. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    var itemToShow: MenuItem!
    
    @IBOutlet weak var itemUIImageView: UIImageView!
    @IBOutlet weak var textField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let pic = itemToShow.picture{
            itemUIImageView.image = pic
        }
        
        if let description = itemToShow.descriptionText{
            textField.text = description
        }
        title = itemToShow.name
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
