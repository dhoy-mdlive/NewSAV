//
//  ContainerView.m
//  MDLIVE New Dashboard
//
//  Created by David Hoy on 1/9/19.
//  Copyright © 2019 David Hoy. All rights reserved.
//

#import "ContainerView.h"

@implementation ContainerView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
/*
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    // UIView will be "transparent" for touch events if we return NO
    //NSLog(@"%s: point=(%.1f,%.1f), event=%@", __func__, point.x, point.y, event);
    BOOL ret = [super pointInside:point withEvent:event];
    return ret;
}


- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    //NSLog(@"%s: point=(%.1f,%.1f), event=%@", __func__, point.x, point.y, event);
    UIView *hitView = [super hitTest:point withEvent:event];
    if (hitView == self) {
        return nil;
    }
    return hitView;
}
 */
@end
