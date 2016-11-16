//
//  AutoFillScreenUtils.m
//  BirdFight
//
//  Created by 聚米 on 16/10/14.
//  Copyright © 2016年 聚米. All rights reserved.
//

#import "AutoFillScreenUtils.h"

@interface AutoFillScreenUtils ()

@property (nonatomic, assign) float autoSizeScaleX;
@property (nonatomic, assign) float autoSizeScaleY;

@end

@implementation AutoFillScreenUtils

/**
 
 * 将需要按比例适配的view作为参数传递
 
 */
+ (void)autoLayoutFillScreen:(UIView *)view
{
    for (UIView * firstLavelView in view.subviews) {
        firstLavelView.frame = [AutoFillScreenUtils updateViewsFrameX:firstLavelView.frame.origin.x withY:firstLavelView.frame.origin.y AndWidth:firstLavelView.frame.size.width AndHeight:firstLavelView.frame.size.height];
        for (UIView * secondLevelView in firstLavelView.subviews) {
            secondLevelView.frame = [AutoFillScreenUtils updateViewsFrameX:secondLevelView.frame.origin.x withY:secondLevelView.frame.origin.y AndWidth:secondLevelView.frame.size.width AndHeight:secondLevelView.frame.size.height];
        }
    }
}

/**
 
 * 按比例系数更新frame
 
 */
+ (CGRect)updateViewsFrameX:(CGFloat)x withY:(CGFloat)y AndWidth:(CGFloat)width AndHeight:(CGFloat)height
{
    AppDelegate * appdelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    CGRect rect;
    rect.origin.x = x * appdelegate.autoSizeScaleX;
    rect.origin.y = y * appdelegate.autoSizeScaleY;
    rect.size.width = width * appdelegate.autoSizeScaleX;
    rect.size.height = height * appdelegate.autoSizeScaleY;
    return rect;
}


@end
