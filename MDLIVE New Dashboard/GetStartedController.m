//
//  GetStartedController.m
//  MDLIVE New Dashboard
//
//  Created by David Hoy on 12/27/18.
//  Copyright © 2018 David Hoy. All rights reserved.
//

#import "GetStartedController.h"

@interface GetStartedController ()

@end

@implementation GetStartedController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.delegate = self;
    self.dataSource = self;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    NSLog(@"%s: seque=%@, sender=%@", __func__, segue, sender);
    UIViewController *vc = [segue destinationViewController];
    NSLog(@"%s: destination=%@", __func__, vc);
}
    
    
#pragma mark - UIPageViewControllerDelegate
#pragma mark = UIPageViewControllerDataSource
    
    
-(nullable UIViewController *)pageViewController:(nonnull UIPageViewController *)pageViewController
              viewControllerBeforeViewController:(nonnull UIViewController *)viewController
{
    return nil;
}
    
- (nullable UIViewController *)pageViewController:(nonnull UIPageViewController *)pageViewController
                viewControllerAfterViewController:(nonnull UIViewController *)viewController
{
    return nil;
}
    

@end
