//
//  ScheduleVisitController.h
//  MDLIVE New Dashboard
//
//  Created by David Hoy on 12/28/18.
//  Copyright © 2018 David Hoy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ScheduleVisitController : UIViewController 

@property (strong, nonatomic) IBOutlet UILabel *scheduleVisitPageTitleLabel;
@property (strong, nonatomic) IBOutlet UIPageControl *scheduleVisitPageControl;
@property (strong, nonatomic) IBOutlet UIButton *cancelButton;
@property (strong, nonatomic) IBOutlet UIButton *backButton;
@property (strong, nonatomic) IBOutlet UIButton *nextButton;
@property (strong, nonatomic) IBOutlet UIView *contentView;


@end

NS_ASSUME_NONNULL_END
