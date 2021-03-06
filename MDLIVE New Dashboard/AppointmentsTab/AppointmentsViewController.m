//
//  AppointmentsViewController.m
//  MDLIVE New Dashboard
//
//  Created by David Hoy on 1/2/19.
//  Copyright © 2019 David Hoy. All rights reserved.
//

#import "AppointmentsViewController.h"
#import "AppointmentDetailViewController.h"
#import "AppointmentsMock.h"


@interface AppointmentsViewController () {
    ApptType _apptType;
    
    NSArray <Appointment *> *_upcomingAppointments;
    NSArray <Appointment *> *_pastAppointments;
}

@property (nonatomic, strong) IBOutlet UITableView *tableView;

@end

@implementation AppointmentsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    _apptType = ApptTypeUpcoming;
    
    AppointmentsMock *mock = [AppointmentsMock sharedInstance];
    _upcomingAppointments = [mock appointmentsAfterDate:nil];
    _pastAppointments     = [mock appointmentsBeforeDate:nil];
}
    

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


#pragma mark - UITableView delegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger rows = 2;     // header row + summary row
    
    if (_apptType == ApptTypeUpcoming)
        rows += _upcomingAppointments.count;
    else
        rows += _pastAppointments.count;
    
    return rows;
}


-(UITableViewCell *)tableView:(UITableView *)tableView  cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell;
    switch (indexPath.row) {
        case 0: {
            ApptHeaderCell *ahcell = [tableView dequeueReusableCellWithIdentifier:@"HeaderCell"];
            ahcell.delegate = self;
            cell = ahcell;
            break;
        }
                
        case 1: {
            ApptSummaryCell *summaryCell = [tableView dequeueReusableCellWithIdentifier:@"ApptSummaryCell"];
            if (_apptType == ApptTypeUpcoming) {
                if (_upcomingAppointments.count == 0)
                    summaryCell.summaryLabel.text = @"No upcoming visits";
                else
                    summaryCell.summaryLabel.text = [NSString stringWithFormat:@"Upcoming Visits (%d)", (int)_upcomingAppointments.count];
            }
            else {
                if (_pastAppointments.count == 0)
                    summaryCell.summaryLabel.text = @"No past visits";
                else
                    summaryCell.summaryLabel.text = [NSString stringWithFormat:@"Past Visits (%d)", (int)_pastAppointments.count];
            }
            cell = summaryCell;
            break;
        }
                
        default:
            if (_apptType == ApptTypeUpcoming) {
                UpcomingApptCell *uacell = [tableView dequeueReusableCellWithIdentifier:@"UpcomingApptCell"];
                uacell.delegate = self;
                [uacell updateWithAppointment:_upcomingAppointments[indexPath.row-2]];
                cell = uacell;
            }
            else {
                PastApptCell *pacell = [tableView dequeueReusableCellWithIdentifier:@"PastApptCell"];
                pacell.delegate = self;
                [pacell updateWithAppointment:_pastAppointments[indexPath.row-2]];
                cell = pacell;
            }
            break;
    }
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //NSLog(@"%s: indexPath=%@", __func__, indexPath);
    if (indexPath.row >= 2) {
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"AppointmentsTab" bundle:nil];
        AppointmentDetailViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"AppointmentDetailViewController"];
        Appointment *appt = [cell valueForKey:@"appointment"];
        [viewController setValue:appt forKey:@"appointment"];
        [self presentViewController:viewController animated:YES completion:nil];
    }
}


#pragma mark UpcomingApptCellProtocol method(s)


-(void)setApptType:(ApptType)type {
    _apptType = type;
    [self.tableView reloadData];
}


#pragma mark PastApptCellProtocol method(s)


#pragma mark UpcomingApptDetailCellProtocol method(s)


// Present an alert controller on behalf of the cell view.
-(void)presentAlertController:(UIAlertController *)alertController animated:(BOOL)animated completion:(void (^ __nullable)(void))completion {
    [self presentViewController:alertController animated:animated completion:completion];
}


@end
