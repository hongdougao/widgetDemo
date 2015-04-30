//
//  ViewController.m
//  widgetDemo
//
//  Created by Yangyue on 15/3/12.
//  Copyright (c) 2015年 mac. All rights reserved.
//
#define degreesToRadians(x) (M_PI*(x)/180.0) //把角度转换成PI的方式
#define  PROGREESS_WIDTH 80 //圆直径
#define PROGRESS_LINE_WIDTH 4 //弧线的宽度
#import "ViewController.h"
#import "ColorFulView.h"
#import <QuartzCore/QuartzCore.h>
#import "UIColor+HexColor.h"
#import "BeizierPathView.h"
@interface ViewController ()
@property (nonatomic,strong)CAShapeLayer *trackLayer;
@property (nonatomic,strong)UIView *roundView;

@property (nonatomic,strong)CAShapeLayer * progressLayer;

@end

@implementation ViewController
-(UIView *)roundView{
    if (!_roundView) {
        _roundView = [[UIView alloc]initWithFrame:CGRectMake(80, 80, 80, 80)];
    }
    return _roundView;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview:self.roundView];
//     [self addColor];
//    [self fullFilledBezierPath];
//    [self grayCircle];
//    [self addSteper];
//    [self addBeizerPath];
//    [self drawDownBG];
    [self colorView];
}
-(void)colorView{
    ColorFulView *view= [[ColorFulView alloc ]init];
    view.frame = [[UIScreen mainScreen]bounds];

    [self.view addSubview:view];

}
-(void)drawDownBG{
 
    BeizierPathView *view = [[BeizierPathView alloc]init];
    view.frame = [[UIScreen mainScreen]bounds];
    [self.view addSubview:view];
 
}
//-(void)colorGradient{
//    CGContextRef con = UIGraphicsGetCurrentContext();
//    
//    CGContextSaveGState(con);
//    
//    // 在上下文裁剪区域挖一个三角形孔
//    
//    CGContextMoveToPoint(con, 90, 100);
//    
//    CGContextAddLineToPoint(con, 100, 90);
//    
//    CGContextAddLineToPoint(con, 110, 100);
//    
//    CGContextClosePath(con);
//    
//    CGContextAddRect(con, CGContextGetClipBoundingBox(con));
//    
//    CGContextEOClip(con);
//    
//    //绘制一个垂线，让它的轮廓形状成为裁剪区域
//    
//    CGContextMoveToPoint(con, 100, 100);
//    
//    CGContextAddLineToPoint(con, 100, 19);
//    
//    CGContextSetLineWidth(con, 20);
//    
//    // 使用路径的描边版本替换图形上下文的路径
//    
//    CGContextReplacePathWithStrokedPath(con);
//    
//    // 对路径的描边版本实施裁剪
//    
//    CGContextClip(con);
//    
//    // 绘制渐变
//    
//    CGFloat locs[3] = { 0.0, 0.5, 1.0 };
//    
//    CGFloat colors[12] = {
//        
//        0.3,0.3,0.3,0.8, // 开始颜色，透明灰
//        
//        0.0,0.0,0.0,1.0, // 中间颜色，黑色
//        
//        0.3,0.3,0.3,0.8 // 末尾颜色，透明灰
//        
//    };
//    
//    CGColorSpaceRef sp = CGColorSpaceCreateDeviceGray();
//    
//    CGGradientRef grad = CGGradientCreateWithColorComponents (sp, colors, locs, 3);
//    
//    CGContextDrawLinearGradient(con, grad, CGPointMake(89,0), CGPointMake(111,0), 0);
//    
//    CGColorSpaceRelease(sp);
//    
//    CGGradientRelease(grad);
//    
//    CGContextRestoreGState(con); // 完成裁剪
//    
//    // 绘制红色箭头
//    
//    CGContextSetFillColorWithColor(con, [[UIColor redColor] CGColor]);
//    
//    CGContextMoveToPoint(con, 80, 25);
//    
//    CGContextAddLineToPoint(con, 100, 0);
//    
//    CGContextAddLineToPoint(con, 120, 25);
//    
//    CGContextFillPath(con); }
//
//-(void)fillColor{
//    
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextSaveGState(context);
//    CGRect newRect = CGRectMake(40.0, 150, 240, 50);
//    UIBezierPath *newPath = [UIBezierPath bezierPathWithRect:newRect]   ;
//    [newPath addClip];
//    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
//    NSArray *colors = @[(__bridge id)[UIColor colorWithRed:0.3 green:0.0 blue:0.0 alpha:0.2].CGColor,
//                        (__bridge id)[UIColor colorWithRed:0.0 green:0.0 blue:1.0 alpha:0.8].CGColor];
//    const CGFloat locations[] = {0.0, 1.0};
//    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)colors, locations);
//    CGContextDrawLinearGradient(context, gradient, CGPointMake(40.0, 150.0), CGPointMake(280.0, 200.0), 0);
//    
//    CGContextRestoreGState(context);
//}
//-(void)addBeizerPath{
//    BeizierPathView *view = [[BeizierPathView alloc]init];
//    view.frame = [[UIScreen mainScreen] bounds];
////    view.frame = CGRectMake(80, 80, 100, 100);
//    [self.view addSubview:view];
//
//}
//-(void)addSteper{
//    UIStepper *stepper = [[UIStepper alloc]initWithFrame:CGRectMake(80, 80, 80, 80)];
//    stepper.minimumValue = 0;
//    stepper.maximumValue = 10;
//    stepper.value = 2;
//    stepper.center = CGPointMake(160, 240);
//    [stepper addTarget:self action:@selector(addAlert:) forControlEvents:UIControlEventValueChanged];
//    
//    [self.view addSubview:stepper];
//
//}
//-(void)addAlert:(UIStepper *)stepper{
//    NSLog(@"value changed:%f",stepper.value);
// }
//-(void)addXview{
//
//    ColorFulView *view = [[ColorFulView alloc]initWithFrame:[UIScreen mainScreen].bounds];
//    view.backgroundColor =[UIColor whiteColor];
//    [self.view addSubview:view];
//}
//-(void)addColor{
//    
//    //    _trackLayer = [CAShapeLayer layer];//创建一个track shape layer
//    //    _trackLayer.frame = self.roundView.bounds;
//    //    [self.roundView.layer addSublayer:_trackLayer];
//    //    _trackLayer.fillColor = [[UIColor clearColor] CGColor];
//    //    _trackLayer.strokeColor = [UIColor redColor].CGColor;
//    ////    _trackLayer.strokeColor = [_strokeColor CGColor];//指定path的渲染颜色
//    //    _trackLayer.opacity = 0.25; //背景同学你就甘心做背景吧，不要太明显了，透明度小一点
//    //    _trackLayer.lineCap = kCALineCapRound;//指定线的边缘是圆的
//    //    _trackLayer.lineWidth = PROGRESS_LINE_WIDTH;//线的宽度
//    
//    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(40, 40) radius:(PROGREESS_WIDTH-PROGRESS_LINE_WIDTH)/2 startAngle:degreesToRadians(-210) endAngle:degreesToRadians(30) clockwise:YES];//上面说明过了用来构建圆形
//    _trackLayer.path =[path CGPath]; //把path传递給layer，然后layer会处理相应的渲染，整个逻辑和CoreGraph是一致的。
//    
//    
//    
//    
//    _progressLayer = [CAShapeLayer layer];
//    _progressLayer.frame = self.roundView.bounds;
//    _progressLayer.fillColor =  [[UIColor clearColor] CGColor];
//    //    _progressLayer.strokeColor  = [PROCESS_COLOR CGColor];
//    _progressLayer.strokeColor  = [[UIColor yellowColor] CGColor];
//    
//    _progressLayer.lineCap = kCALineCapRound;
//    _progressLayer.lineWidth = PROGRESS_LINE_WIDTH;
//    _progressLayer.path = [path CGPath];
//    //    _progressLayer.strokeEnd = 0;
//    
//    CALayer *gradientLayer = [CALayer layer];
//    CAGradientLayer *gradientLayer1 =  [CAGradientLayer layer];
//    gradientLayer1.frame = CGRectMake(0, 0, self.roundView.frame.size.width/2, self.roundView.frame.size.height);
//    [gradientLayer1 setColors:[NSArray arrayWithObjects:(id)[[UIColor redColor] CGColor],[(id)[UIColor yellowColor] CGColor], nil]];
//    [gradientLayer1 setLocations:@[@0.5,@0.9,@1 ]];
//    [gradientLayer1 setStartPoint:CGPointMake(0.5, 1)];
//    [gradientLayer1 setEndPoint:CGPointMake(0.5, 0)];
//    [gradientLayer addSublayer:gradientLayer1];
//    
//    CAGradientLayer *gradientLayer2 =  [CAGradientLayer layer];
//    [gradientLayer2 setLocations:@[@0.1,@0.5,@1]];
//    gradientLayer2.frame = CGRectMake(self.roundView.frame.size.width/2, 0, self.roundView.frame.size.width/2, self.roundView.frame.size.height);
//    [gradientLayer2 setColors:[NSArray arrayWithObjects:(id)[[UIColor yellowColor] CGColor],(id)[[UIColor blueColor] CGColor], nil]];
//    [gradientLayer2 setStartPoint:CGPointMake(0.5, 0)];
//    [gradientLayer2 setEndPoint:CGPointMake(0.5, 1)];
//    [gradientLayer addSublayer:gradientLayer2];
//    
//    
//    
//    [gradientLayer setMask:_progressLayer]; //用progressLayer来截取渐变层
//    [self.roundView.layer addSublayer:gradientLayer];
//
//
//}
//-(void)grayCircle{
//    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(40, 40) radius:(PROGREESS_WIDTH-PROGRESS_LINE_WIDTH)/2 startAngle:degreesToRadians(-210) endAngle:degreesToRadians(30) clockwise:YES];//上面说明过了用来构建圆形
//    _trackLayer.path =[path CGPath]; //把path传递給layer，然后layer会处理相应的渲染，整个逻辑和CoreGraph是一致的。
//    
//    
//    
//    
//    _progressLayer = [CAShapeLayer layer];
//    _progressLayer.frame = self.roundView.bounds;
//    _progressLayer.fillColor =  [[UIColor clearColor] CGColor];
//    //    _progressLayer.strokeColor  = [PROCESS_COLOR CGColor];
//    _progressLayer.strokeColor  = [[UIColor yellowColor] CGColor];
//    
//    _progressLayer.lineCap = kCALineCapRound;
//    _progressLayer.lineWidth = PROGRESS_LINE_WIDTH;
//    _progressLayer.path = [path CGPath];
//    //    _progressLayer.strokeEnd = 0;
//    
//    CALayer *gradientLayer = [CALayer layer];
//    CAGradientLayer *gradientLayer1 =  [CAGradientLayer layer];
//    gradientLayer1.frame = CGRectMake(0, 0, self.roundView.frame.size.width , self.roundView.frame.size.height);
//    [gradientLayer1 setColors:[NSArray arrayWithObjects:(id)[[UIColor redColor] CGColor],[(id)[UIColor yellowColor] CGColor], nil]];
//    [gradientLayer1 setLocations:@[@0.5,@0.9,@1 ]];
//    [gradientLayer1 setStartPoint:CGPointMake(0.5, 1)];
//    [gradientLayer1 setEndPoint:CGPointMake(0.5, 0)];
//    [gradientLayer addSublayer:gradientLayer1];
//    
////    CAGradientLayer *gradientLayer2 =  [CAGradientLayer layer];
////    [gradientLayer2 setLocations:@[@0.1,@0.5,@1]];
////    gradientLayer2.frame = CGRectMake(self.roundView.frame.size.width/2, 0, self.roundView.frame.size.width/2, self.roundView.frame.size.height);
////    [gradientLayer2 setColors:[NSArray arrayWithObjects:(id)[[UIColor yellowColor] CGColor],(id)[[UIColor blueColor] CGColor], nil]];
////    [gradientLayer2 setStartPoint:CGPointMake(0.5, 0)];
////    [gradientLayer2 setEndPoint:CGPointMake(0.5, 1)];
////    [gradientLayer addSublayer:gradientLayer2];
//    
//    
//    
//    [gradientLayer setMask:_progressLayer]; //用progressLayer来截取渐变层
//    [self.roundView.layer addSublayer:gradientLayer];
//
//}
//-(void)fullFilledBezierPath{
//   
//    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    UIColor *gradientColor = [UIColor colorWithRed:0.51 green:0.0 blue:0.49 alpha:1.0];
//    NSArray *gradientColors = [NSArray arrayWithObjects:
//                               (id)[UIColor blueColor].CGColor,
//                               (id)gradientColor.CGColor,
//                               (id)[UIColor redColor].CGColor, nil];
//    CGFloat gradientLocations[] = {0, 0.5, 1};
//    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (CFArrayRef)gradientColors, gradientLocations);
//    
//    
//    UIBezierPath *roundedRectanglePath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(10, 10, 200, 200) cornerRadius:6];
//    CGContextSaveGState(context);
//    [roundedRectanglePath fill];
//    [roundedRectanglePath addClip];
//    CGContextDrawLinearGradient(context, gradient, CGPointMake(10, 10), CGPointMake(210, 10), 0);
//    CGColorSpaceRelease(colorSpace);
//    CGGradientRelease(gradient);
//}
//-(void)setProgress{
//
//    CAShapeLayer *progressShapeLayer = [[CAShapeLayer alloc] initWithLayer:self.roundView.layer];
//    progressShapeLayer.bounds = self.roundView.layer.bounds;
//    progressShapeLayer.position = CGPointMake(CGRectGetMidX(self.roundView.bounds), CGRectGetMidY(self.roundView.bounds));
//    progressShapeLayer.fillColor = [UIColor clearColor].CGColor;
////    progressShapeLayer.lineWidth = SVPullToRefreshViewLineWidth;
//    progressShapeLayer.lineCap = @"round";
//    self.progressLayer = progressShapeLayer;
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
