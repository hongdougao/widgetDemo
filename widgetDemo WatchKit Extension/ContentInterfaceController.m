//
//  ContentInterfaceController.m
//  widgetDemo
//
//  Created by Yangyue on 15/5/6.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "ContentInterfaceController.h"

@interface ContentInterfaceController ()

@end

@implementation ContentInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    // Configure interface objects here.
    NSLog(@"conten Show");
    [self addMenuItemWithImage:[UIImage imageNamed:@"1@3x.png"] title:@"文章" action:@selector(showMenuController)];
    [self addMenuItemWithImage:[UIImage imageNamed:@"2@3x.png"] title:@"标题" action:@selector(showMenuController)];
    [self addMenuItemWithImage:[UIImage imageNamed:@"3@3x.png"] title:@"新浪" action:@selector(showMenuController)];

}
-(void)showMenuController{
    [self pushControllerWithName:@"MenuInterfaceController" context:nil];
}
- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



