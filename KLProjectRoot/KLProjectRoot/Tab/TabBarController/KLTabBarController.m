//
//  KLTabBarController.m
//  KLProjectRoot
//
//  Created by King on 2018/11/7.
//  Copyright © 2018 king. All rights reserved.
//

#import "KLTabBarController.h"

#import "KLTabBar.h"
@interface KLTabBarController ()<UITabBarControllerDelegate, KLTabBarDelegate>

@end

@implementation KLTabBarController
@dynamic delegate;
- (Class)navigationControllerClass {
    if (!_navigationControllerClass) {
        _navigationControllerClass = [UINavigationController class];
    }
    return _navigationControllerClass;
}

- (void)setIsLoadCustemButton:(BOOL)isLoadCustemButton {
    _isLoadCustemButton = isLoadCustemButton;
    if (isLoadCustemButton && self.tabBarCustemButton) {
        KLTabBar *tabBar = [[KLTabBar alloc] initWithCustemButton:self.tabBarCustemButton];
        tabBar.delegate = self;
        [self setValue:tabBar forKey:@"tabBar"];
    }
}

- (void)setTabBarCustemButton:(UIButton *)tabBarCustemButton {
    _tabBarCustemButton = tabBarCustemButton;
    if (self.isLoadCustemButton) {
        KLTabBar *tabBar = [[KLTabBar alloc] initWithCustemButton:_tabBarCustemButton];
        tabBar.delegate = self;
        [self setValue:tabBar forKey:@"tabBar"];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view.
}

/**
 添加子控制器
 
 @param childController 子控制器的实例
 @param title title
 @param imageName 普通状态下图标icon的imageName
 @param selectedImageName 选中状态下图标icon的imageName
 @param isLoad 是否为子控制器加载导航
 */
- (void)addChildViewController:(UIViewController *)childController title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName isLoadNavigation:(BOOL)isLoad {
    UIImage *image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childController.tabBarItem.image = image;
    childController.tabBarItem.selectedImage = selectedImage;
    childController.title = title;
    // 设置文字的样式
    if (self.titleColor && self.selctedTitleColor) {
        [childController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor lightGrayColor]} forState:UIControlStateNormal];
        [childController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor orangeColor]} forState:UIControlStateSelected];
    }
    
    UINavigationController *navigation = [[[self.navigationControllerClass class] alloc] initWithRootViewController:childController];
    UIViewController *childVC = isLoad?navigation:childController;
    [self addChildViewController:childVC];
    
}

- (void)addChildViewController:(UIViewController *)childController title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName {
    [self addChildViewController:childController title:title imageName:imageName selectedImageName:selectedImageName isLoadNavigation:YES];
}

- (void)tabBarDidClickCustemButton:(KLTabBar *)tabBar {
    if (self.delegate && [self.delegate respondsToSelector:@selector(tabBarControllerDidClickCustemBarButton)]) {
        [self.delegate tabBarControllerDidClickCustemBarButton];
    }
}

@end
