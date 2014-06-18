//
//  HUDView.swift
//  PKHUD
//
//  Created by Philip Kluz on 6/16/14.
//  Copyright (c) 2014 NSExceptional. All rights reserved.
//

import UIKit

extension PKHUD {
    
    /**
        Provides the general look and feel of the PKHUD, into which the eventual content is inserted.
    */
    class FrameView: UIVisualEffectView {
        init() {
            super.init(effect: UIBlurEffect(style: .Light))
            
            backgroundColor = UIColor(white: 0.8, alpha: 0.36)
            layer.cornerRadius = 9.0
            layer.masksToBounds = true
            
            contentView.addSubview(self.content)
        }
        
        var _content = UIView()
        var content: UIView {
            get {
                return _content
            }
            set (newValue) {
                _content.removeFromSuperview()
                _content = newValue
                _content.alpha = 0.85
                _content.clipsToBounds = true
                _content.contentMode = .Center
                frame.size = _content.bounds.size
                addSubview(_content)
            }
        }
    }
}
