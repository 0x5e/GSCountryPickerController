//
//  GSCountryPickerController.m
//  GSCountryPickerController
//
//  Created by gaosen on 02/28/2016.
//  Copyright (c) 2016 gaosen. All rights reserved.
//

#import "GSCountryPickerController.h"
#import "GSCountryTableController.h"

@interface GSCountryPickerController ()

@end

@implementation GSCountryPickerController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.viewControllers = @[[GSCountryTableController new]];
}

@end
