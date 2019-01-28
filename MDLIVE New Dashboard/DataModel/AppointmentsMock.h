//
//  AppointmentsMock.h
//  MDLIVE New Dashboard
//
//  Created by David Hoy on 1/28/19.
//  Copyright © 2019 David Hoy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Appointment.h"

NS_ASSUME_NONNULL_BEGIN

@interface AppointmentsMock : NSObject
    
+ (instancetype)sharedInstance;
- (NSArray <Appointment *> *)appointmentsForPatient:(NSString *)patientId;
- (NSArray <Appointment *> *)appointmentsBeforeDate:(nullable NSDate *)date;
- (NSArray <Appointment *> *)appointmentsAfterDate:(nullable NSDate *)date;

@end

NS_ASSUME_NONNULL_END
