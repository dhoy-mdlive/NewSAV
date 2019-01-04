//
//  MedicalHistoryController.h
//  MDLIVE New Dashboard
//
//  Created by David Hoy on 1/2/19.
//  Copyright © 2019 David Hoy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MedicalHistoryCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface MedicalHistoryController : UITableViewController  <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *medicalHistoryTableView;

@end

NS_ASSUME_NONNULL_END
