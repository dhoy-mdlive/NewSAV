//
//  ScheduleVisitController.m
//  MDLIVE New Dashboard
//
//  Created by David Hoy on 12/28/18.
//  Copyright © 2018 David Hoy. All rights reserved.
//

#import "ScheduleVisitController.h"
#import "ReasonForVisitController.h"
#import "ProviderTypeView.h"


typedef NS_ENUM(NSInteger, ScheduleVisitPage) {
    ScheduleVisitPageProviderType = 0,
    ScheduleVisitPageReasonForVisit,
    ScheduleVisitPageMedicalHistory,
    ScheduleVisitPagePharmacyInfo,
    ScheduleVisitPageChooseDoctor,
    ScheduleVisitPageYourApointment,
    ScheduleVisitPagePayment
};


@interface ScheduleVisitController ()

@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, assign) NSInteger             pageIndx;
@property (nonatomic, strong) NSArray <NSString  *> *pageTitles;
@property (nonatomic, strong) NSArray <NSString *>  *pageVCNames;
@property (nonatomic, strong) NSMutableArray <UIViewController *> *viewControllers;
@property (nonatomic, assign) Boolean               changesMade;

@end


@implementation ScheduleVisitController

@synthesize currentLocation;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    self.pageIndx = 0;
    self.pageTitles = @[ @"Provider Type",
                         @"Reason For Visit",
                         @"Your Appointment",
                         @"Medical History",
                         @"Pharmacy Information",
                         @"Choose Doctor",
                         @"Payment" ];
    self.pageVCNames = @[ @"SelectProviderController",
                          @"ReasonForVisitController",
                          @"YourAppointmentController",
                          @"MedicalHistoryController",
                          @"PharmacyInfoController",
                          @"ChooseDoctorController",
                          @"PaymentController"];
    _viewControllers = [NSMutableArray arrayWithCapacity:_pageVCNames.count];
    
    // Add left and right navigation arrows to Back and Next buttons
    [_backButton setImage:[UIImage imageNamed:@"nav_back.png"] forState:UIControlStateNormal];
    [_backButton setImage:[UIImage imageNamed:@"nav_back_disabled.png"] forState:UIControlStateDisabled];
    [_backButton setTitle:@" Back" forState:UIControlStateNormal];
  
    _nextButton.semanticContentAttribute = UISemanticContentAttributeForceRightToLeft;
    [_nextButton setImage:[UIImage imageNamed:@"nav_next.png"] forState:UIControlStateNormal];
    [_nextButton setImage:[UIImage imageNamed:@"nav_next_disabled.png"] forState:UIControlStateDisabled];
    [_nextButton setTitle:@"Next " forState:UIControlStateNormal];
    
    self.changesMade = NO;
    [self setupPage:self.pageIndx];
    
    
    // Set up and start the location manager to get the current GPS position
    _locationManager = [[CLLocationManager alloc] init];
    _locationManager.delegate = self;
    _locationManager.distanceFilter = kCLDistanceFilterNone;
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
        [_locationManager requestWhenInUseAuthorization];
    }
    [_locationManager startUpdatingLocation];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
     //NSLog(@"%s: segue=%@, sender=%@", __func__, segue, sender);
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


- (UIViewController *)currentTopViewController {
    UIViewController *topVC = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
    while (topVC.presentedViewController) {
        topVC = topVC.presentedViewController;
    }
    return topVC;
}

- (void)setupPage:(ScheduleVisitPage)page {
    self.backButton.enabled = (page == 0) ? NO : YES;
    //self.nextButton.enabled = (page == self.pageTitles.count-1) ? NO : YES;
    _backButton.hidden = (page == 0) ? YES : NO;
    _nextButton.hidden = (page >= _pageTitles.count-1) ? YES : NO;
    
    self.scheduleVisitPageTitleLabel.text = self.pageTitles[page];
    
    self.scheduleVisitPageControl.numberOfPages = self.pageTitles.count;
    self.scheduleVisitPageControl.currentPage   = page;
    
    if (page >= _viewControllers.count) {
        NSString *vcname = _pageVCNames[page];
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"NewSAV" bundle:nil];
        UIViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:vcname];
        [_viewControllers addObject:viewController];
        [self addChildViewController:viewController];
    }
    CGRect rect = _contentView.frame;       // Use the contentView frame as a reference
    rect.origin = CGPointMake(0,0);         // pin to upper left corner of container view
    [_viewControllers[page].view setFrame:rect];
    [_contentView addSubview:_viewControllers[page].view];
    [_viewControllers[page] didMoveToParentViewController:self];
}

-(void)viewWillTransitionToSize:(CGSize)size
      withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    [coordinator animateAlongsideTransition:^(id _Nonnull context) {
        // during rotation: update our image view's bounds and centre
        //UIImageView *imageView = [self.view viewWithTag:87];
        //imageView.bounds = self.view.bounds;
        //imageView.center = self.view.center;
    } completion:^(id  _Nonnull context) {
        // after rotation
        [self setupPage:self.pageIndx];
    }];
}


#pragma mark - Button action handlers
    
- (IBAction)unwindSegueAction:(UIStoryboardSegue *)unwindSegue {
     //NSLog(@"%s: segue=%@", __func__, unwindSegue);
}
    
    
- (IBAction)cancelButton:(id)sender {
    //NSLog(@"%s: sender=%@", __func__, sender);
    
    if (self.changesMade) {
        __weak __typeof(self)weakSelf = self;
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:nil
                                                                       message:@"Are you sure you want to cancel?"
                                                                preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* leaveAction = [UIAlertAction actionWithTitle:@"Yes"
                                                              style:UIAlertActionStyleDefault
                                                            handler:^(UIAlertAction * action) {
                                                                [weakSelf performSegueWithIdentifier:@"unwindSegue" sender:nil];
                                                            }];
        UIAlertAction* stayAction  = [UIAlertAction actionWithTitle:@"No"
                                                              style:UIAlertActionStyleCancel
                                                            handler:^(UIAlertAction * _Nonnull action) {
                                                            }];
        [alert addAction:leaveAction];
        [alert addAction:stayAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
    else {
        [self performSegueWithIdentifier:@"unwindSegue" sender:nil];
    }
}

-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    //NSLog(@"%s: identifier=%@, sender=%@", __func__, identifier, sender);
    if ([identifier isEqualToString:@"unwindSegue"]) {
        return NO;
    }
    return YES;
}
    
    
- (IBAction)backButton:(id)sender {
    //NSLog(@"%s: sender=%@", __func__, sender);
    if (self.pageIndx > 0) {
        self.pageIndx--;
    }
    [self setupPage:self.pageIndx];
}
    
    
- (IBAction)nextButton:(id)sender {
    //NSLog(@"%s: sender=%@", __func__, sender);
    if (self.pageIndx < self.pageTitles.count) {
        self.pageIndx++;
    }
    [self setupPage:self.pageIndx];
    self.changesMade = YES;
}


#pragma mark - CLLocationManagerDelegate method(s)


- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray <CLLocation *> *)locations {
    NSLog(@"Location %f %f",
          locations[0].coordinate.latitude,
          locations[0].coordinate.longitude);
    [manager stopUpdatingLocation];
    self.currentLocation = locations[0];
}
    
@end
