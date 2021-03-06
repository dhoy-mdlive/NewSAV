//
//  ReasonForVisitController.m
//  MDLIVE New Dashboard
//
//  Created by David Hoy on 1/2/19.
//  Copyright © 2019 David Hoy. All rights reserved.
//

#import "ReasonForVisitController.h"
#import "ScheduleVisitController.h"


@interface ReasonForVisitController ()
@end

@implementation ReasonForVisitController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _reasonForVisitTableView.delegate = self;
    _reasonForVisitTableView.dataSource = self;
    
    _scheduleVisitController = (ScheduleVisitController *)[self parentViewController];
}

/*
- (void)listSubviewsOfView:(UIView *)view {
    // Get the subviews of the view
    static int indent = 0;
    
    NSArray *subviews = [view subviews];
    if ([subviews count] == 0)
        return;
    
    for (UIView *subview in subviews) {
        // Do what you want to do with the subview
        NSString *indentStr = @"";
        for (int i = 0; i < indent; i++)
            indentStr = [indentStr stringByAppendingString:@"--"];
        NSLog(@"%@%@", indentStr, subview);
        
        // List the subviews of subview
        indent++;
        [self listSubviewsOfView:subview];
        indent--;
    }
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"%s:", __func__);
    [self listSubviewsOfView:self.view];
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

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ReasonForVisitCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ReasonForVisitCell"];
    cell.delegate = self;
    //[self nextButtonEnabled:NO];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
}

#pragma mark - ReasonForVisitCellProtocol method(s()

-(void)nextButtonEnabled:(Boolean)state {
    self.scheduleVisitController.nextButton.enabled = state;
}

@end
