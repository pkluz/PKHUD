![PKHUD - Swift and easy](https://raw.githubusercontent.com/pkluz/PKHUD/master/README_hero.png)
<br />
<br />
<br />
A **Swift** based reimplementation of the Apple HUD (Volume, Ringer, Rotation,…) **for iOS 8**.
<br />
<br />
## Features
- Official iOS 8 blur effect via **UIVisualEffectsView**.
- Proper **rotation support**.
- Size / **Device agnostic**.
- Works on top of presented view controllers, alerts,...
- Comes with several *free* resources - Checkmark, Cross, Progress Indicator,…
- …as well as animated ones.
- Builds as an **iOS 8 framework**.

![demo.gif](https://raw.githubusercontent.com/nahitheper/PKHUD/master/demo.gif)

## How To
First you need to add the framework to your project. The recommended way is to use CocoaPods.
```ruby
pod "PKHUD"
```

After adding the framework to your project, you need to import the module
```swift
import PKHUD
```

Now, you can proceed to show an arbitrary HUD (and hide it soon after) like this:
```swift
PKHUD.sharedHUD.contentView = PKHUDSuccessView()
PKHUD.sharedHUD.show()
PKHUD.sharedHUD.hide(afterDelay: 2.0);
```

You can also hot-swap content views - this can prove useful if you want to display a progress HUD first and transform it into a success or error HUD after an asynchronous operation has finished.
```swift
PKHUD.sharedHUD.contentView = PKHUDProgressView()
PKHUD.sharedHUD.show()
        
let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(2.0 * Double(NSEC_PER_SEC)))
dispatch_after(delayTime, dispatch_get_main_queue()) {
    PKHUD.sharedHUD.contentView = PKHUDSuccessView()
    PKHUD.sharedHUD.hide(afterDelay: 2.0)
}
```

Please note that there are _multiple_ types of content views that ship with PKHUD. You can find them as separate files in the project folder as well as in the `ContentViews` group in Xcode.

## Customization

There are two properties at your disposal to customize general behavior.

- `PKHUD.sharedHUD.dimsBackground: Bool` defines whether the background is slightly dimmed when the HUD is shown.

- `PKHUD.sharedHUD.userInteractionOnUnderlyingViewsEnabled: Bool` defines whether the underlying views respond to touches while the HUD is shown.

Additionally you are free to create you own custom content views. They can descend from any `UIView` type or the predefined base classes `PKHUDSquareBaseView` and `PKHUDWideBaseView`.

**Note**: It's neither possible to customize the general look and feel, nor do I plan to add that feature. You are free to provide any content views you wish but the blurring, corner radius and shading will remain the same.

## License

The MIT License (MIT)

Copyright (c) 2015 Philip Kluz (Philip.Kluz@gmail.com)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
