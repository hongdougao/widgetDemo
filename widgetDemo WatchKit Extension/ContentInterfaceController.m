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



