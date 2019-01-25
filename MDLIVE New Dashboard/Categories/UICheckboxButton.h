//
//  UICheckboxButton.h
//  MDLIVE New Dashboard
//
//  Created by David Hoy on 1/18/19.
//  Copyright © 2019 David Hoy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

IB_DESIGNABLE

@interface UICheckboxButton : UIButton

@property(nonatomic,assign)IBInspectable BOOL isChecked;

@end

NS_ASSUME_NONNULL_END
