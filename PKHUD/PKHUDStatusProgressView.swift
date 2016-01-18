//
//  PKHUDStatusProgressView.swift
//  PKHUD
//
//  Created by Piergiuseppe Longo on 05/01/16.
//  Copyright © 2016 NSExceptional. All rights reserved.
//

import UIKit

public class PKHUDStatusProgressView: PKHUDStatusView, PKHUDAnimating   {

    public init(title: String?, subtitle: String?) {
        super.init(title: title, subtitle: subtitle, image: PKHUDAssets.progressImage)
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
       
    func startAnimation() {
        imageView.layer.addAnimation(PKHUDAnimation.rotation, forKey: "progressAnimation")
    }
    
    func stopAnimation() {
    }

}
