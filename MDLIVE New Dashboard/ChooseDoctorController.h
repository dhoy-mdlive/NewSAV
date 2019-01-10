//
//  ChooseDoctorController.h
//  MDLIVE New Dashboard
//
//  Created by David Hoy on 1/8/19.
//  Copyright © 2019 David Hoy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ChooseDoctorController : UITableViewController <UISearchBarDelegate, UISearchControllerDelegate, UISearchResultsUpdating>

@property (strong, nonatomic) IBOutlet UITableView *chooseDoctorTableView;
@end

NS_ASSUME_NONNULL_END