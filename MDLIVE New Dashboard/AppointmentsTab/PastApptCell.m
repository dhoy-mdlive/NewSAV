//
//  PastApptCell.m
//  MDLIVE New Dashboard
//
//  Created by David Hoy on 1/25/19.
//  Copyright © 2019 David Hoy. All rights reserved.
//

#import "PastApptCell.h"

@implementation PastApptCell

@synthesize delegate;
@synthesize appointment;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
    
    
- (void)updateWithAppointment:(Appointment *)appt {
    self.appointment = appt;
    self.doctorNameLabel.text = self.appointment.providerName;
    BOOL isToday = [[NSCalendar currentCalendar] isDateInToday:appt.apptDate];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MMM d, YYYY - hh:mm a"];
    self.apptDateTimeLabel.text = [formatter stringFromDate:appt.apptDate];
}
    

@end
