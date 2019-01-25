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
#import "UITextField+addDoneToolbar.h"


@implementation YourAppointmentCell

@synthesize delegate;

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
    
    [self.delegate nextButtonEnabled:NO];
    _phoneNumberTextField.delegate = self;
    [_phoneNumberTextField addDoneToolbar];
}


-(void)drawRect:(CGRect)rect {
    [super drawRect:rect];
}


- (void)phoneImageTapped {
    //NSLog(@"%s:", __func__);
    if (_phoneImageView.highlighted == NO) {
        _phoneImageView.highlighted = YES;
        _videoImageView.highlighted = NO;
        [self.delegate nextButtonEnabled:YES];
    }
    if ([_phoneNumberTextField isFirstResponder]) {
        [_phoneNumberTextField resignFirstResponder];
    }
}


- (void)videoImageTapped {
    //NSLog(@"%s:", __func__);
    if (_videoImageView.highlighted == NO) {
        _phoneImageView.highlighted = NO;
        _videoImageView.highlighted = YES;
        [self.delegate nextButtonEnabled:YES];
    }
    if ([_phoneNumberTextField isFirstResponder]) {
        [_phoneNumberTextField resignFirstResponder];
    }
}


-(NSString*) formatPhoneNumber:(NSString*) simpleNumber deleteLastChar:(BOOL)deleteLastChar {
    if(simpleNumber.length==0) {
        return @"";
    }
    
    // use regex to remove non-digits(including spaces) so we are left with just the numbers
    NSError *error = NULL;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"[\\s-\\(\\)]" options:NSRegularExpressionCaseInsensitive error:&error];
    simpleNumber = [regex stringByReplacingMatchesInString:simpleNumber options:0 range:NSMakeRange(0, [simpleNumber length]) withTemplate:@""];
    
    // check if the number is to long
    if(simpleNumber.length>10 && deleteLastChar != YES) {
        // remove last extra chars.
        //simpleNumber = [simpleNumber substringToIndex:10];
        return simpleNumber;
    }
    
    if(deleteLastChar) {
        // should we delete the last digit?
        simpleNumber = [simpleNumber substringToIndex:[simpleNumber length] - 1];
    }
    
    // 123 456 7890
    // format the number.. if it's less then 7 digits.. then use this regex.
    if(simpleNumber.length<7)
        simpleNumber = [simpleNumber stringByReplacingOccurrencesOfString:@"(\\d{3})(\\d+)"
                                                               withString:@"($1) $2"
                                                                  options:NSRegularExpressionSearch
                                                                    range:NSMakeRange(0, [simpleNumber length])];
    
    else   // else do this one..
        simpleNumber = [simpleNumber stringByReplacingOccurrencesOfString:@"(\\d{3})(\\d{3})(\\d+)"
                                                               withString:@"($1) $2-$3"
                                                                  options:NSRegularExpressionSearch
                                                                    range:NSMakeRange(0, [simpleNumber length])];
    return simpleNumber;
}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    // If it's the phone number textfield, format it.
    if (textField.tag == 102) {
        //NSLog(@"%s: textfield.text='%@', range=(%d,%d), string='%@'", __func__, textField.text, (int)range.location, (int)range.length, string);
        
        if ((range.location == 0) && (range.length == 0) && ([string isEqualToString:@" "])) {
            return YES;
        }
        
        // If text is coming from the pasteboard, take it as-is
        if ([string isEqualToString:[UIPasteboard generalPasteboard].string]) {
            textField.text = string;
        }
        
        // If user is typing text, format it as a phone number
        else {
            NSString* totalString = [textField.text stringByAppendingString:string];
            if (range.length == 1) {
                // Delete button was hit.. so tell the method to delete the last char.
                textField.text = [self formatPhoneNumber:totalString deleteLastChar:YES];
            }
            else {
                textField.text = [self formatPhoneNumber:totalString deleteLastChar:NO ];
            }
        }
        return NO;
    }
    return YES;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
