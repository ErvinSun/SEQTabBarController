//
//  SEQTabBar.m
//  SEQTabbar
//
//  Created by ervin on 17/4/24.
//  Copyright © 2017年 ervin. All rights reserved.
// 

#import "SEQTabBar.h"

@interface SEQTabBar () <UITabBarDelegate>

@end
@implementation SEQTabBar
- (instancetype)init{
    if (self = [super init]) {
        self.delegate = self;
    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    //设置其他tabBarItem的位置和尺寸
    self.seleItem = (SEQTabBarItem *)self.selectedItem;
    CGFloat tabBarButtonW = self.bounds.size.width / self.dataSource.count;
    CGFloat buttonIndex = 0;
    //遍历tabBar中的所有子视图
    //只有当遍历到的子视图的类型是UITabBarButton时，才代表找到的其他按钮，调整位置即可
    for (UIView *child in self.subviews) {
        //获取UITabBarButton的类型描述信息
        Class class = NSClassFromString(@"UITabBarButton");
        if ([child isKindOfClass:class]) {
            CGRect frame = child.frame;
            frame.size.width = tabBarButtonW;
            frame.origin.x = tabBarButtonW * buttonIndex;
            child.frame = frame;
            buttonIndex++;
        }
    }
}

@end
