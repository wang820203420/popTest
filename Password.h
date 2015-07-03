//
//  Password.h
//  popTest
//
//  Created by zhisu on 15/6/9.
//  Copyright (c) 2015年 zhisu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, Passwordstatus) {
    PasswordStrengthIndicatorViewStatusNone,
    PasswordStrengthIndicatorViewStatusWeak,
    PasswordStrengthIndicatorViewStatusFair,
    PasswordStrengthIndicatorViewStatusStrong
};

@interface Password : UIView

@property(nonatomic) Passwordstatus status;
@end
