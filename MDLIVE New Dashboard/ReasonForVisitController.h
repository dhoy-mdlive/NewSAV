//
//  ReasonForVisitController.h
//  MDLIVE New Dashboard
//
//  Created by David Hoy on 1/2/19.
//  Copyright © 2019 David Hoy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ReasonForVisitCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface ReasonForVisitController : UIViewController  <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *reasonForVisitTableView;

@end

NS_ASSUME_NONNULL_END