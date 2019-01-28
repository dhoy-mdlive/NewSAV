//
//  Appointment.h
//  MDLIVE New Dashboard
//
//  Created by David Hoy on 1/28/19.
//  Copyright © 2019 David Hoy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, VisitType) {
    VisitTypePhone = 0,
    VisitTypeVideo
};

@interface Appointment : NSObject
    
    @property (nonatomic,strong) NSUUID    *apptUUID;
    @property (nonatomic,strong) NSString  *providerName;
    @property (nonatomic,strong) NSString  *providerSpecialty;
    @property (nonatomic,assign) VisitType visitType;
    @property (nonatomic,strong) NSDate    *apptDate;
    @property (nonatomic,strong) NSString  *reasonForVisit;
    @property (nonatomic,assign) BOOL      canceled;
    @property (nonatomic,strong) NSData    *consulationSummary;
    @property (nonatomic,strong) NSData    *transactionReceipt;
    @property (nonatomic,strong) NSData    *claimsForm;
    
    
+ (instancetype)appointmentWithName:(NSString *)providerName
                          specialty:(NSString *)specialty
                          visitType:(VisitType)visitType
                               date:(NSDate *)date
                          andReason:(NSString *)reason;
    
- (instancetype)initWithName:(NSString *)providerName
                   specialty:(NSString *)specialty
                   visitType:(VisitType)visitType
                        date:(NSDate *)date
                   andReason:(NSString *)reason;
    
- (BOOL)isPast;
- (BOOL)isUpcoming;
    
@end

NS_ASSUME_NONNULL_END
