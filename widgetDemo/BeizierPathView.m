//
//  BeizierPathView.m
//  widgetDemo
//
//  Created by Yangyue on 15/3/31.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "BeizierPathView.h"
#define pi 3.14159265359
#define   DEGREES_TO_RADIANS(degrees)  ((pi * degrees)/ 180)
@implementation BeizierPathView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    [self setBackgroundColor:[UIColor whiteColor]];
//     [self casualLine];
//    [self rectSize];
//    [self drawRound];
//    [self twiceBerzier];
//    [self threeBerzier];
//    [self fillColor];
//    [self roundColor];
//    [self colorGradient];
    [self drawDownBG];
}
-(void)drawDownBG{
    
    UIColor *color  = [UIColor redColor];
    [color set];
    
    UIBezierPath *aPath = [UIBezierPath bezierPath];
     [aPath moveToPoint:CGPointMake(0, 200)];
    //圆 60直径
    [aPath addLineToPoint:CGPointMake((320 - 120)/2, 200)];
    [aPath moveToPoint:CGPointMake((320 - 120)/2 + 120, 200)];
    [aPath addLineToPoint:CGPointMake(320, 200)];
    [aPath setLineWidth:5];
     [aPath stroke];
    
    UIBezierPath *bPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(320/2, 200) radius:60 startAngle:0 endAngle :DEGREES_TO_RADIANS(  180) clockwise:YES];
    bPath.lineWidth = 3;
    [bPath stroke];
    [bPath addClip];
    [bPath stroke];
}

-(void)casualLine{
    UIColor *coloer = [UIColor redColor];
    [coloer set];
    
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    
    [aPath moveToPoint:CGPointMake(0, 0)];
    [aPath addLineToPoint:CGPointMake(200, 40)];
    [aPath addLineToPoint:CGPointMake(160, 140)];
    [aPath addLineToPoint:CGPointMake(40, 140)];
    [aPath addLineToPoint:CGPointMake(0, 40)];
    
    [aPath setLineWidth:2];
    
    [aPath closePath];//第五条线通过调用closePath方法得到的
    [aPath stroke];//Draws line 根据坐标点连线
    [aPath fill];//填充效果

}

-(void)rectSize{

    UIColor *coloer = [UIColor redColor];
    [coloer set];
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(20, 20, 80, 80)];
    
    path.lineWidth = 5.0;
    path.lineCapStyle = kCGLineCapButt;//线条拐角
    path.lineJoinStyle = kCGLineCapButt;//终点处理
    
    [path stroke];
}

