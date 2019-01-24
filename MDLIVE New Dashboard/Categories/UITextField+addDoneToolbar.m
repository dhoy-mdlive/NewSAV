//
//  UITextField+addDoneToolbar.m
//  MDLIVE New Dashboard
//
//  Created by David Hoy on 1/21/19.
//  Copyright © 2019 David Hoy. All rights reserved.
//

#import "UITextField+addDoneToolbar.h"

@implementation UITextField (addDoneToolbar)

-(void)addDoneToolbar {
    UIBarButtonItem *done = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                                               target:self
                                                                               action:@selector(resignFirstResponder)];
    UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                               target:self
                                                                               action:nil];
    UIToolbar *toolbar = [UIToolbar new];
    toolbar.barStyle   = UIBarStyleDefault;
    toolbar.items      = @[ flexSpace, flexSpace, done ];
    [toolbar sizeToFit];
    self.inputAccessoryView = toolbar;
}

@end
