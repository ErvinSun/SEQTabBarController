//
//  SEQTabBar.h
//  SEQTabbar
//
//  Created by ervin on 17/4/24.
//  Copyright © 2017年 ervin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SEQTabBarItem.h"

/**
 自定义TabBar可以添加控件 以及对TabBar修改属性等
 */
@interface SEQTabBar : UITabBar
@property(nonatomic, weak)UIButton *customeButton;

/**
 数据，主要用于判断有几个BarItem
 */
@property (nonatomic, strong) NSArray *dataSource;

@property(nonatomic, weak)SEQTabBarItem *seleItem;
@end
