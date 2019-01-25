//
//  ApptHeaderCell.m
//  MDLIVE New Dashboard
//
//  Created by David Hoy on 1/25/19.
//  Copyright © 2019 David Hoy. All rights reserved.
//

#import "ApptHeaderCell.h"

@implementation ApptHeaderCell

@synthesize delegate;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (IBAction)segmentedControlChanged:(id)sender {
    if (_selectApptTypeSegmentedControl.selectedSegmentIndex == 0) {
        [self.delegate setApptType:ApptTypeUpcoming];
    }
    else {
        [self.delegate setApptType:ApptTypePast];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
