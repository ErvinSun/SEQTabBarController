//
//  TabBarItemAnimation.h
//  TabBarController
//
//  Created by ervin on 17/4/24.
//  Copyright © 2017年 ervin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SEQTabBarAnimationProtocol.h"
@interface TabBarItemAnimation : NSObject <SEQTabBarAnimationProtocol>
@property (nonatomic, assign) CGFloat duration;
@property (nonatomic, strong) UIColor *textSelectedColor;
@property (nonatomic, strong) UIColor *iconSelectedColor;
@property (nonatomic, strong) UIColor *defaultTextColor;
@end
