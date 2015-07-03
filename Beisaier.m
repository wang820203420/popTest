//
//  Beisaier.m
//  popTest
//
//  Created by zhisu on 15/7/1.
//  Copyright (c) 2015年 zhisu. All rights reserved.
//

#import "Beisaier.h"
#import <pop/POP.h>
@interface Beisaier ()
{
       CAShapeLayer *layer1;
    UIBezierPath *aPath1;
}
@end

@implementation Beisaier

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor whiteColor];
    
    


    

    UIButton *btn = [[UIButton alloc]init];
    btn.frame = CGRectMake(100, 500, 30, 30);
    [btn addTarget:self action:@selector(paly) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:btn];
    
    UIView *view1 = [[UIView alloc]init];
    view1.frame = CGRectMake(30, 100,300, 400);
    [self.view addSubview:view1];
    
    
    aPath1 = [UIBezierPath bezierPath];
    
    //5角多边形
    // Set the starting point of the shape.
//    [aPath1 moveToPoint:CGPointMake(100.0, 0.0)];
//    [aPath1 addLineToPoint:CGPointMake(200.0, 40.0)];
//    [aPath1 addLineToPoint:CGPointMake(160, 140)];
//    [aPath1 addLineToPoint:CGPointMake(40.0, 140)];
//    [aPath1 addLineToPoint:CGPointMake(0.0, 40.0)];
//    [aPath1 closePath];//第五条线通过调用closePath方法得到的
    
    aPath1.lineWidth = 5.0;
    aPath1.lineCapStyle = kCGLineCapRound;  //线条拐角
    aPath1.lineJoinStyle = kCGLineCapRound;//终点处理
    [aPath1 moveToPoint:CGPointMake(20, 100)];//起点
    //二次曲线
    //元素1:CurveToPoint:终点
    //元素2:controlPoint:曲线顶部弯曲点
    //[aPath1 addQuadCurveToPoint:CGPointMake(120, 100) controlPoint:CGPointMake(50, 0)];
   
    //三次曲线
    //元素1:CurveToPoint：曲线终点
    //元素2:controlPoint1：曲线顶部弯曲点
    //元素3:controlPoint2：第三次弯曲点的位置
     [aPath1 addCurveToPoint:CGPointMake(200, 50) controlPoint1:CGPointMake(110, 0) controlPoint2:CGPointMake(110, 200)];
  
    [aPath1 addQuadCurveToPoint:CGPointMake(300, 100) controlPoint:CGPointMake(245, 0)];

    
    
    [aPath1 stroke];
    
    
    
    //创建一个shapelayer
    layer1 = [CAShapeLayer layer];
    layer1.frame = view1.bounds;
    layer1.strokeColor = [UIColor redColor].CGColor;//边缘线的颜色
    layer1.fillColor = [UIColor clearColor].CGColor;//闭环填充的颜色
    layer1.lineCap = kCALineCapSquare;//边缘线的类型
    layer1.path = aPath1.CGPath;//从贝赛尔曲线获取到形状
    layer1.lineWidth = 4.0f;//线条宽度
    layer1.strokeStart = 0.0f;
    layer1.strokeEnd = 0.1f;
    [view1.layer addSublayer:layer1];
    
    POPSpringAnimation *strokeAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPShapeLayerStrokeEnd];
    // strokeAnimation.toValue = @(strokeEnd);
    strokeAnimation.toValue = [NSNumber numberWithFloat:1.0f];
    strokeAnimation.fromValue = [NSNumber numberWithFloat:0.f];
    //strokeAnimation.springSpeed = 10.0;
    //反弹系数越大，速度就越慢，单一的速度并不会减缓动画的速度
    strokeAnimation.springBounciness = 120.f;
    //strokeAnimation.removedOnCompletion = NO;
    [layer1 pop_addAnimation:strokeAnimation forKey:@"layerStrokeAnimation"];
    
    
    
    
}

-(void)paly
{

    POPSpringAnimation *strokeAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPShapeLayerStrokeEnd];
    // strokeAnimation.toValue = @(strokeEnd);
    strokeAnimation.toValue = [NSNumber numberWithFloat:1.0f];
    strokeAnimation.fromValue = [NSNumber numberWithFloat:0.f];
    //strokeAnimation.springSpeed = 10.0;
    //反弹系数越大，速度就越慢，单一的速度并不会减缓动画的速度
    strokeAnimation.springBounciness = 120.f;
    //strokeAnimation.removedOnCompletion = NO;
    [layer1 pop_addAnimation:strokeAnimation forKey:@"layerStrokeAnimation"];
    
    
    
    
}
@end
