//
//  AnimationFactory.h
//  TabBarController
//
//  Created by ervin on 17/4/24.
//  Copyright © 2017年 ervin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AnimationType.h"
@class TabBarItemAnimation;
@interface AnimationFactory : NSObject
+ (TabBarItemAnimation *)animationWithType:(AnimationType)type;
@end
