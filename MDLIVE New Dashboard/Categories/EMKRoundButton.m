//
//  EMKRoundButton.m
//  MDLEmbedKitCoreUI
//
//  Created by Guanglei Liu on 12/16/16.
//  Copyright © 2016 mdlive. All rights reserved.
//

#import "EMKRoundButton.h"
#import <QuartzCore/QuartzCore.h>
//#import <MDLEmbedKitCoreUI/UIColor+MDLive.h>
//#import <MDLEmbedKitCoreUI/MDLWhiteLableColorManager.h>

@interface EMKRoundButton ()
@property (strong, nonatomic) CAShapeLayer *shadowLayer;
@end
@implementation EMKRoundButton

- (void)drawRect:(CGRect)rect {
    [self setUp];
}

- (void)prepareForInterfaceBuilder {
    [self setUp];
}
-(void)setBackColor:(UIColor *)backColor{
    _backColor = backColor;
    self.shadowLayer.fillColor = backColor.CGColor;
    [self setNeedsDisplay];
}
- (void)setUp{
//    self.layer.cornerRadius = self.frame.size.height/2.0;
    // Check if the backColor is initialized or not

    //[self setTitleColor: self.titleColor ?: [UIColor MDLiveStandardColor:@"primaryButtonFilledForeground"] forState:UIControlStateNormal];
    if (self.hasDropShadow) {
        [self setBackgroundColor: [UIColor clearColor]];
        self.clipsToBounds = NO;
        self.layer.cornerRadius = 0;
        [self setDropShadowWithRound];
        
    }else{
        //[self setBackgroundColor: self.backColor ?: [MDLWhiteLableColorManager buttonThemeColor]];
        self.layer.cornerRadius = self.frame.size.height/2.0;
        self.clipsToBounds = YES;
    }
    
    self.alpha = self.enabled ? 1 : 0.5f;
    
}
-(void)setHasDropShadow:(BOOL)hasDropShadow{
    _hasDropShadow = hasDropShadow;
    if (_hasDropShadow) {
        [self setNeedsLayout];
    }
}
-(void)setDropShadowWithRound{
    if (!self.shadowLayer) {
        
        self.shadowLayer = [[CAShapeLayer alloc] init];
        self.shadowLayer.path = [[UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:self.frame.size.height/2.0] CGPath];
        
        //self.shadowLayer.fillColor = self.backColor ? [self.backColor CGColor] : [[UIColor MDLiveStandardColor:@"basicThemedElement"] CGColor];
        self.shadowLayer.shadowColor = [[UIColor colorWithRed:0 green:0 blue:0 alpha:0.15] CGColor];
        self.shadowLayer.shadowPath = self.shadowLayer.path;
        self.shadowLayer.shadowOffset = CGSizeMake(0.0,2.0);
        self.shadowLayer.shadowOpacity = 1.0;
        self.shadowLayer.shadowRadius = 4;
        [self.layer insertSublayer:self.shadowLayer below:nil];
    }
}


-(void)setBorderColor:(UIColor *)borderColor{
    _borderColor = borderColor;
    self.layer.borderColor = _borderColor.CGColor;
}

-(void)setBorderWidth:(CGFloat)borderWidth{
    _borderWidth = borderWidth;
    self.layer.borderWidth = _borderWidth;
}

-(void)setTitleColor:(UIColor *)titleColor{
    _titleColor = titleColor;
    [self setTitleColor: _titleColor forState:UIControlStateNormal];
}

#if 0
- (void)setupUITheme {
    [self setBackColor:[UIColor MDLiveStandardColor:@"primaryButtonEmptyBackground"]];
    [self setBorderColor:[UIColor MDLiveStandardColor:@"primaryButtonEmptyBorder"]];
    [self setBorderWidth:2.0f];
    [self setTitleColor:[UIColor MDLiveStandardColor:@"primaryButtonEmptyTitle"]];
}


- (void)setLightBackgroundButton {
    self.userInteractionEnabled = YES;
    [self setBackgroundColor:[UIColor clearColor]];
    [self setBackColor:[UIColor clearColor]];
    [self setBorderColor:[MDLWhiteLableColorManager lightButtonBorderColor]];
    [self setBorderWidth:2.0f];
    [self setTitleColor:[MDLWhiteLableColorManager lightButtonTitleColor]];
}

- (void)setSolidButtonColorWithBackground:(UIColor *)bgColor text:(UIColor *)tintColor{
    self.userInteractionEnabled = YES;
    [self setBackgroundColor:[UIColor clearColor]];
    [self setBorderColor:bgColor];
    [self setTitleColor:tintColor];
    [self setTintColor:tintColor];
    [self setBackgroundColor:bgColor];
}
- (void)setDarkBackgroundButton {
    self.userInteractionEnabled = YES;
    [self setBackgroundColor:[UIColor clearColor]];
    [self setBorderColor:[MDLWhiteLableColorManager darkButtonBorderColor]];
    [self setTitleColor:[MDLWhiteLableColorManager darkButtonTitleColor]];
    [self setTintColor:[MDLWhiteLableColorManager darkButtonTitleColor]];
    [self setBackgroundColor:[MDLWhiteLableColorManager darkButtonBackgroundColor]];
}
#endif

- (void)setAllWhiteButton {
    self.userInteractionEnabled = YES;
    [self setBackgroundColor:[UIColor clearColor]];
    [self setBorderColor:[UIColor whiteColor]];
    [self setBorderWidth:2.0f];
    [self setTitleColor:[UIColor whiteColor]];
    [self setTintColor:[UIColor whiteColor]];
}

- (void)setButtonInvisible {
    self.userInteractionEnabled = NO;
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTitleColor:[UIColor clearColor]];
    [self setBorderColor:[UIColor clearColor]];
}
@end
