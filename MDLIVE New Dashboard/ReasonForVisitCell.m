//
//  ReasonForVisitCell.m
//  MDLIVE New Dashboard
//
//  Created by David Hoy on 1/2/19.
//  Copyright © 2019 David Hoy. All rights reserved.
//

#import "ReasonForVisitCell.h"
#import "EMKRoundButton.h"

@implementation ReasonForVisitCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (IBAction)symptomTextFieldChanged:(UITextField *)sender {
    NSLog(@"%s: sender=%@", __func__, sender);
}


- (IBAction)uploadPhotoTapped:(UIButton *)sender {
    NSLog(@"%s: sender=%@", __func__, sender);
}




@end
