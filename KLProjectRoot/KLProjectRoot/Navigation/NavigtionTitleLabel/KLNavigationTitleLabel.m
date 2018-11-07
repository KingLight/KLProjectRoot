//
//  KLNavigationTitleLabel.m
//  KLProjectRoot
//
//  Created by King on 2018/11/7.
//  Copyright © 2018 king. All rights reserved.
//

#import "KLNavigationTitleLabel.h"

@implementation KLNavigationTitleLabel

+ (instancetype)navigationTitleLabel:(NSString *)title {
    CGSize size = [title sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18]}];
    KLNavigationTitleLabel *label = [[KLNavigationTitleLabel alloc] initWithFrame:CGRectMake(0, 0, size.width, 44)];
    label.text = title;
    label.textColor = NavigationTitleColor();
    label.textAlignment = NSTextAlignmentCenter;
    return label;
}

@end
