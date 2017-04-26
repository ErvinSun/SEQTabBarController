//
//  SEQTabBarController.h
//  SEQTabbar
//
//  Created by ervin on 17/4/24.
//  Copyright © 2017年 ervin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SEQTabBarSource.h"
@interface SEQTabBarController : UITabBarController

/**
 传入BarSource创建Tabbar
 不包含UINavigationController
 @param dataSoucre tabbar数据源
 */
- (void)tabBarSetDataSource:(SEQTabBarSource *)dataSoucre;
/**
 通过self.selectIndex改变tabbar当前controller时调用
 
 @param index 想要选择某个controller
 */
- (void)changeSelectIndex:(NSInteger)index;
@end
