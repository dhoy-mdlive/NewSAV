//
//  Appointment.m
//  MDLIVE New Dashboard
//
//  Created by David Hoy on 1/28/19.
//  Copyright © 2019 David Hoy. All rights reserved.
//

#import "AppointmentsMock.h"

@implementation AppointmentsMock {
    NSMutableArray <Appointment *> *_appointments;
}
    
+ (instancetype)sharedInstance
{
    static AppointmentsMock *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[AppointmentsMock alloc] init];
        // Do any other initialisation stuff here
    });
    return sharedInstance;
}

    
- (instancetype)init {
    
    self = [super init];
    if (self != nil) {
        _appointments = [NSMutableArray array];
        
        NSDate *now = [NSDate date];
        Appointment *appt = [Appointment appointmentWithName:@"Dr. Doctor"
                                                   specialty:@"Extreme silliness"
                                                   visitType:VisitTypePhone
                                                        date:[now dateByAddingTimeInterval:-10000]
                                                   andReason:@"Feeling weird"];
        [_appointments addObject:appt];
        
        appt = [Appointment appointmentWithName:@"Dr. Doolittle"
                                      specialty:@"Vetinary medicine"
                                      visitType:VisitTypeVideo
                                           date:[now dateByAddingTimeInterval:+10000]
                                      andReason:@"Feeling the need to eat lots of bananas"];
        [_appointments addObject:appt];
        
        appt = [Appointment appointmentWithName:@"Dr. Douglas Adams"
                                      specialty:@"Meaning of life"
                                      visitType:VisitTypeVideo
                                           date:[now dateByAddingTimeInterval:+15000]
                                      andReason:@"Looking for the ultimate question"];
        [_appointments addObject:appt];
        
        /*
         appt = [Appointment appointmentWithName:@"Dr. Isaac Asimov"
         specialty:@"Cybernetics"
         visitType:VisitTypeVideo
         date:[now dateByAddingTimeInterval:-15000]
         andReason:@"Feeling not quite myself."];
         [_appointments addObject:appt];
         */
    }
    return self;
}
   
    
- (NSArray <Appointment *> *)appointmentsForPatient:(NSString *)patientId {
    return _appointments;
}
    
    
-(NSArray <Appointment *> *)appointmentsAfterDate:(nullable NSDate *)date {
    if (date == nil) {
        date = [NSDate date];
    }
    
    NSMutableArray *appts = [NSMutableArray array];
    for (Appointment *appt in _appointments) {
        NSTimeInterval interval = [appt.apptDate timeIntervalSinceNow];
        if (interval >= 0) {
            [appts addObject:appt];
        }
    }
    return appts;
}
    
-(NSArray <Appointment *> *)appointmentsBeforeDate:(nullable NSDate *)date {
    if (date == nil) {
        date = [NSDate date];
    }
    
    NSMutableArray *appts = [NSMutableArray array];
    for (Appointment *appt in _appointments) {
        NSTimeInterval interval = [appt.apptDate timeIntervalSinceNow];
        if (interval < 0) {
            [appts addObject:appt];
        }
    }
    return appts;
}
    
    

@end
