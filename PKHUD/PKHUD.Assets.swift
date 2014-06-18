//
//  PKHUD.Assets.swift
//  PKHUD
//
//  Created by Philip Kluz on 6/18/14.
//  Copyright (c) 2014 NSExceptional. All rights reserved.
//

import UIKit

extension PKHUD {
    
    /**
        Provides a set of default assets, like images, that can be supplied to the PKHUD's contentViews.
        
        @example
            var rotationLockImage = PKHUD.Assets.rotationLockImage
    */
    struct Assets {
        static let rotationLockImage = Assets.bundledImage(named: "rotation_lock")
        static let rotationUnlockedImage = Assets.bundledImage(named: "rotation_unlocked")
        static let volumeImage = Assets.bundledImage(named: "volume")
        static let volumeMutedImage = Assets.bundledImage(named: "volume_muted")
        static let ringerImage = Assets.bundledImage(named: "ringer")
        static let ringerMutedImage = Assets.bundledImage(named: "ringer_muted")
        static let crossImage = Assets.bundledImage(named: "cross")
        static let checkmarkImage = Assets.bundledImage(named: "checkmark")
        static let progressImage = Assets.bundledImage(named: "progress")
        
        static func bundledImage(named name: String) -> UIImage? {
            let bundleIdentifier = "com.NSExceptional.PKHUD"
            return UIImage(named: name, inBundle: NSBundle(identifier: bundleIdentifier), compatibleWithTraitCollection: nil)
        }
    }
}
