//
//  Graphics.m
//  popTest
//
//  Created by zhisu on 15/6/30.
//  Copyright (c) 2015年 zhisu. All rights reserved.
//

#import "Graphics.h"
#import "BasicView.h"
#import <pop/POP.h>
@interface Graphics ()
{
    UIView *_view;
    CAShapeLayer *layer1;
    
}
@end

@implementation Graphics

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor whiteColor];
    
//    //创建一个视图
//    BasicView *bView = [[BasicView alloc] initWithFrame:CGRectMake(30, 80, 300, 500)];
//    bView.backgroundColor = [UIColor whiteColor];
//    [self.view addSubview:bView];
    
    
    
    UIView *bgview = [[UIView alloc]initWithFrame:CGRectMake(10, 100, 300, 500)];
    
    [self.view addSubview:bgview];
    
    
    
    //创建一个贝塞尔曲线
//    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(100/3.f, 100.f) radius:100/2.f startAngle:0 endAngle:M_PI*3 clockwise:YES];
    
    CGFloat lineWidth = 4.f;
    CGFloat radius = CGRectGetWidth(self.view.bounds)/2 - lineWidth/2;
      CGRect rect = CGRectMake(lineWidth/2, lineWidth/2, radius * 2, radius * 2);
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius];
    
    
    //创建一个shapelayer
    layer1 = [CAShapeLayer layer];
    layer1.frame = bgview.bounds;
    layer1.strokeColor = [UIColor redColor].CGColor;//边缘线的颜色
    layer1.fillColor = [UIColor clearColor].CGColor;//闭环填充的颜色
    layer1.lineCap = kCALineCapSquare;//边缘线的类型
    layer1.path = path.CGPath;//从贝赛尔曲线获取到形状
    layer1.lineWidth = 4.0f;//线条宽度
    layer1.strokeStart = 0.0f;
    layer1.strokeEnd = 0.1f;
    [bgview.layer addSublayer:layer1];
    
    POPSpringAnimation *strokeAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPShapeLayerStrokeEnd];
   // strokeAnimation.toValue = @(strokeEnd);
    strokeAnimation.toValue = [NSNumber numberWithFloat:0.1f];
    strokeAnimation.fromValue = [NSNumber numberWithFloat:0.f];
    strokeAnimation.springBounciness = 12.f;
    strokeAnimation.removedOnCompletion = NO;
    [layer1 pop_addAnimation:strokeAnimation forKey:@"layerStrokeAnimation"];
    

    
//    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
//    pathAnimation.duration = 1;
//    pathAnimation.fromValue = [NSNumber numberWithFloat:0.5f];
//    pathAnimation.toValue = [NSNumber numberWithFloat:0.8f];
//    [layer1 addAnimation:pathAnimation forKey:@"pathAnimation"];
//    
//    
    UIButton *btn = [[UIButton alloc]init];
    btn.frame = CGRectMake(100, 500, 30, 30);
    [btn addTarget:self action:@selector(paly) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:btn];


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
