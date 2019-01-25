//
//  ChooseDoctorController.m
//  MDLIVE New Dashboard
//
//  Created by David Hoy on 1/8/19.
//  Copyright © 2019 David Hoy. All rights reserved.
//

#import "ChooseDoctorController.h"
#import "UIColor+mdl.h"
#import "MDLSearchController.h"
#import "UITextField+addDoneToolbar.h"

@interface ChooseDoctorController ()

@property (nonatomic, strong) NSArray <NSDictionary *> *doctorInfo;
@property (nonatomic, strong) NSArray <NSDictionary *> *filteredDoctorInfo;
@property (nonatomic, strong) NSString *selectedDoctor;

@end

@implementation ChooseDoctorController

- (void)viewDidLoad {
    [super viewDidLoad];

    _doctorInfo = @[ @{ @"name":@"Dr. Edgar Allen Poe", @"specialty":@"Anything macabre",   @"availability":@"Nevermore..." },
                     @{ @"name":@"Dr. William Gibson",  @"specialty":@"Neuromancy",         @"availability":@"Now" },
                     @{ @"name":@"Dr. Ray Bradbury",    @"specialty":@"Book burning",       @"availability":@"Yesterday at 4:51pm" },
                     @{ @"name":@"Dr. Kurt Vonnegut",   @"specialty":@"Slaughtering",       @"availability":@"Tomorrow at 3:33am" },
                     @{ @"name":@"Dr. Isaac Asimov",    @"specialty":@"Robotics",           @"availability":@"Some time in the future" },
                     @{ @"name":@"Dr. Philip K. Dick",  @"specialty":@"Bladerunners",       @"availability":@"2019" },
                     @{ @"name":@"Dr. Orson Scott Card",@"specialty":@"Slaughtering",       @"availability":@"Next week" },
                     @{ @"name":@"Dr. Harlan Ellison",  @"specialty":@"Star Trek Scripts",  @"availability":@"Never - he's dead Jim!" },
                     @{ @"name":@"Dr. Arthur C. Clarke",@"specialty":@"Strange monoliths",  @"availability":@"2001" },
                     @{ @"name":@"Dr. Douglas Adams",   @"specialty":@"Hitchhiking",        @"availability":@"At the end of the universe" },
                     @{ @"name":@"Dr. Strangelove",     @"specialty":@"Riding nuclear bombs",@"availability":@"Who knows?" },
                     @{ @"name":@"Dr. Strange",         @"specialty":@"Magic",              @"availability":@"Always" },
                     @{ @"name":@"Dr. Doctor",          @"specialty":@"Some weird stuff",   @"availability":@"He killed Kenny" },
                     @{ @"name":@"Dr. Doolittle",       @"specialty":@"Vetinary",           @"availability":@"Ask the animals" } ];
    _selectedDoctor = nil;
    
    _searchBar.delegate = self;
    _searchBar.barTintColor = _chooseDoctorTableView.backgroundColor;
    _searchBar.layer.borderWidth = 1;
    _searchBar.layer.borderColor = _chooseDoctorTableView.backgroundColor.CGColor;
    _searchBar.placeholder = @"Search for a physician by name...";
    _searchBar.searchBarStyle = UISearchBarStyleMinimal;
    _searchBar.showsCancelButton = NO;
    [_searchBar sizeToFit];
    
    UITextField *textField = [_searchBar valueForKey:@"_searchField"];
    [textField addDoneToolbar];
    textField.textColor = [UIColor whiteColor];
    textField.tintColor = [UIColor whiteColor];
    [textField setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    textField.font = [UIFont fontWithName:@"Montserrat" size:14.0];
    UIView *backgroundView = textField.subviews.firstObject;
    backgroundView.backgroundColor = [UIColor mdliveTeal];
    backgroundView.layer.cornerRadius = 6;
    backgroundView.layer.masksToBounds = YES;
    textField.rightView.tintColor = [UIColor whiteColor];
    UIImageView *imgView = (UIImageView*)textField.leftView;
    imgView.image = [imgView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    imgView.tintColor = [UIColor whiteColor];
    
    _scheduleVisitController = (ScheduleVisitController *)[self parentViewController];
}


-(void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    // Resize the search bar to match the doctor cells in width
    CGSize barSize = [_searchBar sizeThatFits:_chooseDoctorTableView.contentSize];
    CGRect barFrame = CGRectMake(8, 0, barSize.width-16, barSize.height);
    _searchBar.frame = barFrame;
}


#pragma mark - Table view data source


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger ret = 0;
    if (_filteredDoctorInfo.count > 0) {
        ret = _filteredDoctorInfo.count;
    } else {
        ret = _doctorInfo.count;
    }
    return ret;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //NSLog(@"%s: indexPath=%@", __func__, indexPath);
    ChooseDoctorCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ChooseDoctorCell"];
    cell.delegate = self;
    NSDictionary *doctorInfo;
    if (_filteredDoctorInfo.count > 0) {
        doctorInfo = _filteredDoctorInfo[indexPath.row];
    } else {
        doctorInfo = _doctorInfo[indexPath.row];
    }
    cell.doctorNameLabel.text   = doctorInfo[@"name"];
    cell.practiceTypeLabel.text = doctorInfo[@"specialty"];
    cell.availabilityLabel.text = doctorInfo[@"availability"];
    
    if ([_selectedDoctor isEqualToString:cell.doctorNameLabel.text]) {
        cell.containerView.layer.borderWidth = 2;
        cell.containerView.layer.borderColor = [UIColor mdliveTeal].CGColor;
    }
    else {
        cell.containerView.layer.borderWidth = 0;
        cell.containerView.layer.borderColor = nil;
    }
    
    return cell;
}


-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    _selectedDoctor = nil;
    
    NSInteger numRows = [tableView numberOfRowsInSection:indexPath.section];
    for (NSInteger row = 0; row < numRows; row++) {
        NSIndexPath *thisPath = [NSIndexPath indexPathForRow:row inSection:indexPath.section];
        ChooseDoctorCell *cell = [tableView cellForRowAtIndexPath:thisPath];
        if (cell.selected) {
            _selectedDoctor = cell.doctorNameLabel.text;
        }
    }
    
    _scheduleVisitController.nextButton.enabled = (_selectedDoctor != nil);
    UITextField *textField = [_searchBar valueForKey:@"_searchField"];
    [textField resignFirstResponder];
    [_searchBar resignFirstResponder];
    [tableView reloadData];
}


#pragma mark - UISearchBarProtocol methods

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(nonnull NSString *)searchText {
    if (searchText.length != 0) {
        _selectedDoctor = nil;
        _scheduleVisitController.nextButton.enabled = NO;
        // strip out all the leading and trailing spaces
        NSString *strippedString = [searchText stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        NSPredicate* predicate = [NSPredicate predicateWithFormat:@"%K contains[cd] %@", @"name", strippedString];
        _filteredDoctorInfo = [_doctorInfo filteredArrayUsingPredicate:predicate];
    } else {
        _filteredDoctorInfo = nil;
    }
    [self.tableView reloadData];
}


- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
}


@end
