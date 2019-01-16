//
//  ProviderTypeCell.h
//  MDLIVE New Dashboard
//
//  Created by David Hoy on 12/31/18.
//  Copyright © 2018 David Hoy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ProviderTypeCellProtocol <NSObject>
@end

@interface ProviderTypeCell : UITableViewCell

@property (nonatomic,retain) id<ProviderTypeCellProtocol> delegate;

@property (nonatomic, strong) IBOutlet UIView *containerView;
@property (nonatomic, strong) IBOutlet UIImageView *radioButton;
@property (nonatomic, strong) IBOutlet UILabel *providerTypeLabel;
@property (nonatomic, strong) IBOutlet UILabel *priceLabel;
@property (nonatomic, strong) IBOutlet UILabel *priceBasisLabel;
@end

NS_ASSUME_NONNULL_END
