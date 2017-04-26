//
//  SEQTabBarItem.h
//  SEQTabbar
//
//  Created by ervin on 17/4/24.
//  Copyright © 2017年 ervin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SEQTabBarAnimationProtocol.h"
#import "TabBarItemAnimation.h"
@interface SEQTabBarItem : UITabBarItem <SEQTabBarAnimationProtocol>
@property(nonatomic, strong)TabBarItemAnimation *tabBarAnimation;
@end
