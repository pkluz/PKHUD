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
    case success
    case error
    case progress
    case image(UIImage?)
    case rotatingImage(UIImage?)

    case labeledSuccess(title: String?, subtitle: String?)
    case labeledError(title: String?, subtitle: String?)
    case labeledProgress(title: String?, subtitle: String?)
    case labeledImage(image: UIImage?, title: String?, subtitle: String?)
    case labeledRotatingImage(image: UIImage?, title: String?, subtitle: String?)

    case label(String?)
    case systemActivity
    case customView(view: UIView)
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

    public static var leadingMargin: CGFloat {
        get { return PKHUD.sharedHUD.leadingMargin  }
        set { PKHUD.sharedHUD.leadingMargin = newValue }
    }

    public static var trailingMargin: CGFloat {
        get { return PKHUD.sharedHUD.trailingMargin  }
        set { PKHUD.sharedHUD.trailingMargin = newValue }
    }

    public static var isVisible: Bool { return PKHUD.sharedHUD.isVisible }

    // MARK: Public methods, PKHUD based
    public static func show(_ content: HUDContentType, tintColor:UIColor? = nil, onView view: UIView? = nil) {
        PKHUD.sharedHUD.contentView = contentView(content, tintColor: tintColor)
        PKHUD.sharedHUD.show(onView: view)
    }

    public static func hide(_ completion: ((Bool) -> Void)? = nil) {
        PKHUD.sharedHUD.hide(animated: false, completion: completion)
    }

    public static func hide(animated: Bool, completion: ((Bool) -> Void)? = nil) {
        PKHUD.sharedHUD.hide(animated: animated, completion: completion)
    }

    public static func hide(afterDelay delay: TimeInterval, completion: ((Bool) -> Void)? = nil) {
        PKHUD.sharedHUD.hide(afterDelay: delay, completion: completion)
    }

    // MARK: Public methods, HUD based
    public static func flash(_ content: HUDContentType, tintColor:UIColor? = nil, onView view: UIView? = nil) {
        HUD.show(content, tintColor: tintColor, onView: view)
        HUD.hide(animated: true, completion: nil)
    }

    public static func flash(_ content: HUDContentType, tintColor:UIColor? = nil, onView view: UIView? = nil, delay: TimeInterval, completion: ((Bool) -> Void)? = nil) {
        HUD.show(content, tintColor: tintColor, onView: view)
        HUD.hide(afterDelay: delay, completion: completion)
    }
    
    // MARK: Keyboard Methods
    public static func registerForKeyboardNotifications() {
        PKHUD.sharedHUD.registerForKeyboardNotifications()
    }
    
    public static func deregisterFromKeyboardNotifications() {
        PKHUD.sharedHUD.deregisterFromKeyboardNotifications()
    }

    // MARK: Private methods
    fileprivate static func contentView(_ content: HUDContentType, tintColor:UIColor? = nil) -> UIView {
        switch content {
        case .success:
            return PKHUDSuccessView(tintColor: tintColor)
        case .error:
            return PKHUDErrorView(tintColor: tintColor)
        case .progress:
            return PKHUDProgressView()
        case let .image(image):
            return PKHUDSquareBaseView(image: image)
        case let .rotatingImage(image):
            return PKHUDRotatingImageView(image: image)

        case let .labeledSuccess(title, subtitle):
            return PKHUDSuccessView(title: title, subtitle: subtitle, tintColor: tintColor)
        case let .labeledError(title, subtitle):
            return PKHUDErrorView(title: title, subtitle: subtitle, tintColor:tintColor)
        case let .labeledProgress(title, subtitle):
            return PKHUDProgressView(title: title, subtitle: subtitle)
        case let .labeledImage(image, title, subtitle):
            return PKHUDSquareBaseView(image: image, title: title, subtitle: subtitle)
        case let .labeledRotatingImage(image, title, subtitle):
            return PKHUDRotatingImageView(image: image, title: title, subtitle: subtitle)

        case let .label(text):
            return PKHUDTextView(text: text)
        case .systemActivity:
            return PKHUDSystemActivityIndicatorView()
        case let .customView(view):
            return view
        }
    }
}
