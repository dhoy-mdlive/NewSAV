//
//  UIView+IBDesignable.m
//  MDLIVE New Dashboard
//
//  Created by David Hoy on 12/28/18.
//  Copyright © 2018 David Hoy. All rights reserved.
//

#import "UIView+IBDesignable.h"

@implementation UIView (IBDesignable)

-(UIColor *)borderColor{
    UIColor *color = [UIColor colorWithCGColor:self.layer.borderColor];
    return color;
}

-(void)setBorderColor:(UIColor *)borderColor{
    self.layer.borderColor = borderColor.CGColor;
}

-(NSInteger)borderWidth {
    return self.layer.borderWidth;
}

-(void)setBorderWidth:(NSInteger)borderWidth {
    self.layer.borderWidth = borderWidth;
}

-(CGFloat)cornerRadius {
    return self.layer.cornerRadius;
}

-(void)setCornerRadius:(CGFloat)cornerRadius {
    self.layer.cornerRadius = cornerRadius;
}

-(UIColor *)dropShadowColor {
    return [UIColor colorWithCGColor:self.layer.shadowColor];
}

-(void)setDropShadowColor:(UIColor *)dropShadowColor{
    self.layer.shadowColor = dropShadowColor.CGColor;
}

-(NSInteger)dropShadowDepth {
    return self.layer.shadowOffset.height;
}

-(void)setDropShadowDepth:(NSInteger)dropShadowDepth {
    self.layer.shadowOffset = CGSizeMake(dropShadowDepth, dropShadowDepth);
    if (dropShadowDepth > 0) {
        self.layer.shadowOpacity = 1.0;
        self.layer.shadowRadius  = dropShadowDepth;
    }
}

#if 1
- (Boolean)dashedBorder {
    return self.dashedBorder;
}

- (void)setDashedBorder:(Boolean)dashedBorder {
    if (dashedBorder) {
        CAShapeLayer *borderLayer = [CAShapeLayer layer];
        borderLayer.strokeColor = self.layer.borderColor;
        borderLayer.fillColor = nil;
        borderLayer.lineDashPattern = @[@2, @2];
        borderLayer.frame = self.bounds;
        borderLayer.path = [UIBezierPath bezierPathWithRect:self.bounds].CGPath;
        [self.layer addSublayer:borderLayer];
    }
}
#endif


- (void)addLineAtPosition:(LINE_POSITION)position
                withColor:(UIColor *)color
                lineWidth:(CGFloat)width {
    // Add line
    UIView *lineView = [[UIView alloc] init];
    [lineView setBackgroundColor:color];
    [lineView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self addSubview:lineView];
    
    NSDictionary *metrics = @{@"width" : [NSNumber numberWithFloat:width]};
    NSDictionary *views = @{@"lineView" : lineView};
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[lineView]|" options: 0 metrics:metrics views:views]];
    
    switch (position) {
        case LINE_POSITION_TOP:
            [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[lineView(width)]" options: 0 metrics:metrics views:views]];
            break;
            
        case LINE_POSITION_BOTTOM:
            [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[lineView(width)]|" options: 0 metrics:metrics views:views]];
            break;
        default: break;
    }
}


-(UITableView *) parentTableView {
    // iterate up the view hierarchy to find the table containing this cell/view
    UIView *view = self.superview;
    while(view != nil) {
        if([view isKindOfClass:[UITableView class]]) {
            return (UITableView *)view;
        }
        view = view.superview;
    }
    return nil; // this view is not within a tableView
}

@end
