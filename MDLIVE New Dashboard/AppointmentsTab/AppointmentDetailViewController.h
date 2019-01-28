//
//  AppointmentDetailViewController.h
//  MDLIVE New Dashboard
//
//  Created by David Hoy on 1/25/19.
//  Copyright © 2019 David Hoy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UpcomingApptDetailCell.h"
#import "PastApptDetailCell.h"
#import "Appointment.h"

NS_ASSUME_NONNULL_BEGIN

@interface AppointmentDetailViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UpcomingApptDetailCellProtocol>
    
@property (nonatomic,strong) Appointment *appointment;

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UIButton *backButton;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

NS_ASSUME_NONNULL_END
