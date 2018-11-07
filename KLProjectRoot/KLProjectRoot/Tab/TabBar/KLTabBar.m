//
//  KLTabBar.m
//  KLProjectRoot
//
//  Created by King on 2018/11/7.
//  Copyright © 2018 king. All rights reserved.
//

#import "KLTabBar.h"

@interface KLTabBar ()
@property (strong, nonatomic) UIButton *custemoButton;
@end

@implementation KLTabBar

@dynamic delegate;

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithCustemButton:(UIButton *)button {
    self = [super init];
    if (self) {
        [self addSubview:button];
        [button addTarget:self action:@selector(custemButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        button.adjustsImageWhenHighlighted = NO;
        self.custemoButton = button;
    }
    return self;
}

- (void)custemButtonClick:(UIButton *)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(tabBarDidClickCustemButton:)]) {
        [self.delegate tabBarDidClickCustemButton:self];
    }
    NSLog(@"中间按钮点击");
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    //计算每个UITabBarButton的款
    CGFloat tabBarButtonW = self.bounds.size.width/(self.items.count + 1);
    CGFloat buttonIndex = 0;
    NSInteger position = self.items.count / 2;
    CGRect frame = self.custemoButton.frame;
    frame.size.width = tabBarButtonW;
    frame.size.height = self.frame.size.height;
    self.custemoButton.frame = frame;
    //1 设置中间按钮的位置
    self.custemoButton.center = CGPointMake(self.bounds.size.width*0.5, 5);
    //2设置系统根据子VC创建的UITabBarButton的位置
    for (UIView *child in self.subviews) {
        
        //根据字符串做类名，找到该类型的类型信息
        Class class = NSClassFromString(@"UITabBarButton");
        //判断当前遍历到的子视图是否是class类型
        if ([child isKindOfClass:class]) {
            
            //xian拿出button原有的frame
            CGRect frame= child.frame;
            
            
            //改子视图的宽
            frame.size.width = tabBarButtonW;
            
            //设置子视图的x
            frame.origin.x = buttonIndex*tabBarButtonW;
            
            //再把改完的frame赋会给button
            child.frame = frame;
            buttonIndex++;
            if (buttonIndex==position) {
                buttonIndex++;
                
            }
        }
    }
    
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    CGPoint newP = [self convertPoint:point toView:self.custemoButton];
    if ( [self.custemoButton pointInside:newP withEvent:event])
    {
        return self.custemoButton;
    }else
    {
        return [super hitTest:point withEvent:event];
    }
}

@end
