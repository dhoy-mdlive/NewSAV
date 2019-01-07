//
//  YourAppointmentCell.h
//  MDLIVE New Dashboard
//
//  Created by David Hoy on 1/4/19.
//  Copyright © 2019 David Hoy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YourAppointmentCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIView *containerView;
@property (strong, nonatomic) IBOutlet UITextField *phoneNumberTextField;

@end

NS_ASSUME_NONNULL_END
