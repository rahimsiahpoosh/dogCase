//
//  TextField.swift
//  DogCase
//
//  Created by Rahim Siahpoosh on 2018-08-16.
//  Copyright © 2018 Rahim Siahpoosh. All rights reserved.
//

import UIKit

@IBDesignable
class TextField: UITextField {

    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }

    @IBInspectable var borderColor : UIColor = .black {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
}
