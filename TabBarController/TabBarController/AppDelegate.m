//
//  AppDelegate.m
//  TabBarController
//
//  Created by ervin on 17/4/24.
//  Copyright © 2017年 ervin. All rights reserved.
//

#import "AppDelegate.h"
#import "SEQTabBarController.h"
#import "ViewController.h"
@interface AppDelegate () <UITabBarDelegate,UITabBarControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    NSMutableArray *controllerArray = [NSMutableArray arrayWithObjects:[ViewController new], [ViewController new], [ViewController new], [ViewController new], nil];
    
    NSArray *normalImageArray = @[@"tab-home_icon nor", @"tab-news_icon nor", @"tab-message_icon nor", @"tab-mine_icon nor"];
    NSArray *selectedImageArray = @[@"tab-home_icon sel", @"tab-news_icon sel", @"tab-message_icon sel", @"tab-mine_icon sel"];
    NSArray *titleArray = @[@"首页", @"动态", @"信息", @"我的"];
    SEQTabBarSource *dataSource = [[SEQTabBarSource alloc]init];
    dataSource.titleArr = titleArray;
    dataSource.viewControllers = controllerArray;
    dataSource.normalImageArr = normalImageArray;
    dataSource.selectImageArr = selectedImageArray;
    self.mainVC = [[SEQTabBarController alloc] init];
    self.mainVC.delegate = self;
    [self.mainVC tabBarSetDataSource:dataSource];
    self.window.rootViewController = self.mainVC;
    return YES;
}
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    NSLog(@"tabBarItem.title ==== %@",viewController.tabBarItem.title);
    if ([viewController.tabBarItem.title isEqualToString:@"我的"]) {
        return NO;
    }
    return YES;
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
