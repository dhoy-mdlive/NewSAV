//
//  ReasonForVisitCell.h
//  MDLIVE New Dashboard
//
//  Created by David Hoy on 1/2/19.
//  Copyright © 2019 David Hoy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ReasonForVisitCell : UITableViewCell

@property (nonatomic,strong) IBOutlet UITextField *symptomTextField;
@property (nonatomic,strong) IBOutlet UIImageView *symptopImageView;
@property (nonatomic,strong) IBOutlet UIButton *uploadPhotoButton;

@end

NS_ASSUME_NONNULL_END
