//
//  UIColor+.swift
//  PKHUD
//
//  Created by Mario Iannotta on 11/11/2020.
//  Copyright © 2020 NSExceptional. All rights reserved.
//

import Foundation

extension UIColor {

    static var textTintColor: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor.label.withAlphaComponent(0.85)
        } else {
            return UIColor.black.withAlphaComponent(0.85)
        }
    }

    static var imageTintColor: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor.secondaryLabel
        } else {
            return UIColor(red: 0.15, green: 0.15, blue: 0.15, alpha: 1.0)
        }
    }
}
