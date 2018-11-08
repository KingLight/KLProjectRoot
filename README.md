### KLProjectRoot
##### 安装 ``` pod 'KLProjectRoot' ```
或者 将项目中的KLProjectRoot/KLProjectRoot文件夹下的所有文件拷贝至自己的项目

##### 使用
- 1 导入 ``` #import "KLProjectRootHeader.h" ```
- 2 TabBarController和NavigationController可以直接使用，也可以继承后使用，鉴于项目，推荐继承后使用。 



###### KLTabBarController
可创建普通的TabBarController，也可以创建带有异形按钮的TabBarController

- 如果需要创建带有异形按钮的TabBarController，则需要设置

    - ``` isLoadCustemButton ```是否加载 中间的异形按钮，类似于微博早时候版本的发布微博按钮
    - ``` tabBarCustemButton ``` tabBar的异形按钮
    - 遵循代理```KLTabBarControllerDelegate```

    ```
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
    ```
    
- 其他属性
    - ``` titleColor ```  
    普通状态下每个item的title颜色
    - ``` selctedTitleColor ``` 
        选中状态下每个item的title颜色
    - ``` navigationControllerClass ``` 
        给子控制器假装导航控制器的的类

- 其他方法
    - 添加子控制器 并选择是否为子控制器包装导航 
       
        ```
         @param childController 子控制器的实例
         @param title title
         @param imageName 普通状态下图标icon的imageName
         @param selectedImageName 选中状态下图标icon的imageName
         @param isLoad 是否为子控制器加载导航
         - (void)addChildViewController:(UIViewController *)childController title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName isLoadNavigation:(BOOL)isLoad;
        ```
        
    - 添加子控制器，并为子控制器包装导航
        
        ```@param childController 子控制器的实例
 @param title title
 @param imageName 普通状态下图标icon的imageName
 @param selectedImageName 选中状态下图标icon的imageName
    - (void)addChildViewController:(UIViewController *)childController title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
        ```

###### KLNavigationController
- 属性
    - ```backImageName```  
        返回按钮的icon图片名
    - ```translucent```   
        效果等同于设置 UINavigationBar 的translucent属性
    - ```navigationBarTintColor```  
        效果等同于设置 UINavigationBar 的tintColor属性 同时会默认设置translucent为false
    - ```navigationBarBackgroundImage```  
        效果等同于设置 UINavigationBar 的setBackgroundImage方法
    - ```showShadow```  
        是否显示navigaitonBar下方的阴影条 默认不是显示

###### KLNavigationTitleLabel
设置导航栏的title，通过一个KLNavigationTitleLabel实例，设置导航的titleView
```
self.navigationItem.titleView = [KLNavigationTitleLabel navigationTitleLabel:@"title"];
```

###### 配置文件 NavigationTitleConfig
设置KLNavigationTitleLabel的字体颜色

-  设置导航titleLabel的字体颜色，默认为白色 
 
        @param color 颜色
        void ConfigNavigationTitleColor(UIColor *color)
        
- 获取导航titleLabel的字体颜色  
        
        UIColor *NavigationTitleColor(void)



