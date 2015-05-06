//
//  MainRowType.h
//  widgetDemo
//
//  Created by Yangyue on 15/5/6.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WatchKit/WatchKit.h>
@interface MainRowType : NSObject

@property (weak, nonatomic) IBOutlet WKInterfaceLabel* rowDescription;
@property (weak, nonatomic) IBOutlet WKInterfaceImage* rowIcon;
@end
