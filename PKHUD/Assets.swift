//
//  PKHUD.Assets.swift
//  PKHUD
//
//  Created by Philip Kluz on 6/18/14.
//  Copyright (c) 2014 NSExceptional. All rights reserved.
//

import UIKit

/// Provides a set of default assets, like images, that can be supplied to the PKHUD's contentViews.
public struct Assets {
    public static let rotationLockImage = Assets.bundledImage(named: "rotation_lock")
    public static let rotationUnlockedImage = Assets.bundledImage(named: "rotation_unlocked")
    public static let volumeImage = Assets.bundledImage(named: "volume")
    public static let volumeMutedImage = Assets.bundledImage(named: "volume_muted")
    public static let ringerImage = Assets.bundledImage(named: "ringer")
    public static let ringerMutedImage = Assets.bundledImage(named: "ringer_muted")
    public static let crossImage = Assets.bundledImage(named: "cross")
    public static let checkmarkImage = Assets.bundledImage(named: "checkmark")
    public static let progressImage = Assets.bundledImage(named: "progress")
    
    internal static func bundledImage(named name: String) -> UIImage? {
        let bundleIdentifier = "com.NSExceptional.PKHUD"
        return UIImage(named: name, inBundle: NSBundle(identifier: bundleIdentifier), compatibleWithTraitCollection: nil)
    }
}