-(void)drawRound{
    UIColor *color = [UIColor yellowColor];
    [color set];
    //这段圆弧的中心，半径，开始角度，结束角度，是否顺时针方向。
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(80, 80) radius:50 startAngle:-10 endAngle:50 clockwise:YES];
    path.lineWidth = 5;
    [path stroke];

}
-(void)twiceBerzier{
    UIColor *color = [UIColor yellowColor];
    [color set];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(20, 100)];
    [path addQuadCurveToPoint:CGPointMake(100, 120) controlPoint:CGPointMake(70, 0)];
    
    [path stroke];

}
-(void)threeBerzier{
    UIColor *color = [UIColor yellowColor];
    [color set];

    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(60, 80)];
    [path addCurveToPoint:CGPointMake(200, 50) controlPoint1:CGPointMake(100,  0) controlPoint2:CGPointMake( 120, 100 )];
    [path stroke];
}
-(void)fillColor{
//   UIGraphicsBeginImageContextWithOptions(CGSizeMake(100,100), NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
     CGContextSaveGState(context);
    CGRect newRect = CGRectMake(40.0, 150, 240, 50);
    UIBezierPath *newPath = [UIBezierPath bezierPathWithRect:newRect]   ;
    [newPath addClip];
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    NSArray *colors = @[(__bridge id)[UIColor colorWithRed:0.3 green:0.0 blue:0.0 alpha:0.2].CGColor,
                        (__bridge id)[UIColor colorWithRed:0.0 green:0.0 blue:1.0 alpha:0.8].CGColor];
    const CGFloat locations[] = {0.0, 1.0};
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)colors, locations);
    CGContextDrawLinearGradient(context, gradient, CGPointMake(40.0, 150.0), CGPointMake(280.0, 200.0), 0);
    
    CGContextRestoreGState(context);
}
- (void)roundColor{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGRect newRect = CGRectMake(40.0, 150, 240, 50);
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(80, 80) radius:50 startAngle:-10 endAngle:50 clockwise:YES];
    path.lineWidth = 5;
    [path stroke];
    [path addClip];
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    NSArray *colors = @[(__bridge id)[UIColor colorWithRed:0.3 green:0.0 blue:0.0 alpha:0.2].CGColor,
                        (__bridge id)[UIColor colorWithRed:0.0 green:0.0 blue:1.0 alpha:0.8].CGColor];
    const CGFloat locations[] = {0.0, 1.0};
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)colors, locations);
    CGContextDrawLinearGradient(context, gradient, CGPointMake(40.0, 150.0), CGPointMake(280.0, 200.0), 0);
    
    CGContextRestoreGState(context);

}
-(void)changePath{
    CGMutablePathRef cgPath = CGPathCreateMutable();
    CGPathAddEllipseInRect(cgPath, NULL, CGRectMake(0, 0, 300, 300));
    CGPathAddEllipseInRect(cgPath, NULL, CGRectMake(50, 50, 200, 200));
    
    // Now create the UIBezierPath object
    UIBezierPath* aPath = [UIBezierPath bezierPath];
    aPath.CGPath = cgPath;
    aPath.usesEvenOddFillRule = YES;
    
    // After assigning it to the UIBezierPath object, you can release
    // your CGPathRef data type safely.
    CGPathRelease(cgPath);
}
-(void)colorGradient{
    CGContextRef con = UIGraphicsGetCurrentContext();
    
    CGContextSaveGState(con);
    
    // 在上下文裁剪区域挖一个三角形孔
    
    CGContextMoveToPoint(con, 90, 100);
    
    CGContextAddLineToPoint(con, 100, 90);
    
    CGContextAddLineToPoint(con, 110, 100);
    
    CGContextClosePath(con);
    
    CGContextAddRect(con, CGContextGetClipBoundingBox(con));
    
    CGContextEOClip(con);
    
    //绘制一个垂线，让它的轮廓形状成为裁剪区域
    
    CGContextMoveToPoint(con, 100, 100);
    
    CGContextAddLineToPoint(con, 100, 19);
    
    CGContextSetLineWidth(con, 20);
    
    // 使用路径的描边版本替换图形上下文的路径
    
    CGContextReplacePathWithStrokedPath(con);
    
    // 对路径的描边版本实施裁剪
    
    CGContextClip(con);
    
    // 绘制渐变
    
    CGFloat locs[3] = { 0.0, 0.5, 1.0 };
    
    CGFloat colors[12] = {
        
        0.3,0.3,0.3,0.8, // 开始颜色，透明灰
        
        0.0,0.0,0.0,1.0, // 中间颜色，黑色
        
        0.3,0.3,0.3,0.8 // 末尾颜色，透明灰
        
    };
    
    CGColorSpaceRef sp = CGColorSpaceCreateDeviceGray();
    
    CGGradientRef grad = CGGradientCreateWithColorComponents (sp, colors, locs, 3);
    
    CGContextDrawLinearGradient(con, grad, CGPointMake(89,0), CGPointMake(111,0), 0);
    
    CGColorSpaceRelease(sp);
    
    CGGradientRelease(grad);
    
    CGContextRestoreGState(con); // 完成裁剪
    
    // 绘制红色箭头 
    
    CGContextSetFillColorWithColor(con, [[UIColor redColor] CGColor]); 
    
    CGContextMoveToPoint(con, 80, 25); 
    
    CGContextAddLineToPoint(con, 100, 0); 
    
    CGContextAddLineToPoint(con, 120, 25); 
    
    CGContextFillPath(con); }

-(void)changedColor{
//    CGContextRef context = UIGraphicsGetCurrentContext();
//
//    //窍门是要使用的线描边路径 ( CGContextReplacePathWithStrokedPath ) 然后将其夹 ( CGContextClip ) 要将渐变限制的路径：
//    // Create a gradient from white to red
//    CGFloat colors [] = {
//        1.0, 1.0, 1.0, 1.0,
//        1.0, 0.0, 0.0, 1.0
//    };
//    
//    CGColorSpaceRef baseSpace = CGColorSpaceCreateDeviceRGB();
//    CGGradientRef gradient = CGGradientCreateWithColorComponents(baseSpace, colors, NULL, 2);
//    CGColorSpaceRelease(baseSpace), baseSpace = NULL;
//    
//    CGContextSetLineWidth(context, 2);
//    CGContextSetLineJoin(context, kCGLineJoinRound);
//    CGContextSetLineCap(context, kCGLineCapRound);
//    
//    CGContextAddPath(context, [self pathForOverlayForMapRect:se].CGPath);
//    CGContextReplacePathWithStrokedPath(context);
//    CGContextClip(context);
//    
//    [self updateTouchablePathForMapRect:mapRect];
//    
//    // Define the start and end points for the gradient
//    // This determines the direction in which the gradient is drawn
//    CGPoint startPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMinY(rect));
//    CGPoint endPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMaxY(rect));
//    
//    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
//    CGGradientRelease(gradient), gradient = NULL;
}
@end
