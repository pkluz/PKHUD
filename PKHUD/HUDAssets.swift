//
//  PKHUD.Assets.swift
//  PKHUD
//
//  Created by Philip Kluz on 6/18/14.
//  Copyright (c) 2014 NSExceptional. All rights reserved.
//

import UIKit

/// Provides a set of default assets, like images, that can be supplied to the PKHUD's contentViews.
public struct HUDAssets {
    public static let rotationLockImage = HUDAssets.bundledImage(named: "rotation_lock")
    public static let rotationUnlockedImage = HUDAssets.bundledImage(named: "rotation_unlocked")
    public static let volumeImage = HUDAssets.bundledImage(named: "volume")
    public static let volumeMutedImage = HUDAssets.bundledImage(named: "volume_muted")
    public static let ringerImage = HUDAssets.bundledImage(named: "ringer")
    public static let ringerMutedImage = HUDAssets.bundledImage(named: "ringer_muted")
    public static let crossImage = HUDAssets.bundledImage(named: "cross")
    public static let checkmarkImage = HUDAssets.bundledImage(named: "checkmark")
    public static let progressImage = HUDAssets.bundledImage(named: "progress")
    
    internal static func bundledImage(named name: String) -> UIImage {
        let bundleIdentifier = "com.NSExceptional.PKHUD"
        return UIImage(named: name, inBundle: NSBundle(identifier: bundleIdentifier), compatibleWithTraitCollection: nil)!
    }
}