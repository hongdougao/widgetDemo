//
//  ColorFulView.m
//  widgetDemo
//
//  Created by Yangyue on 15/3/30.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "ColorFulView.h"
#define pi 3.14159265359
#define   DEGREES_TO_RADIANS(degrees)  ((pi * degrees)/ 180)
@implementation ColorFulView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)drawRect:(CGRect)rect{
//    [self drawX];
    [self drawBG];
}
-(void)drawX{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, nil, 20,20);
    CGPathAddLineToPoint(path, nil, 100, 100);
    CGPathMoveToPoint(path, nil, 100,20);

    CGPathAddLineToPoint(path, nil, 20, 100 );


    CGContextAddPath(context, path);
    
    
    CGContextSetRGBStrokeColor(context, 1.0, 0, 0, 1);//设置笔触颜色
     CGContextSetLineWidth(context, 1.0);
    CGContextDrawPath(context, kCGPathFillStroke);//最后一个参数是填充类型

    CGPathRelease(path);
}
-(void)drawBG{
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIGraphicsPushContext(context);
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, nil, 0, 200);
    CGContextAddPath(context, path);

    CGPathAddLineToPoint(path, nil, (320 - 120)/2, 200);
    /*  
     UIBezierPath *bPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(320/2, 200) radius:60 startAngle:0 endAngle :DEGREES_TO_RADIANS(  180) clockwise:YES];
     */
    CGContextAddArc(context, 320/2, 200, 60,   DEGREES_TO_RADIANS(  180), 0,YES);
    
    CGContextSetRGBStrokeColor(context, 1.0, 0, 0, 1);//设置笔触颜色

    
    CGContextSetLineWidth(context, 1.0);
    
    CGPathMoveToPoint(path, nil, (320 - 120)/2+120, 200);
    CGPathAddLineToPoint(path, nil, 320, 200);
    CGContextAddPath(context, path);

    CGContextDrawPath(context, kCGPathFillStroke);//最后一个参数是填充类型
    CGPathRelease(path);
/*
    CGContextMoveToPoint(context,150,50);//圆弧的起始点
    
    CGContextAddArcToPoint(context,100,80,130,150,50);
                                    x1  y1 x2 y2 半径
    是说从（150，50）到（100，80）画一条线，然后再从（100，80）到（130，150）画一条线，从这两条线（无限延伸的） 和半径50可以确定一条弧，
 
    而
    
    CGContextAddArc(context, 100, 100, 30, 0, M_PI, 1);
    
    比较简单了，(100,100)为圆心的坐标，30为半径，（0，M_PI）为起始角度和结束角度，1为顺时针，0 为逆时针
    
    是说从（150，50）到（100，80）画一条线，然后再从（100，80）到（130，150）画一条线，从这两条线（无限延伸的） 和半径50可以确定一条弧
*/

}
-(void)drawSanjiao{
    //1.取得图形上下文对象
    CGContextRef context = UIGraphicsGetCurrentContext();
    //2.创建路径对象
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, nil, 20, 50);
    CGPathAddLineToPoint(path, nil, 20, 100);
    CGPathAddLineToPoint(path, nil, 300, 100);
    //3.添加路径到图形上下文
    CGContextAddPath(context, path);
    
    //4.设置图形上下文状态属性
    CGContextSetRGBStrokeColor(context, 1.0, 0, 0, 1);//设置笔触颜色
    CGContextSetRGBFillColor(context, 0, 1.0, 0, 1);//设置填充色
    CGContextSetLineWidth(context, 2.0);//设置线条宽度
    CGContextSetLineCap(context, kCGLineCapRound);//设置顶点样式,（20,50）和（300,100）是顶点
    CGContextSetLineJoin(context, kCGLineJoinRound);//设置连接点样式，(20,100)是连接点
    
    
    /*设置线段样式
     phase:虚线开始的位置
     lengths:虚线长度间隔（例如下面的定义说明第一条线段长度8，然后间隔3重新绘制8点的长度线段，当然这个数组可以定义更多元素）
     count:虚线数组元素个数
     */
    
    CGFloat lengths [2] = {18 , 9};
    CGContextSetLineDash(context, 0, lengths, 2);
    
    /*设置阴影
     context:图形上下文
     offset:偏移量
     blur:模糊度
     color:阴影颜色
     */
    
    CGColorRef color = [UIColor grayColor].CGColor;//颜色转化，由于Quartz 2D跨平台，所以其中不能使用UIKit中的对象，但是UIkit提供了转化方法
    CGContextSetShadowWithColor(context, CGSizeMake(2, 2), 0.8, color);
    
    //5.绘制图像到指定图形上下文
    /*CGPathDrawingMode是填充方式,枚举类型
     kCGPathFill:只有填充（非零缠绕数填充），不绘制边框
     kCGPathEOFill:奇偶规则填充（多条路径交叉时，奇数交叉填充，偶交叉不填充）
     kCGPathStroke:只有边框
     kCGPathFillStroke：既有边框又有填充
     kCGPathEOFillStroke：奇偶填充并绘制边框
     */
    CGContextDrawPath(context, kCGPathFillStroke);//最后一个参数是填充类型
    //6.释放对象
    CGPathRelease(path);

}

@end
