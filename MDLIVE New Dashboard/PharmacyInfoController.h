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
#import "PharmacyDetailCell.h"
#import "ScheduleVisitController.h"
#import "PhamacyHeaderView.h"

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    PharmacyControllerModeSearch,
    PharmacyControllerModeSelect
} PharmacyControllerMode;

@interface PharmacyInfoController : UITableViewController <PharmacyInfoCellProtocol, PharmacyDetailCellProtocol, MKMapViewDelegate>

@property (nonatomic,weak) ScheduleVisitController *scheduleVisitController;

@property (nonatomic,assign) PharmacyControllerMode mode;
@property (strong, nonatomic) IBOutlet PhamacyHeaderView *pharmacyHeaderView;
@property (strong, nonatomic) IBOutlet MKMapView *pharmacyMapView;


@end

NS_ASSUME_NONNULL_END
