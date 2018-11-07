//
//  KLTabBar.h
//  KLProjectRoot
//
//  Created by King on 2018/11/7.
//  Copyright © 2018 king. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KLTabBar;
@protocol KLTabBarDelegate <UITabBarDelegate>

- (void)tabBarDidClickCustemButton:(KLTabBar *)tabBar;

@end

@interface KLTabBar : UITabBar

@property (weak, nonatomic) id<KLTabBarDelegate>delegate;
- (instancetype)initWithCustemButton:(UIButton *)button;

@end


