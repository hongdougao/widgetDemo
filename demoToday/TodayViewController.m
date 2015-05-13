//
//  TodayViewController.m
//  demoToday
//
//  Created by Yangyue on 15/5/12.
//  Copyright (c) 2015年 mac. All rights reserved.
//
#define k_APP_GROUP_KEY @"group.com.testDemoContainer"
#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>
#import "TodayTableViewCell.h"
@interface TodayViewController () <NCWidgetProviding,UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tb;
@property (nonatomic,strong)TodayTableViewCell *nibCell;

@property (weak, nonatomic) IBOutlet UILabel *lbl;

@end

@implementation TodayViewController
-(TodayTableViewCell *)nibCell{
    if (!_nibCell) {
        _nibCell = [[TodayTableViewCell nibCell]instantiateWithOwner:nil options:nil].lastObject;
    }
    return _nibCell;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    [self.tb registerNib:[TodayTableViewCell nibCell] forCellReuseIdentifier:@"TodayTableViewCell"];
    
 
    // 调整高度,根据数组的值来确定Cell的个数，从而确定视图的高度
    self.preferredContentSize = CGSizeMake(self.view.bounds.size.width,180 );
    self.tb.delegate = self;
    self.tb.dataSource = self;
    self.tb.frame=CGRectMake(0, 0, self.view.bounds.size.width, 100);
    self.tb.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    NSUserDefaults *userDefault = [[NSUserDefaults alloc]initWithSuiteName:k_APP_GROUP_KEY];
    NSString *stringForName = [userDefault objectForKey:@"testDemoContainer"];
    if (stringForName) {
        [_lbl setText:stringForName];
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData
    NSUserDefaults *userDefault = [[NSUserDefaults alloc]initWithSuiteName:@"group.com.testDemoContainer"];
    NSString *stringForName = [userDefault valueForKey:@"testDemoContainer"];
    if (stringForName) {
        [_lbl setText:stringForName];
    }
    completionHandler(NCUpdateResultNewData);
}
// 一般默认的View是从图标的右边开始的...如果你想变换,就要实现这个方法
- (UIEdgeInsets)widgetMarginInsetsForProposedMarginInsets:(UIEdgeInsets)defaultMarginInsets {
    //UIEdgeInsets newMarginInsets = UIEdgeInsetsMake(defaultMarginInsets.top, defaultMarginInsets.left - 16, defaultMarginInsets.bottom, defaultMarginInsets.right);
    //return newMarginInsets;
    return UIEdgeInsetsZero; // 完全靠到了左边....
//    return UIEdgeInsetsMake(0.0, 16.0, 0, 0);
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{


    return 20;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    TodayTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TodayTableViewCell"];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TodayTableViewCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TodayTableViewCell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        //extension和host app之间可以通过extensionContext属性直接通信，该属性是新增加的UIViewController类别：

        [self.extensionContext openURL:[NSURL URLWithString:@"todayWidgetIOS://action=GotoHomePage"] completionHandler:^(BOOL success) {
            NSLog(@"open url result:%d",success);
        }];
    }else{
        [self.extensionContext openURL:[NSURL URLWithString:@"todayWidgetIOS://action=GotoOtherPage"] completionHandler:^(BOOL success) {
            NSLog(@"open url result:%d",success);
        }];
    }

}
@end
