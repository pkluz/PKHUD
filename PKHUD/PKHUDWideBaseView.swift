//
//  PKHUDWideBaseView.swift
//  PKHUD
//
//  Created by Philip Kluz on 6/12/15.
//  Copyright (c) 2016 NSExceptional. All rights reserved.
//  Licensed under the MIT license.
//

#if os(iOS) || os(watchOS)
    import UIKit
#elseif os(OSX)
    import Cocoa
#endif

/// PKHUDWideBaseView provides a wide base view, which you can subclass and add additional views to.
open class PKHUDWideBaseView: View {
    
    static let defaultWideBaseViewFrame = CGRect(origin: CGPoint.zero, size: CGSize(width: 265.0, height: 90.0))
    
    public init() {
        super.init(frame: PKHUDWideBaseView.defaultWideBaseViewFrame)
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    #if os(OSX)
    open override var allowsVibrancy: Bool {
        return true
    }
    #endif
}
