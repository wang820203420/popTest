//
//  ViewController.m
//  popTest
//
//  Created by zhisu on 15/6/1.
//  Copyright (c) 2015年 zhisu. All rights reserved.
//

#import "ViewController.h"
#import <pop/POP.h>
@interface ViewController ()
{
    UIButton *_btn;
    UIImageView *_imageView;
    
    BOOL _isOpened;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];

    
    [self createBtn];
    
    
}

-(void)createBtn
{
    
    
   _btn = [UIButton buttonWithType:UIButtonTypeSystem];
    _btn.frame = CGRectMake(100, 100, 100, 100);
    [_btn setTitle:@"wq" forState:UIControlStateNormal];
    [_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _btn.backgroundColor = [UIColor redColor];
    [_btn addTarget:self action:@selector(playAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btn];
    
    
    
    _imageView= [[UIImageView alloc]init];
    _imageView.backgroundColor = [UIColor blueColor];
    _imageView.frame = CGRectMake(100, 200, 200, 200);
    _imageView.userInteractionEnabled = YES;
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handlePan:)];
    [_imageView addGestureRecognizer:pan];
    [self.view addSubview:_imageView];
    
    
    
    
    
    
    UITapGestureRecognizer *gestureForSpring = [[UITapGestureRecognizer alloc]init];
    [gestureForSpring addTarget:self action:@selector(changsSize:)];
    [self.view addGestureRecognizer:gestureForSpring];
 
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"+" style:UIBarButtonItemStyleDone target:self action:@selector(showPop)];

    
    
}

-(void)showPop
{
    
    
    
    if (_isOpened) {
        [self hidePop];
        return;
    }
    _isOpened = YES;
    
    
    
    POPSpringAnimation *positionAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewFrame];
    positionAnimation.fromValue = [NSValue valueWithCGRect:CGRectMake(300, 0, 0, 0)];
    positionAnimation.toValue = [NSValue valueWithCGRect:CGRectMake(300, 100, 100, 100)];
    
    positionAnimation.springBounciness = 15.0;
    positionAnimation.springSpeed = 20.0;
    
    [_imageView pop_addAnimation:positionAnimation forKey:@"frameAnimation"];
    
    
    
}

-(void)hidePop
{
    
    POPBasicAnimation *positionAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewFrame];
    positionAnimation.fromValue = [NSValue valueWithCGRect:CGRectMake(300, 10, 0, 0)];
    positionAnimation.toValue =[NSValue valueWithCGRect:CGRectMake(300, 0, 0, 0)];
    //key一样就会用后面的动画覆盖之前的
    [_imageView pop_addAnimation:positionAnimation forKey:@"frameAnimation"];
    
    _isOpened = NO;
    
}

-(void)changsSize:(UITapGestureRecognizer *)tap
{
//    //改变imgaeview的size
//    POPSpringAnimation *springAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerSize];
//    
//    CGRect rect = _imageView.frame;
//    if (rect.size.width == 100) {
//        springAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(300, 300)];
//    }
//    else
//    {
//        springAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(100, 100)];
//    }
//    
//    
//    springAnimation.springBounciness = 20.0;
//    springAnimation.springSpeed = 20.0;
//    
//    [_imageView.layer pop_addAnimation:springAnimation forKey:@"changsize"];
//    
    
    //改变position
    
    POPSpringAnimation *springAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPosition];
    
    CGPoint point = _imageView.center;
    
    if (point.y==300) {
        springAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(point.x, -230)];
    }
    else{
        springAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(point.x, 300)];
    }
    
    //弹性值
    springAnimation.springBounciness = 20.0;
    //弹性速度
    springAnimation.springSpeed = 20.0;
    
    [_imageView pop_addAnimation:springAnimation forKey:@"changeposition"];
    
}



////拖动手势
//-(void)handlePan:(UIPanGestureRecognizer *)recognizer
//{
//    POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionY];
//    //速度
//    anim.velocity = @2000;
//    //反弹－－影响动画作用的参数变化幅度
//    anim.springBounciness = 20;
//    //动态晃动率
//    anim.dynamicsMass = 5;
//    anim.springSpeed = 12;
//    //    [anim setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
//    //
//    //
//    //    }];
//    
//    [_imageView.layer pop_addAnimation:anim forKey:@"anim"];
//}


//左右摇摆
-(void)playAction
{
//    POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
//    //速度
//    anim.velocity = @2000;
//    //反弹－－影响动画作用的参数变化幅度
//    anim.springBounciness = 20;
//    //动态晃动率
//    anim.dynamicsMass = 5;
//    anim.springSpeed = 12;
////    [anim setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
////        
////       
////    }];
//    
//     [_btn.layer pop_addAnimation:anim forKey:@"anim"];
//    
//    
 
}


@end
