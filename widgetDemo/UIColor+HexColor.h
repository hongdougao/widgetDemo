//
//  UIColor+HexColor.h
//  PeopleDailyNew
//
//  Created by LiuXiaoyu on 10/22/14.
//  Copyright (c) 2014 M.H.International. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (HexColor)

+ (UIColor *)colorWithHexString:(NSString *)color;

+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

@end
