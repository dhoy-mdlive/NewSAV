//
//  YourAppointmentCell.h
//  MDLIVE New Dashboard
//
//  Created by David Hoy on 1/4/19.
//  Copyright © 2019 David Hoy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol YourAppointmentCellProtocol <NSObject>
- (void)nextButtonEnabled:(Boolean)state;
@end

@interface YourAppointmentCell : UITableViewCell <UITextFieldDelegate>

@property (nonatomic,retain) id<YourAppointmentCellProtocol> delegate;

@property (strong, nonatomic) IBOutlet UIView *containerView;
@property (strong, nonatomic) IBOutlet UITextField *phoneNumberTextField;
@property (strong, nonatomic) IBOutlet UIImageView *videoImageView;
@property (strong, nonatomic) IBOutlet UIImageView *phoneImageView;

@end

NS_ASSUME_NONNULL_END
