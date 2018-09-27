//
//  PKHUD.Assets.swift
//  PKHUD
//
//  Created by Philip Kluz on 6/18/14.
//  Copyright (c) 2016 NSExceptional. All rights reserved.
//  Licensed under the MIT license.
//

import UIKit

/// PKHUDAssets provides a set of default images, that can be supplied to the PKHUD's content views.
open class PKHUDAssets: NSObject {

    open class var crossImage: UIImage { return PKHUDAssets.bundledImage(named: "cross") }
    open class var checkmarkImage: UIImage { return PKHUDAssets.bundledImage(named: "checkmark") }
    open class var progressActivityImage: UIImage { return PKHUDAssets.bundledImage(named: "progress_activity") }
    open class var progressCircularImage: UIImage { return PKHUDAssets.bundledImage(named: "progress_circular") }

    internal class func bundledImage(named name: String) -> UIImage {
        let primaryBundle = Bundle(for: PKHUDAssets.self)
        if let image = UIImage(named: name, in: primaryBundle, compatibleWith: nil) {
            // Load image in cases where PKHUD is directly integrated
            return image
        } else if
            let subBundleUrl = primaryBundle.url(forResource: "PKHUDResources", withExtension: "bundle"),
            let subBundle = Bundle(url: subBundleUrl),
            let image = UIImage(named: name, in: subBundle, compatibleWith: nil)
        {
            // Load image in cases where PKHUD is integrated via cocoapods as a dynamic or static framework with a separate resource bundle
            return image
        }

        return UIImage()
    }
}
