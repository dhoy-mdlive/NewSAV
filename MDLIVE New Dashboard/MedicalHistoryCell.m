//
//  MedicalHistoryCell.m
//  MDLIVE New Dashboard
//
//  Created by David Hoy on 1/3/19.
//  Copyright © 2019 David Hoy. All rights reserved.
//

#import "MedicalHistoryCell.h"

@implementation MedicalHistoryCell

@synthesize delegate;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}
- (IBAction)buttonTapped:(id)sender {
    NSLog(@"%s: sender=%@", __func__, sender);
}

- (IBAction)allergySegmentedControlChanged:(UISegmentedControl *)sender {
    if (sender.selectedSegmentIndex == 0) {
        _allergyTextField.enabled = TRUE;
    }
}

- (IBAction)allergyTextFieldChanged:(UITextField *)sender {
    if (sender.text.length > 0) {
        _allergyAddButton.enabled = YES;
    }
    else {
        _allergyAddButton.enabled = NO;
    }
}

- (IBAction)allergyAddButtonTapped:(EMKRoundButton *)sender {
    NSLog(@"Adding allergy %@", _allergyTextField.text);
}


- (IBAction)healthConditionSegmentedControlChanged:(UISegmentedControl *)sender {
    if (sender.selectedSegmentIndex == 0) {
        _healthConditionTextField.enabled = TRUE;
    }
}

- (IBAction)healthConditionTextFieldChanged:(UITextField *)sender {
    if (sender.text.length > 0) {
        _healthConditionAddButton.enabled = YES;
    }
    else {
        _healthConditionAddButton.enabled = NO;
    }
     
}

- (IBAction)healthConditionAddButtonTapped:(EMKRoundButton *)sender {
    NSLog(@"Adding health condition %@", _allergyTextField.text);
}

@end
