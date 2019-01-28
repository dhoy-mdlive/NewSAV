//
//  PastApptCell.h
//  MDLIVE New Dashboard
//
//  Created by David Hoy on 1/25/19.
//  Copyright © 2019 David Hoy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Appointment.h"

NS_ASSUME_NONNULL_BEGIN

@protocol PastApptCellProtocol <NSObject>
@end

@interface PastApptCell : UITableViewCell

@property (nonatomic,strong) id<PastApptCellProtocol> delegate;
@property (nonatomic,strong) Appointment *appointment;

@property (strong, nonatomic) IBOutlet UIImageView *doctorImageView;
@property (strong, nonatomic) IBOutlet UILabel *doctorNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *apptDateTimeLabel;
    
- (void)updateWithAppointment:(Appointment *)appt;
    
@end


NS_ASSUME_NONNULL_END
