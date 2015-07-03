//
//  ButtonViewController.m
//  popTest
//
//  Created by zhisu on 15/6/3.
//  Copyright (c) 2015年 zhisu. All rights reserved.
//

#import "ButtonViewController.h"
#import "FlatButton.h"
#import "UIColor+CustomColors.h"
#import <pop/POP.h>
@interface ButtonViewController ()
@property (nonatomic) UILabel *errorLabel;
@property (nonatomic) FlatButton *button;
@property (nonatomic) UIActivityIndicatorView *activityIndicatorView;
@end

@implementation ButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    [self addButton];
    [self addLabel];
    [self addActivityIndicatorView];
    
    
    
}

//私人实列方法
#pragma mark - Private Instance methods




-(void)addButton
{
    
    self.button = [FlatButton button];
    self.button.backgroundColor = [UIColor customBlueColor];
    //如果是从代码层面开始使用Autolayout,需要对使用
    self.button.translatesAutoresizingMaskIntoConstraints = NO;
    [self.button setTitle:@"Log in" forState:UIControlStateNormal];
    [self.button addTarget:self action:@selector(touchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.view addSubview:self.button];
    
    //添加约束
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.button
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.f
                                                           constant:0.f]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.button
                                                          attribute:NSLayoutAttributeCenterY
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterY
                                                         multiplier:1.f
                                                           constant:0.f]];
    
    
    
}


-(void)addLabel
{
    
    self.errorLabel = [UILabel new];
    self.errorLabel.font = [UIFont fontWithName:@"Avenir-Light" size:18];
    self.errorLabel.textColor = [UIColor customRedColor];
    self.errorLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.errorLabel.text = @"Just a serious login error.";
    self.errorLabel.textAlignment = NSTextAlignmentCenter;
    [self.view insertSubview:self.errorLabel belowSubview:self.button];
    
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.errorLabel
                              attribute:NSLayoutAttributeCenterX
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.button
                              attribute:NSLayoutAttributeCenterX
                              multiplier:1
                              constant:0.f]];
    
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.errorLabel
                              attribute:NSLayoutAttributeCenterY
                              relatedBy:NSLayoutRelationEqual toItem:self.button
                              attribute:NSLayoutAttributeCenterY
                              multiplier:1
                              constant:0]];
    
    self.errorLabel.layer.transform = CATransform3DMakeScale(0.5f, 0.5f, 1.f);
    
    
    
    
}


//活动指示图
-(void)addActivityIndicatorView
{
    
    
    self.activityIndicatorView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView: self.activityIndicatorView];
    
    self.navigationItem.rightBarButtonItem  = item;
    
}


//btn点击事件
-(void)touchUpInside:(FlatButton *)button
{
    
    [self hideLabel];
    [self.activityIndicatorView startAnimating];
    button.userInteractionEnabled = NO;
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    //一、dispatch_after
//    功能：延迟一段时间把一项任务提交到队列中执行，返回之后就不能取消
//    常用来在在主队列上延迟执行一项任务
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.activityIndicatorView stopAnimating];
        [self shakeButton];
        [self showLabel];
   });
   
    
    
    
}

-(void)shakeButton
{
    
    POPSpringAnimation *positionAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    positionAnimation.velocity = @2000;
    positionAnimation.springBounciness = 20;
    [positionAnimation setCompletionBlock:^(POPAnimation *animation, BOOL finished) {
    
        self.button.userInteractionEnabled = YES;
        
    }];
    [self.button.layer pop_addAnimation:positionAnimation forKey:@"positionAnimation"];
    
    
}

//显示label
-(void)showLabel
{
    self.errorLabel.layer.opacity = 1.0;
    POPSpringAnimation *layerScaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    layerScaleAnimation.springBounciness = 18;
    layerScaleAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(1.f, 1.f)];
    [self.errorLabel.layer pop_addAnimation:layerScaleAnimation forKey:@"labelScaleAnimation"];
    
    
    
    
    POPSpringAnimation *layerPositionAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionY];
    layerPositionAnimation.toValue = @(self.button.layer.position.y +self.button.intrinsicContentSize.height);
    layerPositionAnimation.springBounciness = 12;
    [self.errorLabel.layer pop_addAnimation:layerPositionAnimation forKey:@"layerPositionAnimation"];
    
    
    
}


//隐藏label
-(void)hideLabel
{
    
    POPBasicAnimation *LayerScaleAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    
    
    LayerScaleAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(0.5, 0.5)];
    
    [self.errorLabel.layer pop_addAnimation:LayerScaleAnimation forKey:@"layerScaleAnimation"];
    
    
    
    POPBasicAnimation *layerPositionAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPositionY];
    layerPositionAnimation.toValue = @(self.button.layer.position.y);
    [self.errorLabel.layer pop_addAnimation:layerPositionAnimation forKey:@"layerPositionAnimation"];
    
    
    
    
    
}


@end
