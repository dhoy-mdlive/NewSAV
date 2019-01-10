//
//  UIView+IBDesignable.h
//  MDLIVE New Dashboard
//
//  Created by David Hoy on 12/28/18.
//  Copyright © 2018 David Hoy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    LINE_POSITION_TOP,
    LINE_POSITION_BOTTOM
} LINE_POSITION;

IB_DESIGNABLE
@interface UIView (IBDesignable)

@property (nonatomic, strong) IBInspectable UIColor   *borderColor;
@property (nonatomic, assign) IBInspectable NSInteger borderWidth;
@property (nonatomic, assign) IBInspectable Boolean   dashedBorder;
@property (nonatomic, assign) IBInspectable CGFloat   cornerRadius;
@property (nonatomic, assign) IBInspectable NSInteger dropShadowDepth;
@property (nonatomic, strong) IBInspectable UIColor   *dropShadowColor;

- (void)addLineAtPosition:(LINE_POSITION)position
                withColor:(UIColor *)color
                lineWidth:(CGFloat)width;

- (UITableView *)parentTableView;

- (UIViewController *) firstAvailableUIViewController;
- (id) traverseResponderChainForUIViewController;


@end


NS_ASSUME_NONNULL_END
