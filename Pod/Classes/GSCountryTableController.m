//
//  GSCountryTableController.m
//  GSCountryPickerController
//
//  Created by gaosen on 02/28/2016.
//  Copyright (c) 2016 gaosen. All rights reserved.
//

#import "GSCountryTableController.h"
#import "GSCountryPickerController.h"
#import "GSCountryModel.h"

#define reuseIdentifier @"reuseIdentifier"

static NSString * UIKitLocalizedString(NSString *string) {
    NSBundle *UIKitBundle = [NSBundle bundleForClass:[UIApplication class]];
    return UIKitBundle ? [UIKitBundle localizedStringForKey:string value:string table:nil] : string;
}

@interface GSCountryTableController () <UISearchBarDelegate>

@property (nonatomic, strong) GSCountryPickerController *navigationController;
@property (nonatomic, weak) id <GSCountryPickerControllerDelegate> countryPickerdelegate;
@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic, strong) NSArray<NSArray<GSCountryModel *> *> *sections;
@property (nonatomic, strong) NSArray<GSCountryModel *> *searchResult;

@end

@implementation GSCountryTableController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initView];
    [self initData];
}

- (void)initView {
    self.navigationItem.title = UIKitLocalizedString(@"Select");
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelAction)];
    
    self.tableView.tableHeaderView = self.searchBar;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:reuseIdentifier];
}

- (void)initData {
    NSArray *codeArray = [NSLocale ISOCountryCodes];
    NSMutableArray *modelArray = [NSMutableArray array];
//    NSLocale *locale = [NSLocale currentLocale];
    NSLocale *locale = [NSLocale autoupdatingCurrentLocale];
//    NSString *preferredLanguages = [[NSLocale preferredLanguages] firstObject];
//    NSLocale *locale = [NSLocale localeWithLocaleIdentifier:preferredLanguages];
    
    for (NSString *countryCode in codeArray) {
        NSString *localizedName = [locale displayNameForKey:NSLocaleCountryCode value:countryCode];
        GSCountryModel *model = [GSCountryModel new];
        model.countryCode = countryCode;
        model.localizedName = localizedName;
        [modelArray addObject:model];
    }
    [self setObjects:modelArray];
}

// http://nshipster.cn/uilocalizedindexedcollation/
- (void)setObjects:(NSArray *)objects {
    SEL selector = @selector(localizedName);
    
    NSInteger sectionTitlesCount = [[[UILocalizedIndexedCollation currentCollation] sectionTitles] count];
    
    NSMutableArray *mutableSections = [[NSMutableArray alloc] initWithCapacity:sectionTitlesCount];
    for (NSUInteger idx = 0; idx < sectionTitlesCount; idx++) {
        [mutableSections addObject:[NSMutableArray array]];
    }
    
    for (id object in objects) {
        NSInteger sectionNumber = [[UILocalizedIndexedCollation currentCollation] sectionForObject:object collationStringSelector:selector];
        [[mutableSections objectAtIndex:sectionNumber] addObject:object];
    }
    
    for (NSUInteger idx = 0; idx < sectionTitlesCount; idx++) {
        NSArray *objectsForSection = [mutableSections objectAtIndex:idx];
        [mutableSections replaceObjectAtIndex:idx withObject:[[UILocalizedIndexedCollation currentCollation] sortedArrayFromArray:objectsForSection collationStringSelector:selector]];
    }
    
    self.sections = mutableSections;
    
    [self.tableView reloadData];
}

#pragma mark - action

- (void)cancelAction {
    [self.view endEditing:YES];
    if ([self.countryPickerdelegate respondsToSelector:@selector(countryPickerControllerDidCancel:)]) {
        [self.countryPickerdelegate countryPickerControllerDidCancel:self.navigationController];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)selectAction:(GSCountryModel *)model {
    [self.view endEditing:YES];
    if ([self.countryPickerdelegate respondsToSelector:@selector(countryPickerController:didSelectCountryCode:localizedName:)]) {
        [self.countryPickerdelegate countryPickerController:self.navigationController didSelectCountryCode:model.countryCode localizedName:model.localizedName];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - getter

- (GSCountryPickerController *)navigationController {
    return (GSCountryPickerController *)super.navigationController;
}

- (id<GSCountryPickerControllerDelegate>)countryPickerdelegate {
    return self.navigationController.countryPickerdelegate;
}

- (UISearchBar *)searchBar {
    if (!_searchBar) {
        _searchBar = [UISearchBar new];
        [_searchBar sizeToFit];
        _searchBar.placeholder = UIKitLocalizedString(@"Search");
        _searchBar.delegate = self;
    }
    return _searchBar;
}

#pragma mark - Table view data source & delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.sections[section].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    GSCountryModel *model = self.sections[indexPath.section][indexPath.row];
    cell.textLabel.text = model.localizedName;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    GSCountryModel *model = self.sections[indexPath.section][indexPath.row];
    [self selectAction:model];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.sections[section].count > 0 ? [[[UILocalizedIndexedCollation currentCollation] sectionTitles] objectAtIndex:section] : nil;
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return [[UILocalizedIndexedCollation currentCollation] sectionIndexTitles];
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    return [[UILocalizedIndexedCollation currentCollation] sectionForSectionIndexTitleAtIndex:index];
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self.searchBar resignFirstResponder];
}

#pragma mark - UISearchBarDelegate

// TODO:

@end
