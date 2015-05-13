//
//  NextViewController.m
//  widgetDemo
//
//  Created by Yangyue on 15/5/12.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "NextViewController.h"
#define k_APP_WIDGET_EXTENSION_KEY @"com.apple.widget-extension"
#import <NotificationCenter/NotificationCenter.h>

@interface NextViewController ()

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor yellowColor]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
////隐藏插件
- (IBAction)hideAction:(id)sender {
    [[NCWidgetController widgetController] setHasContent:NO forWidgetWithBundleIdentifier:k_APP_WIDGET_EXTENSION_KEY];

}
////让隐藏的插件重新显示
- (IBAction)showAction:(id)sender {
    [[NCWidgetController widgetController] setHasContent:YES forWidgetWithBundleIdentifier:k_APP_WIDGET_EXTENSION_KEY];

}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
