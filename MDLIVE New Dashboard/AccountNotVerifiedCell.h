//
//  AccountNotVerifiedCell.h
//  MDLIVE New Dashboard
//
//  Created by David Hoy on 1/2/19.
//  Copyright © 2019 David Hoy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol AccountNotVerifiedCellProtocol <NSObject>
- (void)resendConfirmationEmail;
@end

@interface AccountNotVerifiedCell : UITableViewCell

@property (retain,nonatomic) id<AccountNotVerifiedCellProtocol> delegate;
@property (strong, nonatomic) IBOutlet UIImageView *envelopeImageView;

@end

NS_ASSUME_NONNULL_END
