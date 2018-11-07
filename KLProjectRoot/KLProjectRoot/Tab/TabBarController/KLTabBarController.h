//
//  KLTabBarController.h
//  KLProjectRoot
//
//  Created by King on 2018/11/7.
//  Copyright © 2018 king. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol KLTabBarControllerDelegate <UITabBarControllerDelegate>

@optional
- (void)tabBarControllerDidClickCustemBarButton;

@end

@interface KLTabBarController : UITabBarController

@property (weak, nonatomic) id<KLTabBarControllerDelegate> delegate;
@property (strong, nonatomic) UIColor *titleColor;
@property (strong, nonatomic) UIColor *selctedTitleColor;

/**
 给子控制器封装的导航控制器类型
 */
@property (strong, nonatomic) Class navigationControllerClass;


/**
 是否加载 中间的异形按钮，类似于微博早时候版本的发布微博按钮
 默认为no
 如果设置为yes，必须设置tabBarCustemButton属性
 */
@property (assign, nonatomic) BOOL isLoadCustemButton;


/**
 tabBar的异形按钮 类似于微博早时候版本的发布微博按钮
 需设置isLoadCustemButton属性为yes
 */
@property (strong, nonatomic) UIButton *tabBarCustemButton;



/**
 添加子控制器
 
 @param childController 子控制器的实例
 @param title title
 @param imageName 普通状态下图标icon的imageName
 @param selectedImageName 选中状态下图标icon的imageName
 @param isLoad 是否为子控制器加载导航
 */
- (void)addChildViewController:(UIViewController *)childController title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName isLoadNavigation:(BOOL)isLoad;



/**
 添加子控制器 且默认为每一个子控制器添加一个导航控制器
 
 @param childController 子控制器的实例
 @param title title
 @param imageName 普通状态下图标icon的imageName
 @param selectedImageName 选中状态下图标icon的imageName
 */
- (void)addChildViewController:(UIViewController *)childController title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName;

@end


