//
//  GSCountryPickerController.h
//  GSCountryPickerController
//
//  Created by gaosen on 02/28/2016.
//  Copyright (c) 2016 gaosen. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GSCountryPickerController;
@protocol GSCountryPickerControllerDelegate;

@interface GSCountryPickerController : UINavigationController

@property (nonatomic, weak) id <GSCountryPickerControllerDelegate> countryPickerdelegate;

@end


@protocol GSCountryPickerControllerDelegate <NSObject>

@optional

- (void)countryPickerController:(GSCountryPickerController *)viewController
           didSelectCountryCode:(NSString *)countryCode
                  localizedName:(NSString *)localizedName;

- (void)countryPickerControllerDidCancel:(GSCountryPickerController *)viewController;

@end