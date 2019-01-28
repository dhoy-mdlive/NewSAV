//
//  PastApptDetailCell.m
//  MDLIVE New Dashboard
//
//  Created by David Hoy on 1/25/19.
//  Copyright © 2019 David Hoy. All rights reserved.
//

#import "PastApptDetailCell.h"
#import "UIColor+mdl.h"

@implementation PastApptDetailCell

@synthesize delegate;


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)sendMessageButtonTapped:(id)sender {
    
    __weak __typeof(self)weakSelf = self;
    NSString *title = @"Are you sure you want to cancel your appointment?";
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:nil
                                                                   message:title
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    NSMutableAttributedString *attrTitle = [[NSMutableAttributedString alloc] initWithString:title];
    [attrTitle addAttribute:NSFontAttributeName
                    value:[UIFont fontWithName:@"Montserrat" size:17.0]
                  range:NSMakeRange(0, title.length)];
    [alert setValue:attrTitle forKey:@"attributedMessage"];
    
    alert.view.tintColor = [UIColor mdliveTeal];
    
    UIAlertAction* noAction = [UIAlertAction actionWithTitle:@"NO"
                                                          style:UIAlertActionStyleCancel
                                                        handler:^(UIAlertAction * action) {
                                                            
                                                        }];
    UIAlertAction* yesAction  = [UIAlertAction actionWithTitle:@"YES"
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction * _Nonnull action) {
                                                          [weakSelf.delegate cancelAppointment];
                                                      }];
    [alert addAction:noAction];
    [alert addAction:yesAction];
    [self.delegate presentAlertController:alert animated:YES completion:nil];
}
    
@end
