//
//  UpcomingApptDetailCell.h
//  MDLIVE New Dashboard
//
//  Created by David Hoy on 1/25/19.
//  Copyright © 2019 David Hoy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EMKRoundButton.h"

NS_ASSUME_NONNULL_BEGIN

@protocol UpcomingApptDetailCellProtocol <NSObject>
-(void)cancelAppointment;
-(void)presentAlertController:(UIAlertController *)alertController animated:(BOOL)animated completion:(void (^ __nullable)(void))completion;
@end


@interface UpcomingApptDetailCell : UITableViewCell

@property (nonatomic,strong) id<UpcomingApptDetailCellProtocol> delegate;

@property (strong, nonatomic) IBOutlet UILabel *providerNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *specialityLabel;
@property (strong, nonatomic) IBOutlet UILabel *visitTypeLabel;
@property (strong, nonatomic) IBOutlet UILabel *whenLabel;
@property (strong, nonatomic) IBOutlet UILabel *reasonLabel;
@property (strong, nonatomic) IBOutlet EMKRoundButton *cancelApptButton;

@end

NS_ASSUME_NONNULL_END
