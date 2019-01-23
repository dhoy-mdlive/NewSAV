//
//  PharmacyDetailCell.h
//  MDLIVE New Dashboard
//
//  Created by David Hoy on 1/17/19.
//  Copyright © 2019 David Hoy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ScheduleVisitController.h"
#import "ContainerView.h"

@protocol PharmacyDetailCellProtocol <NSObject>
@end

NS_ASSUME_NONNULL_BEGIN

@interface PharmacyDetailCell : UITableViewCell

@property (nonatomic,weak) ScheduleVisitController *scheduleVisitController;

@property (nonatomic,retain) id<PharmacyDetailCellProtocol> delegate;

// Interface Builder outlets
@property (strong, nonatomic) IBOutlet ContainerView *containerView;
@property (strong, nonatomic) IBOutlet UILabel *pharmacyNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *addressLine1Label;
@property (strong, nonatomic) IBOutlet UILabel *addressLine2Label;
@property (strong, nonatomic) IBOutlet UILabel *distanceLabel;
@property (strong, nonatomic) IBOutlet UIButton *phoneButton;

@end

NS_ASSUME_NONNULL_END
