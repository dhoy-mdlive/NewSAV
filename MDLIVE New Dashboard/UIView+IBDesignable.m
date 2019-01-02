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

@end
