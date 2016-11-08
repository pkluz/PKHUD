//
//  Extensions-macOS.swift
//  PKHUD
//
//  Created by Fabian Renner on 08.11.16.
//  Copyright © 2016 NSExceptional. All rights reserved.
//

import Cocoa

public typealias View = NSView
public typealias Img = NSImage
typealias Color = NSColor
typealias VisualEffectView = NSInternalVisualEffectView
public typealias ImageView = NSImageView
typealias BezierPath = NSBezierPath
typealias BlurEffect = NSBlurEffect
typealias Font = NSFont
typealias ActivityIndicatorView = NSActivityIndicatorView

extension CGColor {
    var color: NSColor? {
        get {
            return NSColor(cgColor: self)
        }
    }
}
extension NSView {
    var backgroundColor: Color {
        get {
            self.wantsLayer = true
            return self.layer!.backgroundColor!.color!
        }
        set (color) {
            self.wantsLayer = true
            self.layer?.backgroundColor = color.cgColor
        }
    }
    var alpha: CGFloat {
        get {
            return self.alphaValue
        }
        set (alpha) {
            self.alphaValue = alpha
        }
    }
    var center: CGPoint {
        get {
            return CGPoint(x: NSMidX(self.frame), y: NSMidY(self.frame))
        }
        set (center) {
            self.frame.origin = CGPoint(x: center.x - frame.size.width / 2,
                                        y: center.y - frame.size.height / 2)
        }
    }
    func removeAllAnimations() {
        self.wantsLayer = true
        self.layer?.removeAllAnimations()
    }
    
    func add(_ anim: CAAnimation, forKey: String?) {
        self.wantsLayer = true
        self.layer?.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.layer?.position = CGPoint(x: (self.superview?.frame.width ?? 0)/2, y: (self.superview?.frame.height ?? 0)/2)
        self.layer?.add(anim, forKey: forKey)
    }
    
    var clipsToBounds: Bool {
        get {
            return true
        }
        set {}
    }
    
    var cornerRadius: CGFloat {
        get {
            self.wantsLayer = true
            return self.layer!.cornerRadius
        }
        set (radius) {
            self.wantsLayer = true
            self.layer?.cornerRadius = radius
        }
    }
    
    var masksToBounds: Bool {
        get {
            self.wantsLayer = true
            return self.layer!.masksToBounds
        }
        set (masks) {
            self.wantsLayer = true
            self.layer?.masksToBounds = masks
        }
    }
    
    func addSublayer(_ layer: CALayer) {
        self.wantsLayer = true
        
        layer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.layer?.addSublayer(layer)
    }
    
    var position: CGPoint {
        get {
            self.wantsLayer = true
            self.layer?.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            return self.layer!.position
        }
        set {
            self.wantsLayer = true
            self.layer?.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            self.layer?.position = newValue
            self.layout()
        }
    }
    
    func layoutIfNeeded() {
        self.layoutSubviews()
    }
    
    func layoutSubviews() {}
}

enum NSBlurEffectStyle : Int {
    case extraLight
    case light
    case dark
    case regular
    case prominent
}
class NSBlurEffect {
    let style: NSBlurEffectStyle
    init(style: NSBlurEffectStyle) {
        self.style = style
    }
}
extension NSAutoresizingMaskOptions {
    static var flexibleLeftMargin: NSAutoresizingMaskOptions {
        get {
            return .viewMinXMargin
        }
    }
    static var flexibleRightMargin: NSAutoresizingMaskOptions {
        get {
            return .viewMaxXMargin
        }
    }
    static var flexibleTopMargin: NSAutoresizingMaskOptions {
        get {
            return .viewMinYMargin
        }
    }
    static var flexibleBottomMargin: NSAutoresizingMaskOptions {
        get {
            return .viewMaxYMargin
        }
    }
    static var flexibleHeight: NSAutoresizingMaskOptions {
        get {
            return .viewHeightSizable
        }
    }
    static var flexibleWidth: NSAutoresizingMaskOptions {
        get {
            return .viewWidthSizable
        }
    }
}
extension ContainerView {
    var isUserInteractionEnabled: Bool {
        get { return self.userInteractionEnabled }
        set (userInteraction) { self.userInteractionEnabled = userInteraction }
    }
}

open class Label: NSTextField {
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        
        self.isEditable = false
        self.isBezeled = false
        self.drawsBackground = false
        self.isSelectable = false
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var text: String? {
        get {
            return self.stringValue
        }
        set {
            self.stringValue = newValue ?? ""
        }
    }
    
    var textAlignment: NSTextAlignment {
        get {
            return self.alignment
        }
        set {
            self.alignment = newValue
        }
    }
    
    var adjustsFontSizeToFitWidth: Bool {
        get {
            return false
        }
        set {}
    }
    
    var minimumScaleFactor: CGFloat {
        get {
            return 1
        }
        set {}
    }
    
    var numberOfLines: Int {
        get {
            return self.maximumNumberOfLines
        }
        set {
            self.maximumNumberOfLines = newValue
        }
    }
    
    func size() -> CGSize {
        return self.sizeThatFits(CGSize(width: self.frame.width, height: CGFloat(Int.max)))
    }
}

enum NSViewContentMode : Int {
    case scaleToFill
    case scaleAspectFit // contents scaled to fit with fixed aspect. remainder is transparent
    case scaleAspectFill // contents scaled to fill with fixed aspect. some portion of content may be clipped.
    case redraw // redraw on bounds change (calls -setNeedsDisplay)
    case center // contents remain same size. positioned adjusted.
    case top
    case bottom
    case left
    case right
    case topLeft
    case topRight
    case bottomLeft
    case bottomRight
}

extension NSImageView {
    var contentMode: NSViewContentMode {
        get {
            switch (self.layer ?? CALayer()).contentsGravity {
            default:
                return .center
            }
        }
        set {
            switch newValue {
            case .center:
                self.layer?.contentsGravity = kCAGravityCenter
            default:
                break
            }
        }
    }
}

extension NSFont {
    static var labelViewFont: NSFont {
        return NSFont.systemFont(ofSize: 17.0)
    }
}

internal enum NSActivityIndicatorViewStyle : Int {
    case whiteLarge
    case white
    case gray
}

class NSActivityIndicatorView: NSProgressIndicator {
    init(activityIndicatorStyle style: NSActivityIndicatorViewStyle) {
        super.init(frame: CGRect.zero)
        
        self.wantsLayer = true
        self.style = .spinningStyle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func startAnimating() {
        self.startAnimation(nil)
    }
    
    var color: Color {
        get {
            return Color.black
        }
        set {}
    }
}

class NSInternalVisualEffectView: NSVisualEffectView {
    init(effect: BlurEffect) {
        super.init(frame: NSRect.zero)
        
        let material: NSVisualEffectMaterial
        if case .dark = effect.style {
            material = .dark
        } else {
            material = .light
        }
        
        self.material = material
        self.blendingMode = .withinWindow
        self.appearance = NSAppearance(named: NSAppearanceNameVibrantLight)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    var contentView: NSView {
        return self
    }
}
