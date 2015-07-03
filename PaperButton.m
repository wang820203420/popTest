//
//  PaperButton.m
//  popTest
//
//  Created by zhisu on 15/6/5.
//  Copyright (c) 2015年 zhisu. All rights reserved.
//

#import "PaperButton.h"

#import <pop/POP.h>

@interface PaperButton ()

//上中下层
@property(nonatomic)CALayer *topLayer;
@property(nonatomic)CALayer *middleLayer;
@property(nonatomic)CALayer *bottomLayer;
@property(nonatomic)BOOL showMenu;


@end


@implementation PaperButton


+(instancetype)button
{
    return [self buttonWithOrigin:CGPointZero];
}



+(instancetype)buttonWithOrigin:(CGPoint)origin
{
    
    return [[self alloc]initWithFrame:CGRectMake(origin.x, origin.y, 24, 17)];
}


//initWithFrame方法用来初始化并返回一个新的视图对象,根据指定的CGRect（尺寸）。
-(id)initWithFrame:(CGRect)frame
{
    
    
    self = [super initWithFrame:frame];// 先调用父类的initWithFrame方法
    if (self) {
        // 再自定义该类（UIView子类）的初始化操作。
        [self setup];
        
    }
    return self;
    
}



//实列方法
#pragma mark - Instance methods

//自从iOS7，UIView有了一个新的属性tintColor，它是用来在视觉上说明屏幕上哪些控件是活跃的或者有相关的活动。
-(void)tintColorDidChange
{
    CGColorRef color = [self.tintColor CGColor];
    
    self.topLayer.backgroundColor = color;
    self.middleLayer.backgroundColor = color;
    self.bottomLayer.backgroundColor = color;
    
    
}

#pragma mark - Private Instance methods



-(void)animateToMenu
{
    [self removeAllAnimations];
    
    
    CGFloat height = CGRectGetHeight(self.topLayer.bounds);
    
    
    
    POPBasicAnimation *fadeAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerOpacity];
    fadeAnimation.duration = 0.3;
    fadeAnimation.toValue = @1;
    
    POPBasicAnimation *positionTopAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPosition];
    positionTopAnimation.duration = 0.3;
    positionTopAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(CGRectGetMidX(self.bounds),
                                                                         roundf(CGRectGetMinY(self.bounds)+(height/2)))];
    
    POPBasicAnimation *positionBottomAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPosition];
    positionTopAnimation.duration = 0.3;
    positionBottomAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(CGRectGetMidX(self.bounds),
                                                                            roundf(CGRectGetMaxY(self.bounds)-(height/2)))];
    
    
    
    
    POPSpringAnimation *transformTopAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerRotation];
    transformTopAnimation.toValue = @(0);
    transformTopAnimation.springBounciness = 20;//弹力
    transformTopAnimation.springSpeed = 20;//速度
    transformTopAnimation.dynamicsTension =1000;//弹性张力
    
    
    
    POPSpringAnimation *transformBottomAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerRotation];
    transformBottomAnimation.toValue = @(0);
    transformBottomAnimation.springBounciness = 20;
    transformBottomAnimation.springSpeed = 20;
    transformBottomAnimation.dynamicsTension = 1000;
    
    
    
    [self.topLayer pop_addAnimation:positionTopAnimation forKey:@"positionTopAnimation"];
    
    [self.topLayer pop_addAnimation:transformTopAnimation forKey:@"rotateTopAnimation"];
    [self.middleLayer pop_addAnimation:fadeAnimation forKey:@"fadeAnimation"];
    [self.bottomLayer pop_addAnimation:positionBottomAnimation forKey:@"positionBottomAnimation"];
    [self.bottomLayer pop_addAnimation:transformBottomAnimation forKey:@"rotateBottomAnimation"];
    
    
}


-(void)animateToClose
{
    [self removeAllAnimations];
    CGPoint center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    
    
    POPBasicAnimation *fadeAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerOpacity];
    
    fadeAnimation.toValue = @0;
    fadeAnimation.duration = 0.3;
    
    POPBasicAnimation *positionTopAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPosition];
    positionTopAnimation.toValue = [NSValue valueWithCGPoint:center];
    positionTopAnimation.duration = 0.3;
    
    
    
    
    POPBasicAnimation *positionBottomAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPosition];
    positionBottomAnimation.toValue = [NSValue valueWithCGPoint:center];
    positionTopAnimation.duration = 0.3;

    POPSpringAnimation *transformTopAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerRotation];
    transformTopAnimation.toValue = @(M_PI_4);
    transformTopAnimation.springBounciness = 20.f;
    transformTopAnimation.springSpeed = 20;
    transformTopAnimation.dynamicsTension = 1000;
    
    POPSpringAnimation *transformBottomAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerRotation];
    transformBottomAnimation.toValue = @(-M_PI_4);
    transformBottomAnimation.springBounciness = 20.0f;
    transformBottomAnimation.springSpeed = 20;
    transformBottomAnimation.dynamicsTension = 1000;
    
    [self.topLayer pop_addAnimation:positionTopAnimation forKey:@"positionTopAnimation"];
    [self.topLayer pop_addAnimation:transformTopAnimation forKey:@"rotateTopAnimation"];
    [self.middleLayer pop_addAnimation:fadeAnimation forKey:@"fadeAnimation"];
    [self.bottomLayer pop_addAnimation:positionBottomAnimation forKey:@"positionBottomAnimation"];
    [self.bottomLayer pop_addAnimation:transformBottomAnimation forKey:@"rotateBottomAnimation"];
    
    
    
    
    
    
}



-(void)setup
{
    
    CGFloat height = 2;
    CGFloat width = CGRectGetWidth(self.bounds);
    CGFloat cornerRadius = 1;
    
    CGColorRef color = [self.tintColor CGColor];
    
    
    self.topLayer = [CALayer layer];
    self.topLayer .frame = CGRectMake(0, CGRectGetMinY(self.bounds), width, height);
    self.topLayer.cornerRadius = cornerRadius;
    self.topLayer.backgroundColor = color;
    
    
    
    self.middleLayer = [CALayer layer];
    self.middleLayer.frame = CGRectMake(0, CGRectGetMidY(self.bounds)-(height/2), width, height);
    
    self.middleLayer.cornerRadius = cornerRadius;
    self.middleLayer.backgroundColor = color;
    
    
    self.bottomLayer = [CALayer layer];
    self.bottomLayer.frame = CGRectMake(0, CGRectGetMaxY(self.bounds)-height, width, height);
    
    self.bottomLayer.cornerRadius = cornerRadius;
    self.bottomLayer.backgroundColor = color;
    
    
    [self.layer addSublayer:self.topLayer];
    [self.layer addSublayer:self.middleLayer];
    [self.layer addSublayer:self.bottomLayer];
    
    
    [self addTarget:self action:@selector(touchUpInsideHandler:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
    
    
}

-(void)touchUpInsideHandler:(PaperButton *)sender
{
    
    if (self.showMenu) {
        [self animateToMenu];
    }else
    {
        
        [self animateToClose];
    }
    
    self.showMenu = !self.showMenu;
    
    
}


-(void)removeAllAnimations
{
    [self.topLayer  pop_removeAllAnimations];
    [self.middleLayer pop_removeAllAnimations];
    [self.bottomLayer pop_removeAllAnimations];
    
}

@end
