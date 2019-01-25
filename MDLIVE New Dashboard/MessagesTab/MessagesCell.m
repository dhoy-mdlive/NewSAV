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

@implementation MessagesCell

@synthesize delegate;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [_envelopeImage addBadge:@"0" withColor:[UIColor colorFromHexString:@"#63A0FA"]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
