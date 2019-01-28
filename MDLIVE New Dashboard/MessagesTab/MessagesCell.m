//
//  MessagesCell.m
//  MDLIVE New Dashboard
//
//  Created by David Hoy on 12/31/18.
//  Copyright © 2018 David Hoy. All rights reserved.
//

#import "MessagesCell.h"
#import "UIImageView+badge.h"
#import "UIColor+mdl.h"
#import "MessagesMock.h"

@implementation MessagesCell

@synthesize delegate;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    MessagesMock *mock = [MessagesMock sharedInstance];
    NSArray *messages = [mock unreadMessages];
    
    if (messages.count > 0) {
        NSString *badge = [NSString stringWithFormat:@"%d", (int)messages.count];
        [_envelopeImage addBadge:badge withColor:[UIColor redColor]];
        NSString *text = [NSString stringWithFormat:@"You have %d unread messages.", (int)messages.count];
        self.messageLabel.text = text;
    }
    else {
        [_envelopeImage addBadge:@"0" withColor:[UIColor mdliveTeal]];
        self.messageLabel.text = @"You have no unread messages.";
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
