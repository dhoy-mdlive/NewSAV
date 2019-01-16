//
//  MedicalHistoryCell.h
//  MDLIVE New Dashboard
//
//  Created by David Hoy on 1/3/19.
//  Copyright © 2019 David Hoy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EMKRoundButton.h"

NS_ASSUME_NONNULL_BEGIN

@protocol MedicalHistoryCellProtocol <NSObject>
@end

@interface MedicalHistoryCell : UITableViewCell

@property (nonatomic,retain) id<MedicalHistoryCellProtocol> delegate;

@property (strong, nonatomic) IBOutlet UIView *containerView;
@property (strong, nonatomic) IBOutlet UISegmentedControl *allergySegmentedControl;
@property (strong, nonatomic) IBOutlet UITextField *allergyTextField;
@property (strong, nonatomic) IBOutlet EMKRoundButton *allergyAddButton;
@property (strong, nonatomic) IBOutlet UISegmentedControl *healthConditionSegmentedControl;
@property (strong, nonatomic) IBOutlet UITextField *healthConditionTextField;
@property (strong, nonatomic) IBOutlet EMKRoundButton *healthConditionAddButton;

@end

NS_ASSUME_NONNULL_END
