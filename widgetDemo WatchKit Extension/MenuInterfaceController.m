//
//  MenuInterfaceController.m
//  widgetDemo
//
//  Created by Yangyue on 15/5/7.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "MenuInterfaceController.h"

@interface MenuInterfaceController ()

@end

@implementation MenuInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    // Configure interface objects here.
}
- (IBAction)followAction {
    
    NSLog(@"%s",__FUNCTION__);
}
- (IBAction)giveMeFiveAction {
    NSLog(@"%s",__FUNCTION__);

}
- (IBAction)commentAction {
    NSLog(@"%s",__FUNCTION__);

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



