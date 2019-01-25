//
//  MessagesViewController.h
//  MDLIVE New Dashboard
//
//  Created by David Hoy on 1/2/19.
//  Copyright © 2019 David Hoy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MessagesCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface MessagesViewController : UIViewController  <UITableViewDelegate, UITableViewDataSource, MessagesCellProtocol>

@end

NS_ASSUME_NONNULL_END
