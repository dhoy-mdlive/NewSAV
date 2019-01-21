//
//  UITextField+dismissNumberKeypad.m
//  MDLIVE New Dashboard
//
//  Created by David Hoy on 1/21/19.
//  Copyright © 2019 David Hoy. All rights reserved.
//

#import "UITextField+dismissNumberKeypad.h"

@implementation UITextField (dismissNumberKeypad)

- (void)dismissTapped {
    [self resignFirstResponder];
}

-(void)addDismissToolbar {
    UIToolbar *toolbar = [UIToolbar new];
    toolbar.barStyle = UIBarStyleDefault;
    UIBarButtonItem *dismissItem = [[UIBarButtonItem alloc] initWithTitle:@"Dismiss"
                                                                    style:UIBarButtonItemStyleDone
                                                                   target:self
                                                                   action:@selector(dismissTapped)];
    toolbar.items = @[ dismissItem ];
    [toolbar sizeToFit];
    self.inputAccessoryView = toolbar;
}

@end
