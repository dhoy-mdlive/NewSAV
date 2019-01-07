//
//  UIImageView+badge.h
//  MDLIVE New Dashboard
//
//  Created by David Hoy on 1/7/19.
//  Copyright © 2019 David Hoy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (badge)

- (void)addBadge:(NSString *)text withColor:(UIColor *)color;
- (void)removeBadge;

@end

NS_ASSUME_NONNULL_END
