![PKHUD - Swift and easy.](https://raw.githubusercontent.com/pkluz/PKHUD/master/README_hero.png)

A Swift based reimplementation of the Apple HUD View (Volume, Ringer, Rotation,…) for iOS 8.

## Features
- Official iOS 8 Blur via *UIVisualEffectsView*
- Proper rotation support
- Works on top of presented view controllers, alerts,...
- Comes with several *free* resources (Checkmark, Cross, Progress Indicator,...)
- Builds as an iOS 8 framework

## How To
After adding the framework to your project, you need to import the module
```
import PKHUD
```

As of the initial release, there is six out-of-the-box types of content views you can present. 

- `PKHUD.ContentViews.TextView(...)` - provides a wide, three line text view, which you can use to display information.

- `PKHUD.ContentViews.ImageView(...)` - provides a square view, which you can use to display a single image within.

- `PKHUD.ContentViews.ProgressView(...)` - provides a square (indeterminate) progress view.

- `PKHUD.ContentViews.TitleView(...)` - provides a square view, which you can use to display a picture and a title (above the image).

- `PKHUD.ContentViews.SubtitleView(...)` - provides a square view, which you can use to display a picture and a subtitle (beneath the image).

- `PKHUD.ContentViews.StatusView(...)` - provides a square view, which you can use to display a picture, a title and a subtitle. This type of view replicates the Apple HUD one to one.

You can present the HUD with a content view by using the controller.
```
var contentView = PKHUD.ContentViews.ProgressView()
PKHUD.Controller.sharedController.contentView = contentView
PKHUD.Controller.sharedController.showHUD()
```

You can dismiss it in a similar manner.
```
PKHUD.Controller.sharedController.hideHUD(animated: true)
```
…or with a delay.
```
PKHUD.Controller.sharedController.hideHUD(afterDelay: 2.0)
```

## Customization

There are two properties at your disposal to customize general behavior.

- `PKHUD.Controller.sharedController.dimsBackground: Bool` defines whether the background is slightly dimmed when the HUD is shown.

- `PKHUD.Controller.sharedController.userInteractionOnUnderlyingViewsEnabled: Bool` defines whether the underlying views respond to touches while the HUD is shown.

Additionally you are free to create you own custom content views. They can either descend from `PKHUD.ContentViews.SquareBaseView`, `PKHUD.ContentViews.WideBaseView` or simply UIView.

**Note**: It's neither possible to customize the general look and feel, nor do I plan to add that feature. You are free to provide any content views you wish but the blurring, corner radius and shading will remain the same.

## Additional Notes

To enable for poor-mans namespacing (as calling modules by their names explicitly is currently broken) all the classes are wrapped in a struct called `PKHUD`. Therefore all the interfacing happens by prefacing the calls with `PKHUD`. Feel free to use `typealias HUD = PKHUD.Controller` for less typing.