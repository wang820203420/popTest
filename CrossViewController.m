
//
//  CrossViewController.m
//  popTest
//
//  Created by zhisu on 15/6/5.
//  Copyright (c) 2015年 zhisu. All rights reserved.
//

#import "CrossViewController.h"
#import "PaperButton.h"
#import "UIColor+CustomColors.h"
#import <pop/POP.h>
@interface CrossViewController ()

@end

@implementation CrossViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    [self addBarButton];
    
    
}



-(void)addBarButton
{
    
    PaperButton *button = [PaperButton button];
    
    
//    [button addTarget:self action:@selector(animaterTitleLabel:) forControlEvents:UIControlEventTouchUpInside];
    button.tintColor = [UIColor customBlueColor];
    
    

    
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc]initWithCustomView:button];
    
    self.navigationItem.rightBarButtonItem = barButton;
    
}

@end
