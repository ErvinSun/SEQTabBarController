//
//  AnimationFactory.m
//  TabBarController
//
//  Created by ervin on 17/4/24.
//  Copyright © 2017年 ervin. All rights reserved.
//

#import "AnimationFactory.h"
#import "JelloAnimation.h"
@implementation AnimationFactory
+ (TabBarItemAnimation *)animationWithType:(AnimationType)type{
    switch (type) {
        case JelloAnima:
            return [JelloAnimation new];
            break;
            
        default:
            break;
    }
    
    return nil;
}
@end
