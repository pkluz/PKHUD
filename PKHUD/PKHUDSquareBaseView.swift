//
//  PKHUDSquareBaseView.swift
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

/// PKHUDSquareBaseView provides a square view, which you can subclass and add additional views to.
open class PKHUDSquareBaseView: View {
    
    static let defaultSquareBaseViewFrame = CGRect(origin: CGPoint.zero, size: CGSize(width: 156.0, height: 156.0))

    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    #if os(OSX)
    override open var isFlipped:Bool {
        get {
            return true
        }
    }
    #endif
    
    open func commonInit() {
        self.setCorrectFrames()
        
        #if os(OSX)
            self.wantsLayer = true  // NSView will create a CALayer automatically
        #endif
    }

    public init(image: Img? = nil, title: String? = nil, subtitle: String? = nil) {
        super.init(frame: PKHUDSquareBaseView.defaultSquareBaseViewFrame)
        
        commonInit()
        
        self.imageView.image = image
        #if os(iOS) || os(watchOS)
            titleLabel.text = title
            subtitleLabel.text = subtitle
        #elseif os(OSX)
            titleLabel.stringValue = title ?? ""
            subtitleLabel.stringValue = subtitle ?? ""
        #endif
        
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
    }

    open let imageView: ImageView = {
        let imageView = ImageView()

        #if os(iOS) || os(watchOS)
            imageView.alpha = 0.85
        #elseif os(OSX)
            imageView.alphaValue = 0.85
            imageView.wantsLayer = true
        #endif

        let layer: CALayer! = imageView.layer

        layer.contentsGravity = kCAGravityCenter
        return imageView
    }()
    
    #if os(iOS) || os(watchOS)
    public let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 17.0)
        label.textColor = UIColor.black.withAlphaComponent(0.85)
        return label
    }()
    #elseif os(OSX)
    open let titleLabel: NSTextField = {
        let textField = NSTextField()
        textField.alignment = .center
        textField.font = NSFont.systemFont(ofSize: 17.0)
        textField.textColor = Color.black.withAlphaComponent(0.85)
        textField.isBezeled = false
        textField.drawsBackground = false
        textField.isEditable = false
        textField.isSelectable = false
        return textField
    }()
    #endif
    
    #if os(iOS) || os(watchOS)
    public let subtitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 14.0)
        label.textColor = UIColor.black.withAlphaComponent(0.7)
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 2
        return label
    }()
    #elseif os(OSX)
    open let subtitleLabel: NSTextField = {
        let textField = NSTextField()
        textField.alignment = .center
        textField.font = NSFont.systemFont(ofSize: 14.0)
        textField.textColor = Color.black.withAlphaComponent(0.7)
        textField.maximumNumberOfLines = 2
        textField.isBezeled = false
        textField.drawsBackground = false
        textField.isEditable = false
        textField.isSelectable = false
        return textField
    }()
    #endif
    
    #if os(OSX)
    open override var allowsVibrancy: Bool {
        return true
    }
    #endif
    
    func setCorrectFrames() {
        self.translatesAutoresizingMaskIntoConstraints = true
        
        let viewWidth = bounds.size.width
        let viewHeight = bounds.size.height
        
        let halfHeight = CGFloat(ceilf(CFloat(viewHeight / 2.0)))
        let quarterHeight = CGFloat(ceilf(CFloat(viewHeight / 4.0)))
        let threeQuarterHeight = CGFloat(ceilf(CFloat(viewHeight / 4.0 * 3.0)))
        
        titleLabel.frame = CGRect(origin: CGPoint.zero, size: CGSize(width: viewWidth, height: quarterHeight))
        imageView.frame = CGRect(origin: CGPoint(x:0.0, y:quarterHeight), size: CGSize(width: viewWidth, height: halfHeight))
        subtitleLabel.frame = CGRect(origin: CGPoint(x:0.0, y:threeQuarterHeight), size: CGSize(width: viewWidth, height: quarterHeight))
    }
}
