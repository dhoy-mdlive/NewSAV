//
//  Message.m
//  MDLIVE New Dashboard
//
//  Created by David Hoy on 1/28/19.
//  Copyright © 2019 David Hoy. All rights reserved.
//

#import "Message.h"

@implementation Message

@synthesize UUID;
@synthesize sender;
@synthesize text;
@synthesize read;
    
+ (instancetype)messageWithSender:(NSString *)sender
                          andText:(NSString *)text; {
    Message *message = [[Message alloc] initWithSender:sender
                                               andText:text];
    return message;
}

    
- (instancetype)initWithSender:(NSString *)sender
                       andText:(NSString *)text; {
    self = [super init];
    if (self != nil) {
        self.sender = sender;
        self.text = text;
        self.read = NO;
    }
    return self;
}
    

@end
