//
//  HUDLabelConfig.swift
//  PKHUD
//
//  Created by Piergiuseppe Longo on 24/04/2017.
//  Copyright © 2017 NSExceptional. All rights reserved.
//

import Foundation

public struct HUDLabelConfig {
    public var font: UIFont = UIFont.boldSystemFont(ofSize: 17.0)
    public var color: UIColor = UIColor.black.withAlphaComponent(0.85)
    public var textAlignment: NSTextAlignment = .center
    public var minimumScaleFactor: CGFloat = 0.25
    public var numberOfLines: Int = 1

    init(font: UIFont, numberOfLines: Int ) {
        self.font = font
        self.numberOfLines = numberOfLines
    }

    func label() -> UILabel {
        let label = UILabel()
        label.textAlignment = self.textAlignment
        label.font = self.font
        label.textColor = self.color
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = self.minimumScaleFactor
        return label
    }
}
