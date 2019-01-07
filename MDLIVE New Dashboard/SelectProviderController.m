//
//  SelectProviderController.m
//  MDLIVE New Dashboard
//
//  Created by David Hoy on 12/31/18.
//  Copyright © 2018 David Hoy. All rights reserved.
//

#import "SelectProviderController.h"
#import "ProviderTypeCell.h"
#import "UIColor+mdl.h"
#import "UIView-Borders/UIView+Borders.h"

@interface SelectProviderController ()

@end

@implementation SelectProviderController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _providerTableView.delegate = self;
    _providerTableView.dataSource = self;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ProviderTypeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ProviderTypeCell"];
    UIColor *color = nil;
    
    switch (indexPath.row)
    {
        case 0:
            color = [UIColor colorFromHexString:@"#27884d"];
            cell.containerView.layer.borderColor = color.CGColor;
            cell.providerTypeLabel.text = @"Medical Visit";
            cell.priceLabel.text = @"$75";
            cell.priceBasisLabel.text = @"Per Visit";
            [cell.containerView createLeftBorderWithWidth:7 andColor:color];
            break;
            
        case 1:
            color = [UIColor colorFromHexString:@"#7254A6"];
            cell.containerView.layer.borderColor = color.CGColor;
            cell.providerTypeLabel.text = @"Therapy Counseling";
            cell.priceLabel.text = @"$99";
            cell.priceBasisLabel.text = @"Per Session";
            break;
            
        case 2:
            color = [UIColor colorFromHexString:@"#9b4f71"];
            cell.containerView.layer.borderColor = color.CGColor;
            cell.providerTypeLabel.text = @"Psychiatry";
            cell.priceLabel.text = @"$259";
            cell.priceBasisLabel.text = @"First Visit\n$99 follow ups";
            break;
            
        case 3:
            color = [UIColor colorFromHexString:@"#ce4A0d"];
            cell.containerView.layer.borderColor = color.CGColor;
            cell.providerTypeLabel.text = @"Dermatology";
            cell.priceLabel.text = @"$5";
            cell.priceBasisLabel.text = @"Per Visit";
            break;
            
        default:
            break;
    }
    
    CALayer *borderLayer = [cell.containerView createLeftBorderWithWidth:6 andColor:color];
    borderLayer.cornerRadius = 5;
    [cell.containerView.layer addSublayer:borderLayer];
 
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSInteger numRows = [tableView numberOfRowsInSection:0];
    for (NSInteger row = 0; row < numRows; row++) {
        NSIndexPath *thisPath = [NSIndexPath indexPathForRow:row inSection:0];
        ProviderTypeCell *cell = [tableView cellForRowAtIndexPath:thisPath];
        if (cell.selected) {
            cell.containerView.layer.borderWidth = 2;
            cell.radioButton.image = [UIImage imageNamed:@"selected-radio-button"];
        } else {
            cell.containerView.layer.borderWidth = 0;
            cell.radioButton.image = [UIImage imageNamed:@"unselected-radio-button"];
        }
    }
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



@end
