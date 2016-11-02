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
        #if os(iOS) || os(watchOS)
            super.init(effect: UIBlurEffect(style: .light))
        #elseif os(OSX)
            super.init(frame: NSRect.zero)
            self.material = .light
            self.blendingMode = .withinWindow
            
            self.appearance = NSAppearance(named: NSAppearanceNameVibrantLight)
        #endif

        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    fileprivate func commonInit() {
        #if os(OSX)
            self.wantsLayer = true  // NSView will create a CALayer automatically
        #endif
        
        let layer: CALayer! = self.layer

        self.translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 9.0
        layer.masksToBounds = true
        
        #if os(iOS) || os(watchOS)
            contentView.addSubview(self.content)
        #elseif os(OSX)
            self.addSubview(self.content)
        #endif

        
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

            let superView: View
            
            #if os(iOS) || os(watchOS)
                _content.alpha = 0.85
                _content.contentMode = .center
                _content.clipsToBounds = true
                contentView.addSubview(_content)
                superView = contentView
            #elseif os(OSX)
                _content.alphaValue = 0.85
                addSubview(_content)
                superView = self
            #endif
            
            let centerX = NSLayoutConstraint(item: _content, attribute: .centerX, relatedBy: .equal, toItem: superView, attribute: .centerX, multiplier: 1, constant: 0)
            let centerY = NSLayoutConstraint(item: _content, attribute: .centerY, relatedBy: .equal, toItem: superView, attribute: .centerY, multiplier: 1, constant: 0)
            
            superView.addConstraints([centerX, centerY])
        }
    }
}
