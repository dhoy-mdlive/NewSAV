//
//  AppointmentsViewController.h
//  MDLIVE New Dashboard
//
//  Created by David Hoy on 1/2/19.
//  Copyright © 2019 David Hoy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UpcomingApptCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface AppointmentsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UpcomingApptCellProtocol>

@end

NS_ASSUME_NONNULL_END