//
//  PKHUDSquareBaseView.swift
//  PKHUD
//
//  Created by Philip Kluz on 6/12/15.
//  Copyright (c) 2015 NSExceptional. All rights reserved.
//

import UIKit

/// PKHUDSquareBaseView provides a square view, which you can subclass and add additional views to.
public class PKHUDSquareBaseView: UIView {
    
    static let defaultSquareBaseViewFrame = CGRect(origin: CGPointZero, size: CGSize(width: 156.0, height: 156.0))

    public init() {
        super.init(frame: PKHUDSquareBaseView.defaultSquareBaseViewFrame)
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
