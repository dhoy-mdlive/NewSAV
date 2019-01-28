//
//  UpcomingApptCell.m
//  MDLIVE New Dashboard
//
//  Created by David Hoy on 12/28/18.
//  Copyright © 2018 David Hoy. All rights reserved.
//

#import "UpcomingApptCell.h"


@implementation UpcomingApptCell

@synthesize delegate;
@synthesize appointment;
    
    
- (void)updateWithAppointment:(Appointment *)appt {
    self.appointment = appt;
    self.doctorNameLabel.text = appt.providerName;
    BOOL isToday = [[NSCalendar currentCalendar] isDateInToday:appt.apptDate];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    if (isToday) {
        self.apptDayLabel.text = @"Today";
    }
    else {
        [formatter setDateFormat:@"MMM d"];
        self.apptDayLabel.text = [formatter stringFromDate:appt.apptDate];
    }
    
    [formatter setDateFormat:@"hh:mm a"];
    self.apptTimeLabel.text = [formatter stringFromDate:appt.apptDate];
    
    NSString *notes;
    notes = appt.providerSpecialty;
    if (appt.reasonForVisit != nil) {
        notes = [notes stringByAppendingFormat:@", %@", appt.reasonForVisit];
    }
    notes = [notes stringByAppendingFormat:@", %@ Call", appt.visitType == VisitTypePhone ? @"Phone" : @"Video"];
    self.notesLabel.text = notes;
}

@end
