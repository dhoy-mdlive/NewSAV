//
//  ScheduleVisitController.h
//  MDLIVE New Dashboard
//
//  Created by David Hoy on 12/28/18.
//  Copyright © 2018 David Hoy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ScheduleVisitController : UIViewController <CLLocationManagerDelegate>

@property (strong, nonatomic) IBOutlet UILabel *scheduleVisitPageTitleLabel;
@property (strong, nonatomic) IBOutlet UIPageControl *scheduleVisitPageControl;
@property (strong, nonatomic) IBOutlet UIButton *cancelButton;
@property (strong, nonatomic) IBOutlet UIButton *backButton;
@property (strong, nonatomic) IBOutlet UIButton *nextButton;
@property (strong, nonatomic) IBOutlet UIView *contentView;

@property (nonatomic, strong) CLLocation *currentLocation;


@end

NS_ASSUME_NONNULL_END
