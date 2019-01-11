//
//  ChooseDoctorController.m
//  MDLIVE New Dashboard
//
//  Created by David Hoy on 1/8/19.
//  Copyright © 2019 David Hoy. All rights reserved.
//

#import "ChooseDoctorController.h"
#import "ChooseDoctorCell.h"
#import "UIColor+mdl.h"

@interface ChooseDoctorController ()

//@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) UISearchController *searchController;
@property (nonatomic, strong) NSArray <NSString *> *doctorNames;
@property (nonatomic, strong) NSArray <NSString *> *filteredDoctorNames;

@end

@implementation ChooseDoctorController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;

    _doctorNames = @[ @"Dr. William Gibson",
                      @"Dr. Ray Bradbury",
                      @"Dr. Kurt Vonnegut",
                      @"Dr. Isaac Asimov",
                      @"Dr. Philip K. Dick",
                      @"Dr. Orson Scott Card",
                      @"Dr. Harlan Ellison",
                      @"Dr. Arthur C. Clarke",
                      @"Dr. Douglas Adams",
                      @"Dr. Strangelove",
                      @"Dr. Strange",
                      @"Dr. Doctor",
                      @"Dr. Doolittle"];
    
    _searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    _searchController.searchResultsUpdater = self;
    _searchController.dimsBackgroundDuringPresentation = NO;
    _searchController.searchBar.delegate = self;
    _chooseDoctorTableView.tableHeaderView = _searchController.searchBar;
    
    [self.searchController.searchBar sizeToFit];
    _searchController.searchBar.barTintColor = _chooseDoctorTableView.backgroundColor;
    _searchController.searchBar.layer.borderWidth = 1;
    _searchController.searchBar.layer.borderColor = _chooseDoctorTableView.backgroundColor.CGColor;
    _searchController.searchBar.placeholder = @"Search for a physician by name...";
    _searchController.searchBar.searchBarStyle = UISearchBarStyleMinimal;
    _searchController.searchBar.showsCancelButton = NO;
    
    UITextField *textField = [_searchController.searchBar valueForKey:@"_searchField"];
    textField.textColor = [UIColor whiteColor];
    textField.tintColor = [UIColor whiteColor];
    [textField setValue:[UIColor lightGrayColor] forKeyPath:@"_placeholderLabel.textColor"];
    textField.font = [UIFont fontWithName:@"Montserrat" size:14.0];
    UIView *backgroundView = textField.subviews.firstObject;
    backgroundView.backgroundColor = [UIColor colorFromHexString:@"#278cc9"];
    backgroundView.layer.cornerRadius = 6;
    backgroundView.layer.masksToBounds = YES;
    textField.leftView.tintColor = [UIColor whiteColor];
    textField.rightView.tintColor = [UIColor whiteColor];
                                      
    self.definesPresentationContext = YES;
}

-(void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    CGRect barFrame = _searchController.searchBar.frame;
    barFrame.size.width -= 8;
    barFrame.origin.x += 4;
    _searchController.searchBar.frame = barFrame;
}


#pragma mark - Table view data source


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger ret = 0;
    if (_filteredDoctorNames.count > 0) {
        ret = _filteredDoctorNames.count;
    } else {
        ret = _doctorNames.count;
    }
    return ret;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //NSLog(@"%s: indexPath=%@", __func__, indexPath);
    ChooseDoctorCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ChooseDoctorCell"];
    if (_filteredDoctorNames.count > 0) {
        cell.doctorNameLabel.text = _filteredDoctorNames[indexPath.row];
    } else {
        cell.doctorNameLabel.text = _doctorNames[indexPath.row];
    }
    return cell;
}


-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger numRows = [tableView numberOfRowsInSection:indexPath.section];
    for (NSInteger row = 0; row < numRows; row++) {
        NSIndexPath *thisPath = [NSIndexPath indexPathForRow:row inSection:indexPath.section];
        ChooseDoctorCell *cell = [tableView cellForRowAtIndexPath:thisPath];
        if (cell.selected) {
            cell.containerView.layer.borderWidth = 2;
            cell.containerView.layer.borderColor = [UIColor colorFromHexString:@"#278cc9"].CGColor;
        } else {
            cell.containerView.layer.borderWidth = 0;
        }
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - UISearchController methods

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    NSString *searchString = searchController.searchBar.text;
    if (searchString.length != 0) {
        // strip out all the leading and trailing spaces
        NSString *strippedString = [searchString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        NSPredicate* predicate = [NSPredicate predicateWithFormat:@"SELF contains[cd] %@", strippedString];
        _filteredDoctorNames = [_doctorNames filteredArrayUsingPredicate:predicate];
    } else {
        _filteredDoctorNames = nil;
    }
    [self.tableView reloadData];
}


- (void)searchBar:(UISearchBar *)searchBar selectedScopeButtonIndexDidChange:(NSInteger)selectedScope {
    [self updateSearchResultsForSearchController:self.searchController];
}

#pragma mark - UISearchBarDelegate

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
}

#pragma mark - UISearchControllerDelegate

// Called after the search controller's search bar has agreed to begin editing or when
// 'active' is set to YES.
// If you choose not to present the controller yourself or do not implement this method,
// a default presentation is performed on your behalf.
//
// Implement this method if the default presentation is not adequate for your purposes.
//
//- (void)presentSearchController:(UISearchController *)searchController {
//    // do something when the search controller is presented
//}

//- (void)willPresentSearchController:(UISearchController *)searchController {
//    // do something before the search controller is presented
//}

//- (void)didPresentSearchController:(UISearchController *)searchController {
//    // do something after the search controller is presented
//}

//- (void)willDismissSearchController:(UISearchController *)searchController {
//    // do something before the search controller is dismissed
//}

//- (void)didDismissSearchController:(UISearchController *)searchController {
//    // do something after the search controller is dismissed
//}

-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
}

-(void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
}

@end
