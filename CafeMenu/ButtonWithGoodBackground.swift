//
//  ButtonWithGoodBackground.swift
//  CafeMenu
//
//  Created by Vladimir on 18.10.16.
//  Copyright © 2016 Vladimir Ageev. All rights reserved.
//

import UIKit

class ButtonWithGoodBackground: UIButton {
    override func didAddSubview(_ subview: UIView) {
        if let view = subview as? UIImageView{
            view.contentMode = UIViewContentMode.scaleAspectFill
        }
    }
    

    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
