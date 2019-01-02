//
//  MessagesCell.h
//  MDLIVE New Dashboard
//
//  Created by David Hoy on 12/31/18.
//  Copyright © 2018 David Hoy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MessagesCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UIImageView *envelopeImage;
@property (nonatomic, strong) IBOutlet UILabel *messageLabel;
@end

NS_ASSUME_NONNULL_END
