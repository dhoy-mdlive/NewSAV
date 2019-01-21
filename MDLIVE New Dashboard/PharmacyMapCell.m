//
//  PharmacyMapCell.m
//  MDLIVE New Dashboard
//
//  Created by David Hoy on 1/17/19.
//  Copyright © 2019 David Hoy. All rights reserved.
//

#import "PharmacyMapCell.h"

#define METERS_PER_MILE 1609.344

@implementation PharmacyMapCell

@synthesize delegate;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    /*
    CLLocation *currentlocation = [self.delegate currentLocation];
    CLLocationCoordinate2D zoomLocation;
    zoomLocation = currentlocation.coordinate;
    
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation,
                                                                       3*METERS_PER_MILE,
                                                                       3*METERS_PER_MILE);
    _mapView.region = viewRegion;
    _mapView.showsUserLocation = YES;
    _mapView.mapType = MKMapTypeStandard;
    _mapView.delegate = self;
    
    // Add pharmacy locations as map annotations
    NSArray <CLLocation *> *pharmacyLocations = [self.delegate pharmacyLocations];
    for (CLLocation *location in pharmacyLocations) {
        MKPointAnnotation *annotation = [MKPointAnnotation new];
        annotation.coordinate = location.coordinate;
        [_mapView addAnnotation:annotation];
    }
     */
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


#pragma mark - MKMapViewDelegate method(s)


-(void)mapViewDidFinishLoadingMap:(MKMapView *)mapView {
    NSLog(@"%s: mapView=%@", __func__, mapView);
}
@end
