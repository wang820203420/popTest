//
//  ViewController.m
//  popTest
//
//  Created by zhisu on 15/6/1.
//  Copyright (c) 2015年 zhisu. All rights reserved.
//

#import "ViewController.h"
#import "ButtonViewController.h"
#import "CrossViewController.h"
#import "SkidViewController.h"
#import "PasswordViewController.h"
#import "Graphics.h"
#import "Beisaier.h"
#import <pop/POP.h>
@interface ViewController ()
{
    UIButton *_btn;
     UIButton *_btnSkid;
    UIButton *_btnCross;
     UIButton *_btnPassWord;
    UIButton *_btnGraphics;
     UIButton *_btnBeisaier;
    UIImageView *_imageView;
    
    BOOL _isOpened;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];

    
    [self createBtn];
    
    
    _btnSkid = [UIButton buttonWithType:UIButtonTypeSystem];
    _btnSkid.frame = CGRectMake(0, 100, 50, 30);
    [_btnSkid setTitle:@"侧滑" forState:UIControlStateNormal];
    [_btnSkid setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _btnSkid.backgroundColor = [UIColor redColor];
    [_btnSkid addTarget:self action:@selector(SkidAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btnSkid];
    
    
    _btnCross = [UIButton buttonWithType:UIButtonTypeSystem];
    _btnCross.frame = CGRectMake(0, 180, 50, 30);
    [_btnCross setTitle:@"交叉" forState:UIControlStateNormal];
    [_btnCross setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _btnCross.backgroundColor = [UIColor redColor];
    [_btnCross addTarget:self action:@selector(CrossAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btnCross];
    
    
    
    
    _btnPassWord = [UIButton buttonWithType:UIButtonTypeSystem];
    _btnPassWord.frame = CGRectMake(0, 230, 50, 30);
    [_btnPassWord setTitle:@"密码" forState:UIControlStateNormal];
    [_btnPassWord setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _btnPassWord.backgroundColor = [UIColor redColor];
    [_btnPassWord addTarget:self action:@selector(PassWordAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btnPassWord];
    
    
    
    _btnGraphics = [UIButton buttonWithType:UIButtonTypeSystem];
    _btnGraphics.frame = CGRectMake(0, 280, 50, 30);
    [_btnGraphics setTitle:@"绘图" forState:UIControlStateNormal];
    [_btnGraphics setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _btnGraphics.backgroundColor = [UIColor redColor];
    [_btnGraphics addTarget:self action:@selector(GraphicsAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btnGraphics];
    
    
    _btnBeisaier = [UIButton buttonWithType:UIButtonTypeSystem];
    _btnBeisaier.frame = CGRectMake(0, 320, 50, 30);
    [_btnBeisaier setTitle:@"贝塞尔" forState:UIControlStateNormal];
    [_btnBeisaier setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _btnBeisaier.backgroundColor = [UIColor redColor];
    [_btnBeisaier addTarget:self action:@selector(BeisaierAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btnBeisaier];
    
    
    
}

-(void)PassWordAction
{
    
    PasswordViewController *vc = [[PasswordViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
  
    
}

-(void)SkidAction
{
    SkidViewController *vc = [[SkidViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
    
    
}

-(void)CrossAction
{
    CrossViewController *crvc = [[CrossViewController alloc]init];
    [self.navigationController pushViewController:crvc animated:YES];
    
}

-(void)GraphicsAction
{
    
    Graphics *crvc = [[Graphics alloc]init];
    [self.navigationController pushViewController:crvc animated:YES];
    
    
    
}


-(void)BeisaierAction
{
    
    Beisaier *crvc = [[Beisaier alloc]init];
    [self.navigationController pushViewController:crvc animated:YES];
    
    
    
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
    //拖动
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handlePan:)];
    [_imageView addGestureRecognizer:pan];
    [self.view addSubview:_imageView];
    
    
    
    
    
    //点击手势
    UITapGestureRecognizer *gestureForSpring = [[UITapGestureRecognizer alloc]init];
    [gestureForSpring addTarget:self action:@selector(changsSize:)];
    [self.view addGestureRecognizer:gestureForSpring];
 
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"+" style:UIBarButtonItemStyleDone target:self action:@selector(showPop)];

    
    
}

//出现的时候
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

//隐藏的时候
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
    
    ButtonViewController *Vc = [[ButtonViewController alloc]init];
    [self.navigationController pushViewController:Vc animated:YES];
    
    
 
}


@end
