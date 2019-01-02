//
//  DesignableUIView.h
//  MDLIVE New Dashboard
//
//  Created by David Hoy on 12/26/18.
//  Copyright © 2018 David Hoy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

IB_DESIGNABLE

@interface DesignableUIView : UIView

@property (nonatomic) IBInspectable UIColor   *borderColor;
@property (nonatomic) IBInspectable NSInteger borderWidth;
@property (nonatomic) IBInspectable CGFloat   cornerRadius;
@property (nonatomic) IBInspectable NSInteger dropShadowDepth;
@property (nonatomic) IBInspectable UIColor   *dropShadowColor;

@end

NS_ASSUME_NONNULL_END
