//
//  UICheckboxButton.m
//  MDLIVE New Dashboard
//
//  Created by David Hoy on 1/18/19.
//  Copyright © 2019 David Hoy. All rights reserved.
//

#import "UICheckboxButton.h"


@interface UICheckboxButton()

@property(nonatomic,strong)IBInspectable UIImage* checkedStateImage;
@property(nonatomic,strong)IBInspectable UIImage* uncheckedStateImage;

@end


@implementation UICheckboxButton


-(id)init {
    self = [super init];
    if (self) {
        [self addTarget:self action:@selector(switchState) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}


-(id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addTarget:self action:@selector(switchState) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}


-(id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self addTarget:self action:@selector(switchState) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}


-(void)setIsChecked:(BOOL)isChecked
{
    _isChecked = isChecked;
    if(isChecked) {
        [self setImage:self.checkedStateImage forState:UIControlStateNormal];
    }
    else {
        [self setImage:self.uncheckedStateImage forState:UIControlStateNormal];
    }
}


-(void)switchState {
    self.isChecked = !self.isChecked;
    [self sendActionsForControlEvents:UIControlEventValueChanged];
}


@end
