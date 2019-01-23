//
//  PharmacyInfoCell.h
//  MDLIVE New Dashboard
//
//  Created by David Hoy on 1/17/19.
//  Copyright © 2019 David Hoy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "EMKRoundButton.h"
#import "BEMCheckBox.h"

NS_ASSUME_NONNULL_BEGIN

@protocol PharmacyInfoCellProtocol <NSObject>
-(void)searchForPharmacy; //InMapView:(MKMapView *)mapView;
@end

@interface PharmacyInfoCell : UITableViewCell

@property (nonatomic,retain) id<PharmacyInfoCellProtocol> delegate;

@property (strong, nonatomic) IBOutlet UISwitch *useCurrentLocationSwitch;
@property (strong, nonatomic) IBOutlet UISegmentedControl *cityStateZipSegmentedControl;
@property (strong, nonatomic) IBOutlet UITextField *cityTextField;
@property (strong, nonatomic) IBOutlet UITextField *stateTextField;
@property (strong, nonatomic) IBOutlet UITextField *zipCodeTextField;
@property (strong, nonatomic) IBOutlet EMKRoundButton *searchButton;

@end

NS_ASSUME_NONNULL_END
