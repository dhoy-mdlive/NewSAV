//
//  PaymentCell.h
//  MDLIVE New Dashboard
//
//  Created by David Hoy on 1/8/19.
//  Copyright © 2019 David Hoy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+IBDesignable.h"
#import "EMKRoundButton.h"

NS_ASSUME_NONNULL_BEGIN

IB_DESIGNABLE
@interface PaymentCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *visitTotalLabel;
@property (strong, nonatomic) IBOutlet UIImageView *creditCardImageView;
@property (strong, nonatomic) IBOutlet UILabel *cardEndingLabel;
@property (strong, nonatomic) IBOutlet UILabel *cardExpirationLabel;
@property (strong, nonatomic) IBOutlet UIImageView *deleteImage;
@property (strong, nonatomic) IBOutlet UITextField *offerCodeTextView;
@property (strong, nonatomic) IBOutlet EMKRoundButton *addOfferCodeButton;

@end

NS_ASSUME_NONNULL_END
