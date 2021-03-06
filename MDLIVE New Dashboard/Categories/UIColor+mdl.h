//
//  UIColor+mdl.h
//  MDLIVE New Dashboard
//
//  Created by David Hoy on 12/31/18.
//  Copyright © 2018 David Hoy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (mdl)
+ (UIColor *)colorFromHexString:(NSString *)hexString;
+ (UIColor *)mdliveTeal;
@end

NS_ASSUME_NONNULL_END
