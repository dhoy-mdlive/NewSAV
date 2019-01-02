//
//  HomeViewController.m
//  MDLIVE New Dashboard
//
//  Created by David Hoy on 12/26/18.
//  Copyright © 2018 David Hoy. All rights reserved.
//

#import "HomeViewController.h"
#import "GetStartedController.h"
#import "MDLPatientImageCell.h"
#import "UpcomingApptCell.h"
#import "MessagesCell.h"


@interface HomeViewController ()

@property (nonatomic, assign) NSInteger selectedUser;
@property (nonatomic, strong) NSMutableArray <NSString *> *userNames;
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) IBOutlet UITableView      *tableView;

@end

@implementation HomeViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _userNames = [NSMutableArray array];
    [_userNames addObjectsFromArray:@[@"Miguel", @"Ketan", @"Kim", @"Paulette", @"David"]];
    _selectedUser = 0;
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
}


#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    //NSLog(@"%s: seque=%@, sender=%@", __func__, segue, sender);
    //UIViewController *vc = [segue destinationViewController];
    //NSLog(@"%s: destination=%@", __func__, vc);
}

- (IBAction)unwindSegueAction:(UIStoryboardSegue *)segue {
    //NSLog(@"%s: segue=%@", __func__, segue);
    [self.collectionView flashScrollIndicators];
}
    
    
- (IBAction)getStartedButtonTapped:(id)sender
{
    //NSLog(@"User tapped 'Get Started' button");
}


#pragma UICollectionViewDataSource

-(NSInteger)collectionView:(UICollectionView *)collectionView
    numberOfItemsInSection:(NSInteger)section
{
    NSInteger ret = _userNames.count;
    return ret;
}


-(__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                          cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"PatientImageCell";
    MDLPatientImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier
                                                                          forIndexPath:indexPath];
    
    if (indexPath.row == _selectedUser)
        cell.imageView.image = [UIImage imageNamed:@"mdl_user_selected"];
    else
        cell.imageView.image = [UIImage imageNamed:@"mdl_user_unselected"];
    cell.nameLabel.text  = _userNames[indexPath.row];
    [collectionView flashScrollIndicators];
    return cell;
}

#pragma UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView
didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"User selected patient %@", [_userNames objectAtIndex:indexPath.row]);
    _selectedUser = indexPath.row;
    [collectionView reloadData];
}

#pragma UICollectionViewDelegateFlowLayout


- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView
                        layout:(nonnull UICollectionViewLayout *)collectionViewLayout
        insetForSectionAtIndex:(NSInteger)section
{
    NSInteger count =  [collectionView numberOfItemsInSection:section];
    if (count > 3) {
        return UIEdgeInsetsMake(0,0,0,0);
    }
    
    CGFloat totalCellWidth    = collectionView.layer.frame.size.width / 3 * count;
    CGFloat totalSpacingWidth = count - 1;
    
    CGFloat leftInset  = (collectionView.layer.frame.size.width - (totalCellWidth + totalSpacingWidth)) / 2;
    CGFloat rightInset = leftInset;
    UIEdgeInsets sectionInset = UIEdgeInsetsMake(0, leftInset, 0, rightInset);
    
    return sectionInset;
}


#pragma mark - UITableView delegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

/*
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    int ret = 0;
    switch (indexPath.row) {
        case 0:
            UpcomingAppointmentView *cell = [[UpcomingAppointmentView alloc] init];
            
            
    }
    
    return rtnVal;
}
 */

-(UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = nil;
    switch (indexPath.row)
    {
        case 0:
        case 2:
        case 3:
            cell = [tableView dequeueReusableCellWithIdentifier:@"UpcomingApptCell"];
            cell.accessibilityIdentifier = @"homescreen_upcomingapp";
            break;
            
        case 1:
            cell = [tableView dequeueReusableCellWithIdentifier:@"MessagesCell"];
            cell.accessibilityIdentifier = @"homescreen_messages";
            break;
         
        default:
            break;
    }

    NSAssert(cell != nil, @"cell should *never* be nil");
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%s: indexPath=%@", __func__, indexPath);
}



@end
