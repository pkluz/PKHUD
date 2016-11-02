//
//  HUDWindow.swift
//  PKHUD
//
//  Created by Philip Kluz on 6/16/14.
//  Copyright (c) 2016 NSExceptional. All rights reserved.
//  Licensed under the MIT license.
//

#if os(iOS) || os(watchOS)
    import UIKit
    extension UIView {
        func removeAllAnimations() {
            layer.removeAllAnimations()
        }
    }
#elseif os(OSX)
    import Cocoa
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
    }
#endif

/// The window used to display the PKHUD within. Placed atop the applications main window.
internal class ContainerView: View {
    
    #if os(OSX)
    override internal var isFlipped:Bool {
        get {
            return true
        }
    }
    var userInteractionEnabled = false
    override func hitTest(_ aPoint: NSPoint) -> NSView? {
        if userInteractionEnabled {
            return super.hitTest(aPoint)
        }
        return nil
    }
    #endif
    internal let frameView: FrameView
    internal init(frameView: FrameView = FrameView()) {
        self.frameView = frameView
        super.init(frame: CGRect.zero)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        frameView = FrameView()
        super.init(coder: aDecoder)
        commonInit()
    }
    
    fileprivate func commonInit() {
        backgroundColor = Color.clear

        addSubview(backgroundView)
        addSubview(frameView)
    }
    
    #if os(iOS) || os(watchOS)
    internal override func layoutSubviews() {
        super.layoutSubviews()
    
        frameView.center = center
        backgroundView.frame = bounds
    }
    #elseif os(OSX)
    override func resizeSubviews(withOldSize oldSize: NSSize) {
        super.resizeSubviews(withOldSize: oldSize)
        
        frameView.center = center
        backgroundView.frame = bounds
    }
    #endif
    
    internal func showFrameView() {
        removeAllAnimations()
        frameView.center = center
        frameView.alpha = 1.0
        isHidden = false
    }
    
    fileprivate var willHide = false
    
    internal func hideFrameView(animated anim: Bool, completion: ((Bool) -> Void)? = nil) {
        let finalize: (_ finished: Bool) -> (Void) = { finished in
            self.isHidden = true
            self.removeFromSuperview()
            self.willHide = false
            
            completion?(finished)
        }
        
        if isHidden {
            return
        }
        
        willHide = true
        
        if anim {
            #if os(iOS) || os(watchOS)
            UIView.animate(withDuration: 0.8, animations: {
                self.frameView.alpha = 0.0
                self.hideBackground(animated: false)
            }, completion: { bool in finalize(true) } )
            #elseif os(OSX)
            NSAnimationContext.runAnimationGroup({ context in
                context.duration = 0.8
                self.frameView.animator().alphaValue = 0.0
                self.hideBackground(animated: false)
            }, completionHandler: { finalize(true) } )
            #endif
        } else {
            self.frameView.alpha = 0.0
            finalize(true)
        }
    }
    
    fileprivate let backgroundView: View = {
        let view = View()
        view.backgroundColor = Color(white:0.0, alpha:0.25)
        view.alpha = 0.0
        return view
    }()
    
    internal func showBackground(animated anim: Bool) {
        if anim {
            #if os(iOS) || os(watchOS)
            UIView.animate(withDuration: 0.175, animations: {
                self.backgroundView.alpha = 1.0
            })
            #elseif os(OSX)
            NSAnimationContext.runAnimationGroup({ context in
                context.duration = 0.175
                self.backgroundView.animator().alphaValue = 1.0
            })
            #endif
        } else {
            backgroundView.alpha = 1.0
        }
    }
    
    internal func hideBackground(animated anim: Bool) {
        if anim {
            #if os(iOS) || os(watchOS)
            UIView.animate(withDuration: 0.65, animations: {
                self.backgroundView.alpha = 0.0
            }) 
            #elseif os(OSX)
            NSAnimationContext.runAnimationGroup({ context in
                context.duration = 0.65
                self.backgroundView.animator().alphaValue = 0.0
            })
            #endif
        } else {
            backgroundView.alpha = 0.0
        }
    }
}
