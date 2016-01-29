//
//  Created by Eugene Tartakovsky on 29/01/16.
//  Copyright © 2016 Eugene Tartakovsky. All rights reserved.
//

import UIKit
import PKHUD

public enum HUDContent {
    case Success
    case Failure
    case Progress
    case Text(String)
    case Image(UIImage)
    case Status(title: String, subtitle: String, image: UIImage)
    case StatusProgress(title: String, subtitle: String)
    case Title(title: String, image: UIImage)
    case Subtitle(subtitle: String, image: UIImage)
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
    public static func show(content: HUDContent) {
        PKHUD.sharedHUD.contentView = contentView(content)
        PKHUD.sharedHUD.show()
    }
    
    public static func hide(animated animated: Bool = false) {
        PKHUD.sharedHUD.hide(animated: animated)
    }
    
    public static func hide(afterDelay delay: NSTimeInterval) {
        PKHUD.sharedHUD.hide(afterDelay: delay)
    }
    
    // MARK: Public methods, HUD based
    public static func flash(content: HUDContent) {
        HUD.show(content)
        HUD.hide(animated: true)
    }
    
    public static func flash(content: HUDContent, withDelay delay: NSTimeInterval) {
        HUD.show(content)
        HUD.hide(afterDelay: delay)
    }
    
    // MARK: Private methods
    private static func contentView(content: HUDContent) -> UIView {
        switch content {
        case .Success:
            return PKHUDSuccessView()
        case .Failure:
            return PKHUDErrorView()
        case .Progress:
            return PKHUDProgressView()
        case let .Text(text):
            return PKHUDTextView(text: text)
        case let .Image(image):
            return PKHUDImageView(image: image)
        case let .Status(title, subtitle, image):
            return PKHUDStatusView(title: title, subtitle: subtitle, image: image)
        case let .StatusProgress(title: title, subtitle: subtitle):
            return PKHUDStatusProgressView(title: title, subtitle: subtitle)
        case let .Title(title, image):
            return PKHUDTitleView(title: title, image: image)
        case let .Subtitle(subtitle, image):
            return PKHUDSubtitleView(subtitle: subtitle, image: image)
        case .SystemActivity:
            return PKHUDSystemActivityIndicatorView()
        }
    }
}
