//
//  UIButton+MyFont.m
//  BirdFight
//
//  Created by 聚米 on 16/10/17.
//  Copyright © 2016年 聚米. All rights reserved.
//

#import "UIButton+MyFont.h"

//不同设备的屏幕比例(当然倍数可以自己控制)
#define IPHONE_HEIGHT [[UIScreen mainScreen]bounds].size.height
#define SizeScale ((IPHONE_HEIGHT > 568) ? IPHONE_HEIGHT/568 : 1)

@implementation UIButton (MyFont)

+ (void)load
{
    Method imp = class_getInstanceMethod([self class], @selector(initWithCoder:));
    Method myImp = class_getInstanceMethod([self class], @selector(myInitWithCoder:));
    method_exchangeImplementations(imp, myImp);
}

-(id)myInitWithCoder:(NSCoder *)aDecode{
    [self myInitWithCoder:aDecode];
    if (self) {
        // 部分不想改变字体的，把tag值设置为333跳过
        if (self.titleLabel.tag != 333) {
            CGFloat fontSize = self.titleLabel.font.pointSize;
            self.titleLabel.font = [UIFont systemFontOfSize:fontSize*SizeScale];
        }
    }
    return self;
}

-(void)myFont{
    // 部分不想改变字体的，把tag值设置为333跳过
    if (self.titleLabel.tag != 333) {
        CGFloat fontSize = self.titleLabel.font.pointSize;
        self.titleLabel.font = [UIFont systemFontOfSize:fontSize*SizeScale];
    }

}

@end
