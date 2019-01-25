//
//  AppointmentDetailViewController.m
//  MDLIVE New Dashboard
//
//  Created by David Hoy on 1/25/19.
//  Copyright © 2019 David Hoy. All rights reserved.
//

#import "AppointmentDetailViewController.h"

@interface AppointmentDetailViewController ()

@end

@implementation AppointmentDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (IBAction)backButtonTapped:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark UpcomingApptDetailCellProtocol method(s)


// Present an alert controller on behalf of the cell view.
-(void)presentAlertController:(UIAlertController *)alertController animated:(BOOL)animated completion:(void (^ __nullable)(void))completion {
    [self presentViewController:alertController animated:animated completion:completion];
}

- (void)cancelAppointment {
    NSLog(@"%s:", __func__);
}


#pragma mark UITableViewDelegate and UITableViewDataSource protocol methods


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UpcomingApptDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UpcomingApptDetailCell"];
    cell.delegate = self;
    cell.providerNameLabel.text = @"Dr. Test Provider";
    return cell;
}



@end
