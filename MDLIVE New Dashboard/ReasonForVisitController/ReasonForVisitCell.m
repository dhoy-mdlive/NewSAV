//
//  ReasonForVisitCell.m
//  MDLIVE New Dashboard
//
//  Created by David Hoy on 1/2/19.
//  Copyright © 2019 David Hoy. All rights reserved.
//

#import "ReasonForVisitController.h"
#import "ReasonForVisitCell.h"
#import "EMKRoundButton.h"
#import "UIView+IBDesignable.h"
#import "UITextField+addDoneToolbar.h"

//@interface ReasonForVisitCell ()
//@property (nonatomic, weak) ReasonForVisitController *viewController;
//@end

@implementation ReasonForVisitCell

@synthesize delegate;


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    _imagePicker = [[UIImagePickerController alloc] init];
    _imagePicker.delegate = self;
    _containerView.borderWidth = 0;
    _containerView.dashedBorder = YES;
    
    [_symptomTextField addDoneToolbar];
    
    //[self.delegate nextButtonEnabled:NO];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}


- (IBAction)symptomTextFieldChanged:(UITextField *)sender {
    NSLog(@"%s: sender=%@", __func__, sender);
    [self.delegate nextButtonEnabled:YES];
    
}


- (IBAction)uploadPhotoTapped:(UIButton *)sender {
    NSLog(@"%s: sender=%@", __func__, sender);
    
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]) {
        _imagePicker.sourceType        = UIImagePickerControllerSourceTypeCamera;
        _imagePicker.cameraCaptureMode = UIImagePickerControllerCameraCaptureModePhoto;
    } else {
        _imagePicker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    }
    
    UIViewController *vc = [self firstAvailableUIViewController];
    [vc presentViewController:_imagePicker animated:YES completion:nil];
}


-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    _symptomImageView.image = image;
    _symptomImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self bringSubviewToFront:_symptomImageView];
    _containerView.hidden = YES;
}



@end
