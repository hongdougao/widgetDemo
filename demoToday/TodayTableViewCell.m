//
//  TodayTableViewCell.m
//  widgetDemo
//
//  Created by Yangyue on 15/5/12.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "TodayTableViewCell.h"

@implementation TodayTableViewCell
+(UINib *)nibCell{
    return [UINib nibWithNibName:@"TodayTableViewCell" bundle:nil];

}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
