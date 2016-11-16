//
//  ButtonItem.h
//  BirdFight
//
//  Created by 聚米 on 16/11/12.
//  Copyright © 2016年 聚米. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ButtonItem : UIControl
// 带文字和图片的按钮
-(instancetype)initWithFrame:(CGRect)frame withImageName:(NSString *)imageName withImageWidth:(CGFloat)imageWidth withImageHeightPercentInItem:(CGFloat)imagPercent withTitle:(NSString *)title withFontSize:(CGFloat)fontSize withFontColor:(UIColor *)color withGap:(CGFloat)gap;
@end
