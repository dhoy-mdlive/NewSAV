//
//  SelectProviderController.h
//  MDLIVE New Dashboard
//
//  Created by David Hoy on 12/31/18.
//  Copyright © 2018 David Hoy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ScheduleVisitController.h"

NS_ASSUME_NONNULL_BEGIN

@interface SelectProviderController : UITableViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic,weak) ScheduleVisitController *scheduleVisitController;
@property (strong, nonatomic) IBOutlet UITableView *providerTableView;

@end

NS_ASSUME_NONNULL_END
