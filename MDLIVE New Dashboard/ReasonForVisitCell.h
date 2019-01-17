//
//  ReasonForVisitCell.h
//  MDLIVE New Dashboard
//
//  Created by David Hoy on 1/2/19.
//  Copyright © 2019 David Hoy. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "ContainerView.h"

NS_ASSUME_NONNULL_BEGIN

@protocol ReasonForVisitCellProtocol <NSObject>
- (void)nextButtonEnabled:(Boolean)state;
@end

@interface ReasonForVisitCell : UITableViewCell <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic,retain) id<ReasonForVisitCellProtocol> delegate;
@property (nonatomic,strong) UIImagePickerController *imagePicker;

// Interface Builder Outlets
@property (nonatomic,strong) IBOutlet UITextField *symptomTextField;
@property (nonatomic,strong) IBOutlet UIImageView *symptomImageView;
@property (strong, nonatomic) IBOutlet UIView *containerView;
@property (nonatomic,strong) IBOutlet UIButton *uploadPhotoButton;



@end

NS_ASSUME_NONNULL_END
