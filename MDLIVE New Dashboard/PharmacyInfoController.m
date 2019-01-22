//
//  PharmacyInfoController.m
//  MDLIVE New Dashboard
//
//  Created by David Hoy on 1/17/19.
//  Copyright © 2019 David Hoy. All rights reserved.
//

#import "PharmacyInfoController.h"


#define METERS_PER_MILE 1609.344


@interface PharmacyInfoController ()
//@property (nonatomic,strong) MKMapView *mapView;
@end

@implementation PharmacyInfoController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    _scheduleVisitController = (ScheduleVisitController *)[self parentViewController]; 
    
    //_mapView = [[MKMapView alloc] init];
    //_mapView.showsUserLocation = YES;
    //_mapView.mapType = MKMapTypeStandard;
    //_mapView.delegate = self;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSInteger   sections = 0;
    
    if (_mode == PharmacyControllerModeSearch) {
        sections = 1;
    }
    else if (_mode == PharmacyControllerModeSelect) {
        sections = 2;
    }
    return sections;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger rows = 0;
    
    if (_mode == PharmacyControllerModeSearch) {
        rows = 1;
    }
    else if (_mode == PharmacyControllerModeSelect) {
        if (section == 0) {
            rows = 1;
        }
        else {
            rows = 5;       // change this to number of pharmacies found
        }
    }
    return rows;
}


-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat height = self.view.frame.size.width;
    return height*2;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSInteger numRows = [tableView numberOfRowsInSection:1];
    for (NSInteger row = 0; row < numRows; row++) {
        NSIndexPath *thisPath = [NSIndexPath indexPathForRow:row inSection:1];
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:thisPath];
        if ([cell isKindOfClass:[PharmacyDetailCell class]])
        {
            PharmacyDetailCell *pdcell = (PharmacyDetailCell *)cell;
            if (pdcell.selected) {
                pdcell.containerView.layer.borderWidth = 2;
            } else {
                pdcell.containerView.layer.borderWidth = 0;
            }
        }
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = nil;
    
    if (_mode == PharmacyControllerModeSearch) {
        PharmacyInfoCell *picell = [tableView dequeueReusableCellWithIdentifier:@"PharmacyInfoCell" forIndexPath:indexPath];
        picell.delegate = self;
        cell = picell;
    }
    else if (_mode == PharmacyControllerModeSelect) {
        if (indexPath.section == 0) {
            PharmacyMapCell *pmcell = [tableView dequeueReusableCellWithIdentifier:@"PharmacyMapCell" forIndexPath:indexPath];
            pmcell.delegate = self;
            //_mapView = pmcell.mapView;  // store weak reference to map view
            cell = pmcell;
        }
        else {
            PharmacyDetailCell *pdcell = [tableView dequeueReusableCellWithIdentifier:@"PharmacyDetailCell" forIndexPath:indexPath];
            pdcell.delegate = self;
            
            cell = pdcell;
        }
    }
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


#pragma mark - PharmacyInfoCellProtocol method(s)

-(void)searchForPharmacy { //InMapView:(MKMapView *)mapView {
    _mode = PharmacyControllerModeSelect;
    [self.tableView reloadData];
    
    //MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(_scheduleVisitController.currentLocation.coordinate,
    //                                                                   3*METERS_PER_MILE,
    //                                                                   3*METERS_PER_MILE);
    //[_mapView setRegion:viewRegion];
    
   
}

#pragma mark - PharmacyMapCellProtocol method(s)

-(CLLocation *)currentLocation {
    return _scheduleVisitController.currentLocation;
}

- (NSArray<CLLocation *> *)pharmacyLocations {
    return nil;
}

#pragma mark - PharmacyDetailCellProtocol method(s)


#pragma mark - MKMapViewProtocol method(s)

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
  //  MKCoordinateRegion region;
  //  MKCoordinateSpan span;
  //  span.latitudeDelta = 0.005;
  //  span.longitudeDelta = 0.005;
  //  CLLocationCoordinate2D location;
  //  location.latitude = 26.129959; //aUserLocation.coordinate.latitude;
  //  location.longitude = -80.331103; //aUserLocation.coordinate.longitude;
   // region.span = span;
   // region.center = location;
   // [_mapView setRegion:region animated:YES];
}



- (void)tableView:(UITableView *)tableView
  willDisplayCell:(UITableViewCell *)cell
forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([cell isKindOfClass:[PharmacyMapCell class]]) {
        PharmacyMapCell *pmcell = (PharmacyMapCell *)cell;
        
        CLLocation *currentlocation = [self currentLocation];
        CLLocationCoordinate2D zoomLocation;
        zoomLocation = currentlocation.coordinate;
        
        MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation,
                                                                           3*METERS_PER_MILE,
                                                                           3*METERS_PER_MILE);
        pmcell.mapView.region = viewRegion;
        pmcell.mapView.showsUserLocation = YES;
        pmcell.mapView.mapType = MKMapTypeStandard;
        //pmcell.mapView.delegate = self;
        
        // Add pharmacy locations as map annotations
        NSArray <CLLocation *> *pharmacyLocations = [self pharmacyLocations];
        for (CLLocation *location in pharmacyLocations) {
            MKPointAnnotation *annotation = [MKPointAnnotation new];
            annotation.coordinate = location.coordinate;
            [pmcell.mapView addAnnotation:annotation];
        }
    }
}

@end
