//
//  HomeViewController.h
//  MDLIVE New Dashboard
//
//  Created by David Hoy on 12/26/18.
//  Copyright © 2018 David Hoy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EMKRoundButton.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeViewController : UIViewController  <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet EMKRoundButton *getStartedButton;

@end

NS_ASSUME_NONNULL_END
