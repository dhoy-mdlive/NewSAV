//
//  EMKRoundButton.h
//  MDLEmbedKitCoreUI
//
//  Created by Guanglei Liu on 12/16/16.
//  Copyright © 2016 mdlive. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE

@interface EMKRoundButton : UIButton

@property (nonatomic, assign) CGFloat borderWidth;
@property (nonatomic, strong) UIColor* borderColor;
@property (nonatomic, strong) UIColor* titleColor;
@property (nonatomic, strong) UIColor* backColor;
@property (nonatomic, assign) BOOL hasDropShadow;

//- (void)setupUITheme;
//- (void)setLightBackgroundButton;
//- (void)setDarkBackgroundButton;
//- (void)setButtonInvisible;
//- (void)setAllWhiteButton;
//- (void)setSolidButtonColorWithBackground:(UIColor *)bgColor text:(UIColor *)tintColor;
@end
