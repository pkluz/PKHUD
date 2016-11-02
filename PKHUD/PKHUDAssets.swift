//
//  PKHUD.Assets.swift
//  PKHUD
//
//  Created by Philip Kluz on 6/18/14.
//  Copyright (c) 2016 NSExceptional. All rights reserved.
//  Licensed under the MIT license.
//

#if os(iOS) || os(watchOS)
    import UIKit
#elseif os(OSX)
    import Cocoa
#endif

/// PKHUDAssets provides a set of default images, that can be supplied to the PKHUD's content views.
open class PKHUDAssets: NSObject {
    
    open class var crossImage: Img { return PKHUDAssets.bundledImage(named: "cross") }
    open class var checkmarkImage: Img { return PKHUDAssets.bundledImage(named: "checkmark") }
    open class var progressActivityImage: Img { return PKHUDAssets.bundledImage(named: "progress_activity") }
    open class var progressCircularImage: Img { return PKHUDAssets.bundledImage(named: "progress_circular") }
    
    internal class func bundledImage(named name: String) -> Img {
        let bundle = Bundle(for: PKHUDAssets.self)
        #if os(iOS) || os(watchOS)
            let image = Img(named: name, in: bundle, compatibleWith: nil)
        #elseif os(OSX)
            let image = bundle.image(forResource: name)
        #endif
        if let image = image {
            return image
        }
        
        return Img()
    }
}
