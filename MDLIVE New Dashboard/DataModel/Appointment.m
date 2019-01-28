//
//  Appointment.m
//  MDLIVE New Dashboard
//
//  Created by David Hoy on 1/28/19.
//  Copyright © 2019 David Hoy. All rights reserved.
//

#import "Appointment.h"

@implementation Appointment

@synthesize apptUUID;
@synthesize providerName;
@synthesize providerSpecialty;
@synthesize visitType;
@synthesize apptDate;
@synthesize reasonForVisit;
@synthesize canceled;
@synthesize consulationSummary;
@synthesize transactionReceipt;
@synthesize claimsForm;
    
    
+ (instancetype)appointmentWithName:(NSString *)providerName
                          specialty:(NSString *)specialty
                          visitType:(VisitType)visitType
                               date:(NSDate *)date
                          andReason:(NSString *)reason {
    Appointment *appt = [[Appointment alloc] initWithName:providerName
                                                specialty:specialty
                                                visitType:visitType
                                                     date:date
                                                andReason:reason];
    return appt;
}

    
- (instancetype)initWithName:(NSString *)providerName
                   specialty:(NSString *)specialty
                   visitType:(VisitType)visitType
                        date:(NSDate *)date
                   andReason:(NSString *)reason {
    self = [super init];
    if (self != nil) {
        self.providerName = providerName;
        self.providerSpecialty = specialty;
        self.visitType = visitType;
        self.apptDate = date;
        self.reasonForVisit = reason;
    }
    return self;
}
  
    
-(BOOL)isPast {
    NSTimeInterval interval = [self.apptDate timeIntervalSinceNow];
    if (interval < 0) {
        return YES;
    }
    return NO;
}
   
    
-(BOOL)isUpcoming {
    BOOL isPast = [self isPast];
    return !isPast;
}
    

@end
