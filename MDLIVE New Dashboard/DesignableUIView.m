//
//  DesignableUIView.m
//  MDLIVE New Dashboard
//
//  Created by David Hoy on 12/26/18.
//  Copyright © 2018 David Hoy. All rights reserved.
//

#import "DesignableUIView.h"


@interface DesignableUIView ()
@end


@implementation DesignableUIView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.borderWidth     = 0;
        self.borderColor     = [UIColor clearColor];
        self.cornerRadius    = 0;
        self.dropShadowDepth = 0;
        self.dropShadowColor = [UIColor clearColor];
        [self customInit];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self customInit];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    [self customInit];
}

- (void)setNeedsLayout {
    [super setNeedsLayout];
    [self setNeedsDisplay];
}

- (void)prepareForInterfaceBuilder {
    [self customInit];
}

- (void)customInit {
    self.layer.borderWidth = self.borderWidth;
    self.layer.borderColor = self.borderColor.CGColor;
    
    self.layer.cornerRadius = self.cornerRadius;
    if (self.cornerRadius > 0) {
        self.layer.masksToBounds = YES;
    }
    
    if (self.dropShadowDepth > 0) {
        CALayer *layer = [[CALayer alloc] init];
        layer.cornerRadius = self.cornerRadius;
        layer.masksToBounds = NO;
        layer.shadowOffset  = CGSizeMake(self.dropShadowDepth, self.dropShadowDepth);
        layer.shadowColor   = self.dropShadowColor.CGColor;
        layer.shadowRadius  = self.cornerRadius;
        layer.shadowOpacity = 1;
        layer.shadowPath    = [[UIBezierPath bezierPathWithRoundedRect:layer.bounds cornerRadius:layer.cornerRadius] CGPath];
        [self.layer insertSublayer:layer below:self.layer];
    }
}

@end
