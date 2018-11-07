//
//  KLNavigationController.h
//  KLProjectRoot
//
//  Created by King on 2018/11/7.
//  Copyright © 2018 king. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface KLNavigationController : UINavigationController

///返回按钮的icon图片名
@property (strong, nonatomic) NSString *backImageName;

/* 效果等同于设置 UINavigationBar 的translucent属性 */
@property(nonatomic,assign,getter=isTranslucent) BOOL translucent;

/* 效果等同于设置 UINavigationBar 的tintColor属性 同时会默认设置translucent为false */
@property (strong, nonatomic) UIColor *navigationBarTintColor;

/* 效果等同于设置 UINavigationBar 的setBackgroundImage方法  */
@property (strong, nonatomic) UIImage *navigationBarBackgroundImage;

/* 是否显示navigaitonBar下方的阴影条 默认不是显示 */
@property (assign, nonatomic) BOOL showShadow;

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer;

@end

