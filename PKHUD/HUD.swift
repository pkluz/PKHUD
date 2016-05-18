//
//  HUD.swift
//  PKHUD
//
//  Created by Eugene Tartakovsky on 29/01/16.
//  Copyright © 2016 Eugene Tartakovsky, NSExceptional. All rights reserved.
//  Licensed under the MIT license.
//

import UIKit

public enum HUDContentType {
    case Success
    case Error
    case Progress
    case Image(UIImage?)
    case RotatingImage(UIImage?)
    
    case LabeledSuccess(title: String?, subtitle: String?)
    case LabeledError(title: String?, subtitle: String?)
    case LabeledProgress(title: String?, subtitle: String?)
    case LabeledImage(image: UIImage?, title: String?, subtitle: String?)
    case LabeledRotatingImage(image: UIImage?, title: String?, subtitle: String?)
    
    case Label(String?)
    case SystemActivity
}

public final class HUD {
    
    // MARK: Properties
    public static var dimsBackground: Bool {
        get { return PKHUD.sharedHUD.dimsBackground }
        set { PKHUD.sharedHUD.dimsBackground = newValue }
    }
    
    public static var allowsInteraction: Bool {
        get { return PKHUD.sharedHUD.userInteractionOnUnderlyingViewsEnabled  }
        set { PKHUD.sharedHUD.userInteractionOnUnderlyingViewsEnabled = newValue }
    }
    
    public static var isVisible: Bool { return PKHUD.sharedHUD.isVisible }
    
    // MARK: Public methods, PKHUD based
    public static func show(content: HUDContentType, onView view: UIView? = nil) {
        PKHUD.sharedHUD.contentView = contentView(content)
        PKHUD.sharedHUD.show(onView: view)
    }
    
    public static func hide(completion: (Bool -> Void)? = nil) {
        PKHUD.sharedHUD.hide(animated: false, completion: completion)
    }
    
    public static func hide(animated animated: Bool, completion: (Bool -> Void)? = nil) {
        PKHUD.sharedHUD.hide(animated: animated, completion: completion)
    }
    
    public static func hide(afterDelay delay: NSTimeInterval, completion: (Bool -> Void)? = nil) {
        PKHUD.sharedHUD.hide(afterDelay: delay, completion: completion)
    }
    
    // MARK: Public methods, HUD based
    public static func flash(content: HUDContentType, onView view: UIView? = nil) {
        HUD.show(content, onView: view)
        HUD.hide(animated: true, completion: nil)
    }
    
    public static func flash(content: HUDContentType, onView view: UIView? = nil, delay: NSTimeInterval, completion: (Bool -> Void)? = nil) {
        HUD.show(content, onView: view)
        HUD.hide(afterDelay: delay, completion: completion)
    }
    
    // MARK: Private methods
    private static func contentView(content: HUDContentType) -> UIView {
        switch content {
        case .Success:
            return PKHUDSuccessView()
        case .Error:
            return PKHUDErrorView()
        case .Progress():
            return PKHUDProgressView()
        case let .Image(image):
            return PKHUDSquareBaseView(image: image)
        case let .RotatingImage(image):
            return PKHUDRotatingImageView(image: image)
            
        case let .LabeledSuccess(title, subtitle):
            return PKHUDSuccessView(title: title, subtitle: subtitle)
        case let .LabeledError(title, subtitle):
            return PKHUDErrorView(title: title, subtitle: subtitle)
        case let .LabeledProgress(title, subtitle):
            return PKHUDProgressView(title: title, subtitle: subtitle)
        case let .LabeledImage(image, title, subtitle):
            return PKHUDSquareBaseView(image: image, title: title, subtitle: subtitle)
        case let .LabeledRotatingImage(image, title, subtitle):
            return PKHUDRotatingImageView(image: image, title: title, subtitle: subtitle)
            
            
        case let .Label(text):
            return PKHUDTextView(text: text)
        case .SystemActivity:
            return PKHUDSystemActivityIndicatorView()
        }
    }
}
