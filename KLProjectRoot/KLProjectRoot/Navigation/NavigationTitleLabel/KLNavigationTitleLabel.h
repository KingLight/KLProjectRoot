//
//  KLNavigationTitleLabel.h
//  KLProjectRoot
//
//  Created by King on 2018/11/7.
//  Copyright © 2018 king. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavigationTitleConfig.h"


/**
 自定义label 设置导航上的titleView
 */
@interface KLNavigationTitleLabel : UILabel

/**
 返回一个自定义label实例
 通过该实例来设置导航上的titleView
 self.navigationItem.titleView = [KLNavigationTitleLabel navigationTitleLabel:aTitle];
 
 @param title title
 @return self
 */
+ (instancetype)navigationTitleLabel:(NSString *)title;

@end


