//
//  ReasonForVisitController.h
//  MDLIVE New Dashboard
//
//  Created by David Hoy on 1/2/19.
//  Copyright © 2019 David Hoy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ReasonForVisitCell.h"
#import "ScheduleVisitController.h"

NS_ASSUME_NONNULL_BEGIN

IB_DESIGNABLE
@interface ReasonForVisitController : UITableViewController  <UITableViewDelegate, UITableViewDataSource, ReasonForVisitCellProtocol>

@property (nonatomic,weak) ScheduleVisitController *scheduleVisitController;
@property (strong, nonatomic) IBOutlet UITableView *reasonForVisitTableView;

@end

NS_ASSUME_NONNULL_END
