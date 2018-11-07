//
//  NavigationTitleConfig.m
//  KLProjectRoot
//
//  Created by King on 2018/11/7.
//  Copyright © 2018 king. All rights reserved.
//

#import "NavigationTitleConfig.h"

void ConfigNavigationTitleColor(UIColor *color) {
    [NavigationTitleConfig shareTitleConfig].titleColor = color;
}

UIColor *NavigationTitleColor(void) {
    UIColor *color = [NavigationTitleConfig shareTitleConfig].titleColor;
    return color?color:[UIColor whiteColor];
}


static NavigationTitleConfig *_config = nil;

@implementation NavigationTitleConfig

+ (instancetype)shareTitleConfig {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _config = [[NavigationTitleConfig alloc] init];
    });
    return _config;
}

@end
