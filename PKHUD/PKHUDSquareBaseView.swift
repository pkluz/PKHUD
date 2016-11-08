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
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    #if os(OSX)
    override open var isFlipped:Bool {
        get {
            return true
        }
    }
    #endif

    public init(image: Img? = nil, title: String? = nil, subtitle: String? = nil) {
        super.init(frame: PKHUDSquareBaseView.defaultSquareBaseViewFrame)
        self.imageView.image = image
        titleLabel.text = title
        subtitleLabel.text = subtitle
        
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        
        self.layoutIfNeeded()
    }

    open let imageView: ImageView = {
        let imageView = ImageView()
        imageView.alpha = 0.85
        imageView.clipsToBounds = true
        imageView.contentMode = .center
        return imageView
    }()
    
    open let titleLabel: Label = {
        let label = Label()
        label.textAlignment = .center
        label.font = Font.boldSystemFont(ofSize: 17.0)
        label.textColor = Color.black.withAlphaComponent(0.85)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.25
        return label
    }()
    
    open let subtitleLabel: Label = {
        let label = Label()
        label.textAlignment = .center
        label.font = Font.systemFont(ofSize: 14.0)
        label.textColor = Color.black.withAlphaComponent(0.7)
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 2
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.25
        return label
    }()

    #if os(OSX)
    open override var allowsVibrancy: Bool {
        return true
    }
    #endif
    
    open override func layoutSubviews() {
        super.layoutSubviews()
    
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
