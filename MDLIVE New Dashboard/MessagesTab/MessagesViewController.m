//
//  MessagesViewController.m
//  MDLIVE New Dashboard
//
//  Created by David Hoy on 1/2/19.
//  Copyright © 2019 David Hoy. All rights reserved.
//

#import "MessagesViewController.h"
#import "MessagesMock.h"

@interface MessagesViewController () {
    NSArray <Message *> *_messages;
}

@property (nonatomic, strong) IBOutlet UITableView *tableView;
    

@end

@implementation MessagesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    // Update badge on Messages tab bar item to reflect number of unread messages
    MessagesMock *mock = [MessagesMock sharedInstance];
    _messages = [mock unreadMessages];

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


#pragma mark - UITableView delegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _messages.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MessagesCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MessagesCell"];
    cell.accessibilityIdentifier = @"homescreen_upcomingapp";
    cell.delegate = self;
    cell.messageLabel.text = _messages[indexPath.row].text;
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%s: indexPath=%@", __func__, indexPath);
}



@end
