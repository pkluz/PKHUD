![PKHUD - Swift and easy.](https://raw.githubusercontent.com/pkluz/PKHUD/master/README_hero.png)
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
- Comes with several *free* resources - Checkmark, Cross, Progress Indicator,...
- Builds as an **iOS 8 framework**.

## How To
After adding the framework to your project, you need to import the module
```
import PKHUD
```

As of the initial release, there is six out-of-the-box types of content views you can present. 

- `HUDContentView.TextView(...)`
provides a wide, three line text view, which you can use to display information.

- `HUDContentView.ImageView(...)` - provides a square view, which you can use to display a single image within.

- `HUDContentView.ProgressView(...)` - provides a square (indeterminate) progress view.

- `HUDContentView.TitleView(...)` - provides a square view, which you can use to display a picture and a title (above the image).

- `HUDContentView.SubtitleView(...)` - provides a square view, which you can use to display a picture and a subtitle (beneath the image).

- `HUDContentView.StatusView(...)` - provides a square view, which you can use to display a picture, a title and a subtitle. This type of view replicates the Apple HUD one to one.

You can present the HUD with a content view by using the controller.
```
var contentView = HUDContentView.ProgressView()
HUDController.sharedController.contentView = contentView
HUDController.sharedController.show()
```

You can dismiss it in a similar manner.
```
HUDController.sharedController.hide(animated: true)
```
…or with a delay.
```
HUDController.sharedController.hide(afterDelay: 2.0)
```

## Customization

There are two properties at your disposal to customize general behavior.

- `HUDController.sharedController.dimsBackground: Bool` defines whether the background is slightly dimmed when the HUD is shown.

- `HUDController.sharedController.userInteractionOnUnderlyingViewsEnabled: Bool` defines whether the underlying views respond to touches while the HUD is shown.

Additionally you are free to create you own custom content views. They can either descend from `HUDContentView.SquareBaseView`, `HUDContentView.WideBaseView` or simply UIView.

**Note**: It's neither possible to customize the general look and feel, nor do I plan to add that feature. You are free to provide any content views you wish but the blurring, corner radius and shading will remain the same.

## Disclaimer

While basically feature complete and stable, make sure you understand that the API **will change as Swift matures** and some of the annoying compiler quirks are resolved.

## License

The MIT License (MIT)

Copyright (c) 2014 Philip Kluz (Philip.Kluz@gmail.com)

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
