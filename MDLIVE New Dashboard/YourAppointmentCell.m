//
//  YourAppointmentCell.m
//  MDLIVE New Dashboard
//
//  Created by David Hoy on 1/4/19.
//  Copyright © 2019 David Hoy. All rights reserved.
//

#import "YourAppointmentCell.h"

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
}


-(void)drawRect:(CGRect)rect {
    [super drawRect:rect];
}

- (void)phoneImageTapped {
    NSLog(@"%s:", __func__);
    if (_phoneImageView.highlighted == NO) {
        _phoneImageView.highlighted = YES;
        _videoImageView.highlighted = NO;
    }
}

- (void)videoImageTapped {
    NSLog(@"%s:", __func__);
    if (_videoImageView.highlighted == NO) {
        _phoneImageView.highlighted = NO;
        _videoImageView.highlighted = YES;
    }
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
