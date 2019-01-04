//
//  ScheduleVisitController.m
//  MDLIVE New Dashboard
//
//  Created by David Hoy on 12/28/18.
//  Copyright © 2018 David Hoy. All rights reserved.
//

#import "ScheduleVisitController.h"
#import "ReasonForVisitController.h"
#import "MDLProviderTypeView.h"


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

@property (nonatomic, assign) NSInteger             pageIndx;
@property (nonatomic, strong) NSArray <NSString  *> *pageTitles;
@property (nonatomic, strong) NSArray <NSString *>  *pageVCNames;
@property (nonatomic, assign) Boolean               changesMade;

//@property (nonatomic, strong) IBOutlet UITableView *providerTypeTableView;
    
@end

@implementation ScheduleVisitController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    self.pageIndx = 0;
    self.pageTitles = @[ @"Provider Type",
                         @"Reason For Visit",
                         @"Medical History",
                         @"Pharmacy Information",
                         @"Choose Doctor",
                         @"Your Appointment",
                         @"Payment" ];
    self.pageVCNames = @[ @"SelectProviderController",
                          @"ReasonForVisitController",
                          @"MedicalHistoryController",
                          @"PharmacyInfoController",
                          @"ChooseDoctorController",
                          @"YourAppointmentController",
                          @"PaymentController"];
    self.changesMade = NO;
    [self setupPage:self.pageIndx];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
     //NSLog(@"%s: segue=%@, sender=%@", __func__, segue, sender);
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


- (void)setupPage:(ScheduleVisitPage)page {
    self.backButton.enabled = (page == 0) ? NO : YES;
    self.nextButton.enabled = (page == self.pageTitles.count-1) ? NO : YES;
    
    self.scheduleVisitPageTitleLabel.text = self.pageTitles[page];
    
    self.scheduleVisitPageControl.numberOfPages = self.pageTitles.count;
    self.scheduleVisitPageControl.currentPage   = page;
    
    NSString *vcname = _pageVCNames[page];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *viewcontroller = [storyboard instantiateViewControllerWithIdentifier:vcname];
    
    [self addChildViewController:viewcontroller];
    viewcontroller.view.bounds = _contentView.bounds;
    [_contentView addSubview:viewcontroller.view];
    [viewcontroller didMoveToParentViewController:self];
}


#pragma mark - Button action handlers
    
- (IBAction)unwindSegueAction:(UIStoryboardSegue *)unwindSegue {
     NSLog(@"%s: segue=%@", __func__, unwindSegue);
}
    
    
- (IBAction)cancelButton:(id)sender {
    NSLog(@"%s: sender=%@", __func__, sender);
    
    if (self.changesMade) {
        __weak __typeof(self)weakSelf = self;
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:nil
                                                                       message:@"Do you really want to leave?"
                                                                preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* leaveAction = [UIAlertAction actionWithTitle:@"Leave"
                                                              style:UIAlertActionStyleDefault
                                                            handler:^(UIAlertAction * action) {
                                                                [weakSelf performSegueWithIdentifier:@"unwindSegue" sender:nil];
                                                            }];
        UIAlertAction* stayAction  = [UIAlertAction actionWithTitle:@"Stay"
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
    NSLog(@"%s: sender=%@", __func__, sender);
    if (self.pageIndx > 0)
        self.pageIndx--;
    [self setupPage:self.pageIndx];
}
    
    
- (IBAction)nextButton:(id)sender {
    NSLog(@"%s: sender=%@", __func__, sender);
    if (self.pageIndx < self.pageTitles.count)
        self.pageIndx++;
    [self setupPage:self.pageIndx];
    self.changesMade = YES;
}
    

    
@end
