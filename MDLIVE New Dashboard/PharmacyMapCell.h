//
//  PharmacyMapCell.h
//  MDLIVE New Dashboard
//
//  Created by David Hoy on 1/17/19.
//  Copyright © 2019 David Hoy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol PharmacyMapCellProtocol <NSObject>
- (CLLocation *)currentLocation;
- (NSArray <CLLocation *> *)pharmacyLocations;
@end

@interface PharmacyMapCell : UITableViewCell <MKMapViewDelegate>

@property (nonatomic,retain) id<PharmacyMapCellProtocol> delegate;

@property (strong, nonatomic) IBOutlet MKMapView *mapView;

@end

NS_ASSUME_NONNULL_END
