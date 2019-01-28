//
//  UpcomingApptCell.h
//  MDLIVE New Dashboard
//
//  Created by David Hoy on 12/28/18.
//  Copyright © 2018 David Hoy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+IBDesignable.h"
#import "Appointment.h"

NS_ASSUME_NONNULL_BEGIN

@protocol UpcomingApptCellProtocol <NSObject>
//- (Appointment *)getAppointment;
@end

@interface UpcomingApptCell : UITableViewCell

@property (nonatomic,retain) id<UpcomingApptCellProtocol> delegate;
@property (nonatomic,strong) Appointment *appointment;

@property (strong, nonatomic) IBOutlet UILabel *doctorNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *notesLabel;
@property (strong, nonatomic) IBOutlet UILabel *apptDayLabel;
//@property (strong, nonatomic) IBOutlet UILabel *apptMonthLabel;
@property (strong, nonatomic) IBOutlet UILabel *apptTimeLabel;
    
- (void)updateWithAppointment:(Appointment *)appt;

@end

NS_ASSUME_NONNULL_END
