//
//  SkidViewController.m
//  popTest
//
//  Created by zhisu on 15/6/4.
//  Copyright (c) 2015年 zhisu. All rights reserved.
//

#import "SkidViewController.h"
#import <POP/POP.h>
@interface SkidViewController ()<POPAnimationDelegate>
{
    UIImageView *_imageView;
    
    BOOL skid;
    
    NSInteger *_index;
    
}
@end

@implementation SkidViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor cyanColor];
    
    
    _imageView = [[UIImageView alloc]init];
    _imageView.userInteractionEnabled = YES;
    _imageView.backgroundColor = [UIColor redColor];
    _imageView.frame = CGRectMake(0, 0, 375, 667);
    
    UILabel *label = [[UILabel alloc]init];
    label.frame = CGRectMake(100, 100, 100, 100);
    label.text =@"隔壁老黄又去了";
    [_imageView addSubview:label];
    
    [self.view addSubview:_imageView];
    
    
//    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panGesAction:)];
//
//    [_imageView addGestureRecognizer:pan];
    
    
    UISwipeGestureRecognizer *recognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(leftAction:)];
    
    
    [recognizer setDirection:UISwipeGestureRecognizerDirectionLeft];
    [_imageView addGestureRecognizer:recognizer];
    
    
    
    UISwipeGestureRecognizer *right = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(rightAction:)];
    
    
    [right setDirection:UISwipeGestureRecognizerDirectionRight];
    [_imageView addGestureRecognizer:right];
    
    
    
    
    
    
    
    
}

-(void)panGesAction:(UIPanGestureRecognizer *)pan
{
    

  
    

    
    
}

-(void)rightAction:(UISwipeGestureRecognizer *)reght
{
    
    NSLog(@"11");
    POPSpringAnimation *pop = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    pop.toValue = [NSValue valueWithCGSize:CGSizeMake(1, 0.7)];
    
    
    [_imageView.layer pop_addAnimation:pop forKey:@"layerPositionAnimation"];
    
    POPSpringAnimation *pop1 = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    pop1.toValue = [NSValue valueWithCGPoint:CGPointMake(400, 0.5)];
    
    [_imageView.layer pop_addAnimation:pop1 forKey:@"pop1"];
}


-(void)leftAction:(UISwipeGestureRecognizer *)left
{
    POPSpringAnimation *pop = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    pop.toValue = [NSValue valueWithCGSize:CGSizeMake(1, 1)];
    
    
    [_imageView.layer pop_addAnimation:pop forKey:@"layerPositionAnimation"];
    
    POPSpringAnimation *pop1 = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    pop1.toValue = [NSValue valueWithCGPoint:CGPointMake(187, 0)];
    
    [_imageView.layer pop_addAnimation:pop1 forKey:@"pop1"];
   
    
    
}

-(void)addDecayPositionAnimationWithVelocity:(CGPoint)velocity
{
//    POPDecayAnimation *anim = [POPDecayAnimation animationWithPropertyNamed:kPOPLayerPosition];
//    
//    anim.velocity = [NSValue valueWithCGPoint:CGPointMake(velocity.x, velocity.y)];
//    
//
//    anim.deceleration = 0.998;
//    
//    [_imageView.layer pop_addAnimation:anim forKey:@"AnimationPosition"];
//    
//    

    
}



#pragma mark _skid
- (void)pop_animationDidApply:(POPDecayAnimation *)anim
{
    
    BOOL isSkid = !CGRectContainsRect(self.view.frame, _imageView.frame);
    
    if (isSkid) {
        //当前速度
       CGPoint currentVelocity = [anim.velocity CGPointValue];
        CGPoint velocity = CGPointMake(currentVelocity.x, -currentVelocity.y);
        POPSpringAnimation *positionAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPosition];
          positionAnimation.velocity = [NSValue valueWithCGPoint:velocity];
           positionAnimation.toValue = [NSValue valueWithCGPoint:self.view.center];
      
        [_imageView.layer pop_addAnimation:positionAnimation forKey:@"layerPositionAnimation"];
        
    }
    
    
}



@end
