//
//  PharmacyDetailCell.m
//  MDLIVE New Dashboard
//
//  Created by David Hoy on 1/17/19.
//  Copyright © 2019 David Hoy. All rights reserved.
//

#import "PharmacyDetailCell.h"

@implementation PharmacyDetailCell

@synthesize delegate;


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (IBAction)phoneButtonTapped:(id)sender {
    NSString *phoneNumber = [_phoneButton.titleLabel.text stringByReplacingOccurrencesOfString:@" "
                                                                                    withString:@""];
    NSString *telStr = [NSString stringWithFormat:@"tel:%@", phoneNumber];
    NSURL *telURL = [NSURL URLWithString:telStr];
    
    UIApplication *app = [UIApplication sharedApplication];
    if ([app canOpenURL:telURL]) {
        [app openURL:telURL options:@{} completionHandler:^(BOOL success) {
            NSLog(@"Open %@: %d", telURL, success);
        }];
    }
}
@end
