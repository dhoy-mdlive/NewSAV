//
//  UIImageView+badge.m
//  MDLIVE New Dashboard
//
//  Created by David Hoy on 1/7/19.
//  Copyright © 2019 David Hoy. All rights reserved.
//

#import "UIImageView+badge.h"
#import <M13BadgeView/M13BadgeView.h>

@implementation UIImageView (badge)

- (void)addBadge:(NSString *)text withColor:(UIColor *)color {
    CGRect frame = CGRectMake(0, 0, 24.0, 24.0);
    M13BadgeView *badgeView = [[M13BadgeView alloc] initWithFrame:frame];
    badgeView.badgeBackgroundColor = color;
    badgeView.borderColor = [UIColor whiteColor];
    badgeView.borderWidth = 2.0;
    //badgeView.font = [UIFont fontWithName:@"Montserrat-Bold" size:12.0f];
    badgeView.text = text;
    [self addSubview:badgeView];
    badgeView.alignmentShift = CGSizeMake(-2, 7);
    badgeView.horizontalAlignment = M13BadgeViewHorizontalAlignmentRight;
}


- (void)removeBadge {
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:[M13BadgeView class]]) {
            [view removeFromSuperview];
        }
    }
}

@end
