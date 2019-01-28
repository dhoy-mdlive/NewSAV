//
//  Message.h
//  MDLIVE New Dashboard
//
//  Created by David Hoy on 1/28/19.
//  Copyright © 2019 David Hoy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Message : NSObject
    
@property (nonatomic,strong) NSUUID    *UUID;
@property (nonatomic,strong) NSString  *sender;
@property (nonatomic,strong) NSString  *text;
@property (nonatomic,assign) BOOL      read;
    
+ (instancetype)messageWithSender:(NSString *)sender
                          andText:(NSString *)text;
    
- (instancetype)initWithSender:(NSString *)sender
                       andText:(NSString *)text;
    
- (void)markRead;
    
@end

NS_ASSUME_NONNULL_END
