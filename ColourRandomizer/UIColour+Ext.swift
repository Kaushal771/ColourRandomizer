//
//  UIColour+Ext.swift
//  ColourRandomizer
//
//  Created by Kaushal Desai on 2022-03-18.
//

import UIKit

extension UIColor {
    
    static func random() -> UIColor {
        let randomColour = UIColor(red: CGFloat.random(in: 0...1.0),
                                   green: CGFloat.random(in: 0...1.0),
                                   blue: CGFloat.random(in: 0...1.0),
                                   alpha: 1)
        return randomColour
    }
}
