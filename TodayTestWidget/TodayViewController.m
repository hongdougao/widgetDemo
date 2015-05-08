//
//  TodayViewController.m
//  TodayTestWidget
//
//  Created by Yangyue on 15/3/12.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>

@interface TodayViewController () <NCWidgetProviding,UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tb;

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *lbl = [[UILabel  alloc]init];
    lbl.text = @"啦啦啦啦啦啦啦啦";
    lbl.frame = CGRectMake(20, 20, 100, 20);
    [self.view addSubview:lbl];
    // Do any additional setup after loading the view from its nib.
    self.tb.delegate = self;
    self.tb.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)dumpBtnClick:(id)sender {
    NSLog(@"alert");
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    completionHandler(NCUpdateResultNewData);
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tableviewCell" forIndexPath:indexPath];
    cell.textLabel.text =[NSString stringWithFormat:@"%ld",(long)indexPath.row]  ;
    return cell;
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 1;
}
@end
