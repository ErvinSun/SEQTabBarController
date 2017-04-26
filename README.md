# SEQTabBarController
自定义TabBarController

基于系统TabBarController自定义，可以使用系统tabBarController代理进行操作，比如：
-
```
-(BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    if ([viewController.tabBarItem.title isEqualToString:@"我的"]) {
        return NO;
    }
    return YES;
}
```
进行item点击拦截

/**
 传入BarSource创建Tabbar
 不包含UINavigationController
 @param dataSoucre tabbar数据源
 */
- 
```
-(void)tabBarSetDataSource:(SEQTabBarSource *)dataSoucre;
```
/**
 通过self.selectIndex改变tabbar当前controller时调用
 类似 self.selectIndex = index 功能
 @param index 想要选择某个controller
 */
- 
```
-(void)changeSelectIndex:(NSInteger)index;
```
