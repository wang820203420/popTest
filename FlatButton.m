//
//  FlatButton.m
//  popTest
//
//  Created by zhisu on 15/6/3.
//  Copyright (c) 2015年 zhisu. All rights reserved.
//

#import "FlatButton.h"
#import  <pop/POP.h>
@implementation FlatButton


+ (instancetype)button
{
    return [self buttonWithType:UIButtonTypeCustom];
}


-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        [self setup];
        
    }
    
    return self;
    
    
}



//实列方法
#pragma mark -Instance methods

-(UIEdgeInsets)titleEdgeInsets
{
    
    
    return UIEdgeInsetsMake(4, 28, 4, 28);
}

-(CGSize)intrinsicContentSize
{
    CGSize s = [super intrinsicContentSize];
    
    
    return CGSizeMake(s.width + self.titleEdgeInsets.left + self.titleEdgeInsets.right, s.height +self.titleEdgeInsets.top +self.titleEdgeInsets.bottom);
    
    
}


//私有方法
#pragma mark -Private instance methods 


-(void)setup
{
    self.backgroundColor = self.tintColor;
    self.layer.cornerRadius = 4;
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.titleLabel.font = [UIFont fontWithName:@"Avenir-Medium" size:22];
    
    [self addTarget:self action:@selector(scaleToSmall) forControlEvents:UIControlEventTouchDown | UIControlEventTouchDragEnter];
    
    [self addTarget:self action:@selector(scaleAnimation) forControlEvents:UIControlEventTouchUpInside];
    [self addTarget:self action:@selector(scaleToDefault) forControlEvents:UIControlEventTouchDragExit];
    
    
    
    
    
    
}

//设置缩小比列
-(void)scaleToSmall
{
    
    
    POPBasicAnimation *scaleAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    scaleAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(0.95, 0.95)];
    [self.layer pop_addAnimation:scaleAnimation forKey:@"layerScaleSmallAnimation"];
    
}

//缩小动画参数设置
-(void)scaleAnimation
{
    
    
    POPSpringAnimation *scaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    //速度
    scaleAnimation.velocity = [NSValue valueWithCGSize:CGSizeMake(3, 3)];
    scaleAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(1, 1)];
    //弹动
    scaleAnimation.springBounciness = 18;
    [self.layer pop_addAnimation:scaleAnimation forKey:@"layerScaleSpringAnimation"];
    
    
}

-(void)scaleToDefault
{
    POPBasicAnimation *scaleAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    
    scaleAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(1, 1)];
    [self.layer pop_addAnimation:scaleAnimation forKey:@"layerScaleDefaultAnimation"];
    
    
    
}



@end
