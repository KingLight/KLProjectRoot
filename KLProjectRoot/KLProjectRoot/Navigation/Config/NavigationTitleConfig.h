//
//  NavigationTitleConfig.h
//  KLProjectRoot
//
//  Created by King on 2018/11/7.
//  Copyright © 2018 king. All rights reserved.
//

#import <UIKit/UIKit.h>


/**
 设置导航titleLabel的字体颜色，默认为白色
 
 @param color 颜色
 */
void ConfigNavigationTitleColor(UIColor *color);


/**
 获取导航titleLabel的字体颜色
 
 @return color
 */
UIColor *NavigationTitleColor(void);


@interface NavigationTitleConfig : NSObject

@property (strong, nonatomic) UIColor *titleColor;
+ (instancetype)shareTitleConfig;

@end


