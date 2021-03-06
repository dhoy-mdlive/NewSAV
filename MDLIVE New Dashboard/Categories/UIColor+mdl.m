//
//  UIColor+mdl.m
//  MDLIVE New Dashboard
//
//  Created by David Hoy on 12/31/18.
//  Copyright © 2018 David Hoy. All rights reserved.
//

#import "UIColor+mdl.h"

@implementation UIColor (mdl)

+ (UIColor *)colorFromHexString:(NSString *)hexString {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}

+ (UIColor *)mdliveTeal {
    return [UIColor colorFromHexString:@"#56BEA5"];
}

@end
