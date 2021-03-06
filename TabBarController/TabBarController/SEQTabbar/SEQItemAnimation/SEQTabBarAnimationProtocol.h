//
//  SEQTabBarAnimationProtocol.h
//  TabBarController
//
//  Created by ervin on 17/4/24.
//  Copyright © 2017年 ervin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@protocol SEQTabBarAnimationProtocol <NSObject>

/**
 当前点击barItem动画

 @param barIcon 图标
 @param barTitle title
 */
- (void)playAnimation:(UIImageView *)barIcon textLabel:(UILabel *)barTitle;

/**
 当前移除选中状态barItem动画

 @param barIcon 图标
 @param barTitle title
 */
- (void)deselectAnimation:(UIImageView *)barIcon textLabel:(UILabel *)barTitle;

/**
 当前为选中状态barItem动画

 @param barIcon 图标
 @param barTitle title
 */
- (void)selectedState:(UIImageView *)barIcon textLabel:(UILabel *)barTitle;

@end
