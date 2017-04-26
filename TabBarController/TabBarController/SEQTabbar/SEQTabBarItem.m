//
//  SEQTabBarItem.m
//  SEQTabbar
//
//  Created by ervin on 17/4/24.
//  Copyright © 2017年 ervin. All rights reserved.
//

#import "SEQTabBarItem.h"
//image ratio
#define TabBarButtonImageRatio 0.6
@implementation SEQTabBarItem

-(void)playAnimation:(UIImageView *)barIcon textLabel:(UILabel *)barTitle{
    assert(self.tabBarAnimation != nil);
    [self.tabBarAnimation playAnimation:barIcon textLabel:barTitle];
}
-(void)selectedState:(UIImageView *)barIcon textLabel:(UILabel *)barTitle{
    assert(self.tabBarAnimation != nil);
    [self.tabBarAnimation selectedState:barIcon textLabel:barTitle];
}
-(void)deselectAnimation:(UIImageView *)barIcon textLabel:(UILabel *)barTitle{
    assert(self.tabBarAnimation != nil);
    [self.tabBarAnimation deselectAnimation:barIcon textLabel:barTitle];
}

@end
