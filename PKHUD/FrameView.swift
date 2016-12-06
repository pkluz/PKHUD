//
//  HUDView.swift
//  PKHUD
//
//  Created by Philip Kluz on 6/16/14.
//  Copyright (c) 2016 NSExceptional. All rights reserved.
//  Licensed under the MIT license.
//

#if os(iOS) || os(watchOS)
    import UIKit
#elseif os(OSX)
    import Cocoa
#endif

/// Provides the general look and feel of the PKHUD, into which the eventual content is inserted.
internal class FrameView: VisualEffectView {
    
    #if os(OSX)
    override internal var isFlipped:Bool {
        get {
            return true
        }
    }
    #endif
    
    internal init() {
        super.init(effect: BlurEffect(style: .light))
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    fileprivate func commonInit() {
        backgroundColor = Color(white: 0.8, alpha: 0.36)
        self.cornerRadius = 9.0
        self.masksToBounds = true
        
        contentView.addSubview(self.content)
        
        #if os(iOS) || os(watchOS)
        let offset = 20.0
        
        let motionEffectsX = UIInterpolatingMotionEffect(keyPath: "center.x", type: .tiltAlongHorizontalAxis)
        motionEffectsX.maximumRelativeValue = offset
        motionEffectsX.minimumRelativeValue = -offset
        
        let motionEffectsY = UIInterpolatingMotionEffect(keyPath: "center.y", type: .tiltAlongVerticalAxis)
        motionEffectsY.maximumRelativeValue = offset
        motionEffectsY.minimumRelativeValue = -offset
        
        let group = UIMotionEffectGroup()
        group.motionEffects = [motionEffectsX, motionEffectsY]
        
        addMotionEffect(group)
        #endif
    }
    
    fileprivate var _content = View()
    internal var content: View {
        get {
            return _content
        }
        set {
            _content.removeFromSuperview()
            _content = newValue
            _content.alpha = 0.85
            _content.clipsToBounds = true
            frame.size = _content.bounds.size
            addSubview(_content)
        }
    }
}
