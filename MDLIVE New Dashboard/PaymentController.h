//
//  PaymentController.h
//  MDLIVE New Dashboard
//
//  Created by David Hoy on 1/8/19.
//  Copyright © 2019 David Hoy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PaymentCell.h"
#import "ScheduleVisitController.h"

NS_ASSUME_NONNULL_BEGIN

@interface PaymentController : UITableViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic,weak) ScheduleVisitController *scheduleVisitController;

@end

NS_ASSUME_NONNULL_END
