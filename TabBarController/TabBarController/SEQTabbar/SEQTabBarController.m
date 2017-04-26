//
//  SEQTabBarController.m
//  SEQTabbar
//
//  Created by ervin on 17/4/24.
//  Copyright © 2017年 ervin. All rights reserved.
//

#import "SEQTabBarController.h"
#import "SEQTabBar.h"
#import "ViewController.h"
#import "SEQTabBarSource.h"
#import "AnimationFactory.h"
@interface SEQTabBarController ()
@property(nonatomic, weak)SEQTabBar *mainTabBar;
@property(nonatomic, strong) NSMutableArray *chiledViewControllers;

@property(nonatomic, strong) NSMutableArray *barImageArr;

@property(nonatomic, strong) NSMutableArray *barTitleArr;
@end

@implementation SEQTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.chiledViewControllers = [NSMutableArray new];
    self.barImageArr = [NSMutableArray new];
    self.barTitleArr = [NSMutableArray new];
    [self setupMainTabBar];
}

/**
 给Tabbar赋值：image、title、viewController

 @param dataSoucre 数据源
 */
- (void)tabBarSetDataSource:(SEQTabBarSource *)dataSoucre{
    for (int  i = 0; i < dataSoucre.viewControllers.count; i++){
        NSString *title = dataSoucre.titleArr[i];
        UIImage *normalImage = [UIImage imageNamed:dataSoucre.normalImageArr[i]];
        UIImage *selectImage = [UIImage imageNamed:dataSoucre.selectImageArr[i]];
        UIViewController *viewController = dataSoucre.viewControllers[i];
        viewController.title = dataSoucre.titleArr[i];
        [self setupOnChildViewController:viewController title:title normalImage:normalImage selectImage:selectImage tag:i];
    }
    self.viewControllers = self.chiledViewControllers;
    self.mainTabBar.dataSource = self.viewControllers;
    [self.mainTabBar setNeedsLayout];
    for (UIControl *tabbarButton in self.mainTabBar.subviews) {
        if ([tabbarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            for (UIView *barSubView in tabbarButton.subviews) {
                if ([barSubView isKindOfClass:NSClassFromString(@"UITabBarSwappableImageView")]) {
                    [self.barImageArr addObject:barSubView];
                }
                if ([barSubView isKindOfClass:[UILabel class]]) {
                    [self.barTitleArr addObject:barSubView];
                }
            }
        }
    }
}

/**
 修改TabBarItem 属性 以及给TabBarItem赋数据 添加tabbar动画效果

 @param chiledVC 子视图
 @param title title
 @param normalImage 默认图
 @param selectImage 选中图
 */
- (void)setupOnChildViewController:(UIViewController *)chiledVC title:(NSString *)title normalImage:(UIImage *)normalImage selectImage:(UIImage *)selectImage tag:(NSInteger)tag{
    SEQTabBarItem *barItem = [[SEQTabBarItem alloc]init];
    barItem.title = title;
    barItem.image = [normalImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    barItem.selectedImage = [selectImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    barItem.tag = tag;
    barItem.tabBarAnimation = [AnimationFactory animationWithType:JelloAnima];
    [barItem setTitlePositionAdjustment:UIOffsetMake(0, -3)];
    [barItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor darkGrayColor]} forState:UIControlStateSelected];
    chiledVC.tabBarItem = barItem;
    [self.chiledViewControllers addObject:chiledVC];
}

/**
 创建自定义Tabbar
 */
- (void)setupMainTabBar{
    SEQTabBar *mainTabBar = [[SEQTabBar alloc] init];
    mainTabBar.frame = self.tabBar.bounds;
    mainTabBar.delegate = self;
    [self setValue:mainTabBar forKey:@"tabBar"];
    self.mainTabBar = mainTabBar;
}

/**
 点击TabBarItem代理

 @param tabBar tabBar
 @param item 当前点击Item
 */
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    SEQTabBarItem *nowItem = (SEQTabBarItem *)item;
    NSLog(@"nowItem.tag === %ld",(long)nowItem.tag);
    NSLog(@"selectItem.tag === %ld",(long)self.mainTabBar.seleItem.tag);
    if (nowItem.tag != self.mainTabBar.seleItem.tag) {
        [nowItem playAnimation:[self.barImageArr objectAtIndex:nowItem.tag] textLabel:[self.barTitleArr objectAtIndex:nowItem.tag]];
        [self.mainTabBar.seleItem deselectAnimation:[self.barImageArr objectAtIndex:self.mainTabBar.seleItem.tag] textLabel:[self.barTitleArr objectAtIndex:self.mainTabBar.seleItem.tag]];
        self.mainTabBar.seleItem = nowItem;
    }else{
        [nowItem selectedState:[self.barImageArr objectAtIndex:nowItem.tag] textLabel:[self.barTitleArr objectAtIndex:nowItem.tag]];
    }
}

/**
 通过self.selectIndex改变tabbar当前controller时调用

 @param index 想要选择某个controller
 */
- (void)changeSelectIndex:(NSInteger)index{
    self.selectedIndex = index;
    SEQTabBarItem *barItem = (SEQTabBarItem *)[self.mainTabBar.items objectAtIndex:index];
    [self tabBar:self.mainTabBar didSelectItem:barItem];
}
@end
