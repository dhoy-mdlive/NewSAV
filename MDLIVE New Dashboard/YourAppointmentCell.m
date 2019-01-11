//
//  YourAppointmentCell.m
//  MDLIVE New Dashboard
//
//  Created by David Hoy on 1/4/19.
//  Copyright © 2019 David Hoy. All rights reserved.
//

#import "YourAppointmentCell.h"
#import "YourAppointmentController.h"
#import "UIView+IBDesignable.h"


@interface YourAppointmentCell ()
@property (nonatomic, weak) YourAppointmentController *viewController;
@end


@implementation YourAppointmentCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    UITapGestureRecognizer *phoneTap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                               action:@selector(phoneImageTapped)];
    [_phoneImageView addGestureRecognizer:phoneTap];
    _phoneImageView.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *videoTap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                               action:@selector(videoImageTapped)];
    [_videoImageView addGestureRecognizer:videoTap];
    _videoImageView.userInteractionEnabled = YES;
    
    _viewController = (YourAppointmentController *)[self firstAvailableUIViewController];
    _viewController.scheduleVisitController.nextButton.enabled = NO;
    
    id view = [self superview];
    while (view && [view isKindOfClass:[UITableView class]] == NO) {
        view = [view superview];
    }
    UITableView *tableView = (UITableView *)view;
    NSLog(@"tableView=%@", tableView);
    
}


-(void)drawRect:(CGRect)rect {
    [super drawRect:rect];
}

- (void)phoneImageTapped {
    NSLog(@"%s:", __func__);
    if (_phoneImageView.highlighted == NO) {
        _phoneImageView.highlighted = YES;
        _videoImageView.highlighted = NO;
        _viewController.scheduleVisitController.nextButton.enabled = YES;
    }
}

- (void)videoImageTapped {
    NSLog(@"%s:", __func__);
    if (_videoImageView.highlighted == NO) {
        _phoneImageView.highlighted = NO;
        _videoImageView.highlighted = YES;
        _viewController.scheduleVisitController.nextButton.enabled = YES;
    }
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
