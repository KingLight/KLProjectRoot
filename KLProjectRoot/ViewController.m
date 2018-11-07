//
//  ViewController.m
//  KLProjectRoot
//
//  Created by King on 2018/11/7.
//  Copyright © 2018 king. All rights reserved.
//

#import "ViewController.h"
#import "BViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"btn" forState:UIControlStateNormal];
    btn.frame = CGRectMake(20, 100, 40, 40);
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)btnClick:(id)sender {
    NSLog(@"%p",self.navigationController);
    BViewController *vc = [[BViewController alloc] init];
    vc.view.backgroundColor = [UIColor purpleColor];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
