//
//  PharmacyInfoCell.m
//  MDLIVE New Dashboard
//
//  Created by David Hoy on 1/17/19.
//  Copyright © 2019 David Hoy. All rights reserved.
//

#import "PharmacyInfoCell.h"

@implementation PharmacyInfoCell

@synthesize delegate;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)searchButtonTapped:(id)sender {
    [self.delegate searchForPharmacy];
}

@end
