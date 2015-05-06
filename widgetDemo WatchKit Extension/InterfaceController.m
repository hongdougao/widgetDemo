//
//  InterfaceController.m
//  widgetDemo WatchKit Extension
//
//  Created by Yangyue on 15/4/30.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "InterfaceController.h"
#import "MainRowType.h"
#import "MyDataObject.h"
@interface InterfaceController()
{
  NSArray *  tbDate;
}
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *titleLbl;
@property (weak, nonatomic) IBOutlet WKInterfaceTable *tb;

@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    // Configure interface objects here.
    [_titleLbl setText:@"hello world!"];
    tbDate = @[@"h",@"e",@"l",@"l",@"0" ];
    [self creatTB];
}


-(void)creatTB{
    [_tb setNumberOfRows:tbDate.count withRowType:@"MainRowType"];
    for (int i = 0;  i < tbDate.count; i++) {
        MainRowType *type = [_tb rowControllerAtIndex:i];
//        NSArray *imgArr = @[@"sns_icon_1",@"sns_icon_2"];
//        MyDataObject *dataObject = [imgArr objectAtIndex: i];

        [type.rowDescription setText: tbDate[i]];

        [type.rowIcon setImage:[UIImage imageNamed:@"2"]] ;
        
        
    }
    
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



