//
//  ApptHeaderCell.h
//  MDLIVE New Dashboard
//
//  Created by David Hoy on 1/25/19.
//  Copyright © 2019 David Hoy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, ApptType) {
    ApptTypeUpcoming,
    ApptTypePast
};

@protocol ApptHeaderCellProtocol <NSObject>
- (void)setApptType:(ApptType)type;
@end

@interface ApptHeaderCell : UITableViewCell

@property (nonatomic,strong) id<ApptHeaderCellProtocol> delegate;

@property (strong, nonatomic) IBOutlet UISegmentedControl *selectApptTypeSegmentedControl;

@end

NS_ASSUME_NONNULL_END
