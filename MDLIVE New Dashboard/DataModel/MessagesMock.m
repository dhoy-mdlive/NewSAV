//
//  Message.m
//  MDLIVE New Dashboard
//
//  Created by David Hoy on 1/28/19.
//  Copyright © 2019 David Hoy. All rights reserved.
//

#import "MessagesMock.h"

@implementation MessagesMock {
    NSMutableArray <Message *> *_messages;
}
    
+ (instancetype)sharedInstance
{
    static MessagesMock *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[MessagesMock alloc] init];
        // Do any other initialisation stuff here
    });
    return sharedInstance;
}

    
- (instancetype)init {
    
    self = [super init];
    if (self != nil) {
        _messages = [NSMutableArray array];
        
        Message *message = [Message messageWithSender:@"Dr. Doctor"
                                              andText:@"Get thee to a nunnery"];
        [_messages addObject:message];
        
        message = [Message messageWithSender:@"Dr. Doolittle"
                                     andText:@"Talk to the animals"];
        [_messages addObject:message];
        
        message = [Message messageWithSender:@"Dr. Adams"
                                     andText:@"Do you know where your towel is?"];
        [_messages addObject:message];
    
    }
    return self;
}
   
    
- (NSArray <Message *> *)messagesForPatient:(NSString *)patientId {
    return
    _messages;
}
    
    
-(NSArray <Message *> *)unreadMessages {
    
    
    NSMutableArray *msgs = [NSMutableArray array];
    for (Message *msg in _messages) {
        if (msg.read == NO) {
            [msgs addObject:msg];
        }
    }
    return msgs;
}
    


@end
