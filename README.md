# GSCountryPickerController

[![CI Status](http://img.shields.io/travis/gaosen/GSCountryPickerController.svg?style=flat)](https://travis-ci.org/gaosen/GSCountryPickerController)
[![Version](https://img.shields.io/cocoapods/v/GSCountryPickerController.svg?style=flat)](http://cocoapods.org/pods/GSCountryPickerController)
[![License](https://img.shields.io/cocoapods/l/GSCountryPickerController.svg?style=flat)](http://cocoapods.org/pods/GSCountryPickerController)
[![Platform](https://img.shields.io/cocoapods/p/GSCountryPickerController.svg?style=flat)](http://cocoapods.org/pods/GSCountryPickerController)

A simple country picker for iOS with full language support.

## Screenshoots

![screenshots_1](https://github.com/0x5e/GSCountryPickerController/raw/master/Resource/screenshots_1.png)
![screenshots_2](https://github.com/0x5e/GSCountryPickerController/raw/master/Resource/screenshots_2.png)
![screenshots_3](https://github.com/0x5e/GSCountryPickerController/raw/master/Resource/screenshots_3.png)

## Features

- Full language support
- No additional resource bundles (use system language files actually)
- Looks like system country picker (Setting -> Preference -> Language & Locale -> Region)
- Easy to use

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

GSCountryPickerController is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "GSCountryPickerController"
```

## How to use

- First, import header and add protocol to your ViewController

```
#import "GSCountryPickerController.h"

@interface MyViewController () <GSCountryPickerControllerDelegate>
	// ...
@end
```

- Then, implement the protocol

```
#pragma mark - GSCountryPickerControllerDelegate

- (void)countryPickerController:(GSCountryPickerController *)picker
           didSelectCountryCode:(NSString *)countryCode
                  localizedName:(NSString *)localizedName {
	// ...
}

- (void)countryPickerControllerDidCancel:(GSCountryPickerController *)picker {
   	// ... 
}
```

- Instantiate the controller when you want to

```
- (void)selectCountryAction {
    GSCountryPickerController *vc = [GSCountryPickerController new];
    vc.countryPickerdelegate = self;
    [self presentViewController:vc animated:YES completion:nil];
}
```

## Todo

- Support runtime language switch (without App restart)
- Search result

## Author

gaosen, 0x5e@sina.cn

## License

GSCountryPickerController is available under the MIT license. See the LICENSE file for more info.
