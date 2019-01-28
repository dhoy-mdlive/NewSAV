//
//  MessagesMock.h
//  MDLIVE New Dashboard
//
//  Created by David Hoy on 1/28/19.
//  Copyright © 2019 David Hoy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Message.h"

NS_ASSUME_NONNULL_BEGIN

@interface MessagesMock : NSObject
    
+ (instancetype)sharedInstance;
- (NSArray <Message *> *)messagesForPatient:(NSString *)patientId;
- (NSArray <Message *> *)unreadMessages;

@end

NS_ASSUME_NONNULL_END
