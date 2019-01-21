//
//  PharmacyInfoController.h
//  MDLIVE New Dashboard
//
//  Created by David Hoy on 1/17/19.
//  Copyright © 2019 David Hoy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "PharmacyInfoCell.h"
#import "PharmacyMapCell.h"
#import "PharmacyDetailCell.h"
#import "ScheduleVisitController.h"

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    PharmacyControllerModeSearch,
    PharmacyControllerModeSelect
} PharmacyControllerMode;

@interface PharmacyInfoController : UITableViewController <PharmacyInfoCellProtocol, PharmacyDetailCellProtocol, PharmacyMapCellProtocol>

@property (nonatomic,weak) ScheduleVisitController *scheduleVisitController;

@property (nonatomic,assign) PharmacyControllerMode mode;

//@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

NS_ASSUME_NONNULL_END
