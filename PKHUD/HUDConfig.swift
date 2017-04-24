//
//  HudConfig.swift
//  PKHUD
//
//  Created by Piergiuseppe Longo on 24/04/2017.
//  Copyright © 2017 NSExceptional. All rights reserved.
//

import Foundation

public struct HUDConfig {
    public static var squareBaseViewFrame = CGRect(origin: CGPoint.zero, size: CGSize(width: 156.0, height: 156.0))
    public static var wideBaseViewFrame = CGRect(origin: CGPoint.zero, size: CGSize(width: 265.0, height: 90.0))
    public static var titleLabelFrame = CGRect(x: 0, y: 0, width: 156.0, height: 39)
    public static var imageViewFrame = CGRect(x: 0, y: 50, width: 156.0, height: 78)
    public static var subtitleLabelFrame = CGRect(x: 0, y: 117, width: 156.0, height: 39)

    public static var titleLabel = HUDLabelConfig(font:UIFont.boldSystemFont(ofSize: 17.0), numberOfLines: 2)
    public static var subtitleLabel = HUDLabelConfig(font:UIFont.boldSystemFont(ofSize: 14.0), numberOfLines: 2)
    public static var textViewTitleLabel = HUDLabelConfig(font:UIFont.boldSystemFont(ofSize: 17.0), numberOfLines: 3)
}
