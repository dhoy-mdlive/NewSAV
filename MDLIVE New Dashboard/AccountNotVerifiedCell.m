//
//  AccountNotVerifiedCell.m
//  MDLIVE New Dashboard
//
//  Created by David Hoy on 1/2/19.
//  Copyright © 2019 David Hoy. All rights reserved.
//

#import "AccountNotVerifiedCell.h"
#import "UIImageView+badge.h"

@implementation AccountNotVerifiedCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    [_envelopeImageView addBadge:@"!" withColor:[UIColor redColor]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)resendEmailButtonTapped:(UIButton *)sender {
    NSLog(@"%s: sender=%@", __func__, sender);
}

@end
