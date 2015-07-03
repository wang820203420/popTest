//
//  Password.m
//  popTest
//
//  Created by zhisu on 15/6/9.
//  Copyright (c) 2015年 zhisu. All rights reserved.
//

#import "Password.h"
#import "UIColor+CustomColors.h"


@interface Password ()

@property(nonatomic)UIView *indicatorView;




@end



@implementation Password

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.05];
        self.translatesAutoresizingMaskIntoConstraints = NO;
        self.layer.cornerRadius = 2.f;
        [self addIndicatorView];
    }
    return self;
}

#pragma mark - Property Setters

- (void)setStatus:(Passwordstatus)status
{
    if (status == _status) {
        return;
    }
    _status = status;
    [self animateIndicatorViewToStatus:status];
}




#pragma mark - Private Instance methods


- (void)animateIndicatorViewToStatus:(Passwordstatus)status
{
    [self.constraints enumerateObjectsUsingBlock:^(NSLayoutConstraint *constraint, NSUInteger idx, BOOL *stop) {
        if (constraint.firstAttribute == NSLayoutAttributeWidth) {
            *stop = YES;
            [self removeConstraint:constraint];
        }
    }];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.indicatorView
                                                     attribute:NSLayoutAttributeWidth
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeWidth
                                                    multiplier:[self multiplierForStatus:status]
                                                      constant:0]];
    
    [UIView animateWithDuration:0.3 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0.7 options:0 animations:^{
        [self layoutIfNeeded];
        self.indicatorView.backgroundColor = [self colorForStatus:status];
    } completion:NULL];
}





- (CGFloat)multiplierForStatus:(Passwordstatus)status
{
    switch (status) {
        case PasswordStrengthIndicatorViewStatusWeak:
            return 0.33f;
        case PasswordStrengthIndicatorViewStatusFair:
            return 0.66f;
        case PasswordStrengthIndicatorViewStatusStrong:
            return 1.f;
        default:
            return 0.f;
    }
}

- (UIColor *)colorForStatus:(Passwordstatus)status
{
    switch (status) {
        case PasswordStrengthIndicatorViewStatusWeak:
            return [UIColor customRedColor];
        case PasswordStrengthIndicatorViewStatusFair:
            return [UIColor customYellowColor];
        case PasswordStrengthIndicatorViewStatusStrong:
            return [UIColor customGreenColor];
        default:
            return [UIColor whiteColor];
    }
}




- (void)addIndicatorView
{
    self.indicatorView = [UIView new];
    self.indicatorView.translatesAutoresizingMaskIntoConstraints = NO;
    self.indicatorView.layer.cornerRadius = self.layer.cornerRadius;
    [self addSubview:self.indicatorView];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.indicatorView
                                                     attribute:NSLayoutAttributeHeight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeHeight
                                                    multiplier:1.f
                                                      constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.indicatorView
                                                     attribute:NSLayoutAttributeWidth
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeWidth
                                                    multiplier:[self multiplierForStatus:self.status]
                                                      constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.indicatorView
                                                     attribute:NSLayoutAttributeLeft
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeLeft
                                                    multiplier:1.f
                                                      constant:0.f]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.indicatorView
                                                     attribute:NSLayoutAttributeTop
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeTop
                                                    multiplier:1.f
                                                      constant:0.f]];
}





@end
