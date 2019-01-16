//
//  ChooseDoctorController.h
//  MDLIVE New Dashboard
//
//  Created by David Hoy on 1/8/19.
//  Copyright © 2019 David Hoy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChooseDoctorCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface ChooseDoctorController : UITableViewController <ChooseDoctorCellProtcol, UISearchBarDelegate, UISearchControllerDelegate, UISearchResultsUpdating>

@property (strong, nonatomic) IBOutlet UITableView *chooseDoctorTableView;
@end

/*
@interface DoctorInfo : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *specialty;
@property (strong, nonatomic) NSString *availability;

@end
*/
 
NS_ASSUME_NONNULL_END
