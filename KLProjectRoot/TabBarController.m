//
//  TabBarController.m
//  KLProjectRoot
//
//  Created by King on 2018/11/7.
//  Copyright © 2018 king. All rights reserved.
//

#import "TabBarController.h"
#import "ViewController.h"
@interface TabBarController ()<KLTabBarControllerDelegate>

@end

@implementation TabBarController

- (Class)navigationControllerClass {
    return NSClassFromString(@"NavigationController");
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.isLoadCustemButton = YES;
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:[UIImage imageNamed:@"cts_tabbar_add_selIcon"] forState:UIControlStateNormal];
        self.tabBarCustemButton = button;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ViewController *vc1 = [[ViewController alloc] init];
    vc1.view.backgroundColor = [UIColor redColor];
    UIViewController *vc2 = [[UIViewController alloc] init];
    vc2.view.backgroundColor = [UIColor orangeColor];
    UIViewController *vc3 = [[UIViewController alloc] init];
    vc3.view.backgroundColor = [UIColor blueColor];
    UIViewController *vc4 = [[UIViewController alloc] init];
    vc4.view.backgroundColor = [UIColor purpleColor];
    
    NSArray *titles = @[@"首页", @"动态", @"发现", @"我的"];
    NSArray *vcs = @[vc1, vc2, vc3, vc4];
    //    self.delegate = self;
    [titles enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self addChildViewController:vcs[idx] title:obj imageName:nil selectedImageName:nil isLoadNavigation:YES];
    }];
    self.delegate = self;
    // Do any additional setup after loading the view.
}

- (void)tabBarControllerDidClickCustemBarButton {
    NSLog(@"控制器内点击回到哦");
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
