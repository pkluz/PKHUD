//
//  PKHUD.Assets.swift
//  PKHUD
//
//  Created by Philip Kluz on 6/18/14.
//  Copyright (c) 2014 NSExceptional. All rights reserved.
//

import UIKit

/// PKHUDAssets provides a set of default images, that can be supplied to the PKHUD's content views.
public class PKHUDAssets: NSObject {
    
    public class var crossImage: UIImage { return PKHUDAssets.bundledImage(named: "cross") }
    public class var checkmarkImage: UIImage { return PKHUDAssets.bundledImage(named: "checkmark") }
    public class var progressImage: UIImage { return PKHUDAssets.bundledImage(named: "progress") }
    
    internal class func bundledImage(named name: String) -> UIImage {
        let bundle = NSBundle(forClass: PKHUDAssets.self)
        let image = UIImage(named: name, inBundle:bundle, compatibleWithTraitCollection:nil)
        if let image = image {
            return image
        }
        
        return UIImage()
    }
}
