//
//  UpcomingApptCell.h
//  MDLIVE New Dashboard
//
//  Created by David Hoy on 12/28/18.
//  Copyright © 2018 David Hoy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+IBDesignable.h"

NS_ASSUME_NONNULL_BEGIN

@protocol UpcomingApptCellProtocol <NSObject>
@end

@interface UpcomingApptCell : UITableViewCell

@property (nonatomic,retain) id<UpcomingApptCellProtocol> delegate;

@property (strong, nonatomic) IBOutlet UILabel *doctorNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *notesLabel;
@property (strong, nonatomic) IBOutlet UILabel *apptDayLabel;
@property (strong, nonatomic) IBOutlet UILabel *apptMonthLabel;
@property (strong, nonatomic) IBOutlet UILabel *apptTimeLabel;

@end

NS_ASSUME_NONNULL_END
