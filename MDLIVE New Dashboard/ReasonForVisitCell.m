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

@implementation ReasonForVisitCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    [_symptomTextField addLineAtPosition:LINE_POSITION_BOTTOM withColor:[UIColor lightGrayColor] lineWidth:2.0];
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (IBAction)symptomTextFieldChanged:(UITextField *)sender {
    NSLog(@"%s: sender=%@", __func__, sender);
}


- (IBAction)uploadPhotoTapped:(UIButton *)sender {
    NSLog(@"%s: sender=%@", __func__, sender);
    
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]) {
        _imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        _imagePicker.cameraCaptureMode = UIImagePickerControllerCameraCaptureModePhoto;
    } else {
        _imagePicker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    }
    
    UITableView *tableView = self.parentTableView;
    [tableView.inputViewController presentViewController:_imagePicker animated:YES completion:nil];
}


-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    _symptomImageView.image = image;
    _symptomImageView.contentMode = UIViewContentModeScaleAspectFit;
}



@end
