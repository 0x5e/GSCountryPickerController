//
//  GSViewController.m
//  GSCountryPickerController
//
//  Created by gaosen on 02/28/2016.
//  Copyright (c) 2016 gaosen. All rights reserved.
//

#import "GSViewController.h"
#import "GSCountryPickerController.h"

@interface GSViewController () <GSCountryPickerControllerDelegate>

@end

@implementation GSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [[UIButton alloc] initWithFrame:self.view.bounds];
    [button setTitle:@"Tap to Select Country" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(selectCountryAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)selectCountryAction {
    GSCountryPickerController *vc = [GSCountryPickerController new];
    vc.countryPickerdelegate = self;
    [self presentViewController:vc animated:YES completion:nil];
}

#pragma mark - GSCountryPickerControllerDelegate

- (void)countryPickerController:(GSCountryPickerController *)picker
           didSelectCountryCode:(NSString *)countryCode
                  localizedName:(NSString *)localizedName {
    NSString *msg = [NSString stringWithFormat:@"%@, %@", localizedName, countryCode];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:msg delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alertView show];
}

- (void)countryPickerControllerDidCancel:(GSCountryPickerController *)picker {
    
}

@end