//
//  ChooseDoctorCell.h
//  MDLIVE New Dashboard
//
//  Created by David Hoy on 1/8/19.
//  Copyright © 2019 David Hoy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewDesignable.h"

NS_ASSUME_NONNULL_BEGIN

@interface ChooseDoctorCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIViewDesignable *containerView;
@property (strong, nonatomic) IBOutlet UIImageView *doctorImageView;
@property (strong, nonatomic) IBOutlet UILabel *doctorNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *practiceTypeLabel;
@property (strong, nonatomic) IBOutlet UILabel *availabilityLabel;

@end

NS_ASSUME_NONNULL_END
