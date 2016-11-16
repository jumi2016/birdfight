//
//  ButtonItem.m
//  BirdFight
//
//  Created by 聚米 on 16/11/12.
//  Copyright © 2016年 聚米. All rights reserved.
//

#import "ButtonItem.h"

@implementation ButtonItem

-(instancetype)initWithFrame:(CGRect)frame withImageName:(NSString *)imageName withImageWidth:(CGFloat)imageWidth withImageHeightPercentInItem:(CGFloat)imagPercent withTitle:(NSString *)title withFontSize:(CGFloat)fontSize withFontColor:(UIColor *)color withGap:(CGFloat)gap
{
    self.backgroundColor = [UIColor clearColor];
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake((frame.size.width - imageWidth)/2, 5, imageWidth, imagPercent*frame.size.height)];
        if (imageName) {
            imageView.image = [UIImage imageNamed:imageName];
        }
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:imageView];
        
        
        UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, gap+imageView.frame.size.height, frame.size.width, (1-imagPercent)*frame.size.height)];
        label.text = title;
        label.textColor = color;
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:fontSize];
        [self addSubview:label];
        
    }
    return self;
}


@end
