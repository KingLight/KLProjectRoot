//
//  KLNavigationController.m
//  KLProjectRoot
//
//  Created by King on 2018/11/7.
//  Copyright © 2018 king. All rights reserved.
//

#import "KLNavigationController.h"

@interface KLNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation KLNavigationController
- (void)setTranslucent:(BOOL)translucent {
    _translucent = translucent;
    self.navigationBar.translucent = translucent;
}

- (void)setNavigationBarTintColor:(UIColor *)navigationBarTintColor {
    _navigationBarTintColor = navigationBarTintColor;
    self.navigationBar.translucent = NO;
    self.navigationBar.barTintColor = navigationBarTintColor;
}

- (void)setNavigationBarBackgroundImage:(UIImage *)navigationBarBackgroundImage {
    _navigationBarBackgroundImage = navigationBarBackgroundImage;
    [self.navigationBar setBackgroundImage:navigationBarBackgroundImage forBarMetrics:UIBarMetricsDefault];
}

- (void)setShowShadow:(BOOL)showShadow {
    _showShadow = showShadow;
    if (showShadow) {
        [self.navigationBar setShadowImage:nil];
    } else {
        [self.navigationBar setShadowImage:[[UIImage alloc] init]];
    }
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationBar setShadowImage:[[UIImage alloc] init]];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count >= 1) {
        if (self.backImageName) {
            viewController.navigationItem.leftBarButtonItem =
            [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:self.backImageName]
                                                    imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                             style:UIBarButtonItemStylePlain
                                            target:viewController.navigationController
                                            action:@selector(popViewControllerAnimated:)];
        }
    }
    [super pushViewController:viewController animated:animated];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    UIViewController* topVC = self.topViewController;
    if ([topVC preferredStatusBarStyle]) {
        return [topVC preferredStatusBarStyle];
    }else{
        return UIStatusBarStyleLightContent;
    }
}


- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    if (self.viewControllers.count <= 1) {
        return NO;
    }
    return YES;
}


@end
