//
//  AppointmentsViewController.h
//  MDLIVE New Dashboard
//
//  Created by David Hoy on 1/2/19.
//  Copyright © 2019 David Hoy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UpcomingApptCell.h"
#import "ApptSummaryCell.h"
#import "ApptHeaderCell.h"
#import "PastApptCell.h"
#import "UpcomingApptDetailCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface AppointmentsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UpcomingApptCellProtocol, PastApptCellProtocol, ApptHeaderCellProtocol>

@end

NS_ASSUME_NONNULL_END
