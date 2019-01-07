//
//  YourAppointmentController.h
//  MDLIVE New Dashboard
//
//  Created by David Hoy on 1/4/19.
//  Copyright © 2019 David Hoy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YourAppointmentCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface YourAppointmentController : UITableViewController

@property (strong, nonatomic) IBOutlet UITableView *appointmentTableView;

@end

NS_ASSUME_NONNULL_END
