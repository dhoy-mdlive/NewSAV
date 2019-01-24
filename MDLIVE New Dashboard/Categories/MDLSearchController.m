//
//  MDLSearchController.m
//  MDLIVE New Dashboard
//
//  Created by David Hoy on 1/24/19.
//  Copyright © 2019 David Hoy. All rights reserved.
//

#import "MDLSearchController.h"
#import "MDLSearchBar.h"

@interface MDLSearchController () <UISearchBarDelegate> {
    UISearchBar *_searchBar;
}
@end

@implementation MDLSearchController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(UISearchBar *)searchBar {
    if (_searchBar == nil) {
        _searchBar = [[MDLSearchBar alloc] initWithFrame:CGRectZero];
        _searchBar.delegate = self;
    }
    return _searchBar;
}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    if ([searchBar.text length] > 0) {
        self.active = true;
    } else {
        self.active = false;
    }
}


@end
