//
//  PicView.m
//  BirdFight
//
//  Created by 聚米 on 16/11/7.
//  Copyright © 2016年 聚米. All rights reserved.
//

#import "PicView.h"
#import "UIImageView+WebCache.h"
#import "Masonry.h"

#define kJGG_GAP 10

@implementation PicView

- (instancetype)initWithFrame:(CGRect)frame dataSource:(NSArray *)dataSource completeBlock:(TapBlcok)tapBlock
{
    self = [super initWithFrame:frame];
    if (self) {
        for (NSUInteger i=0; i<dataSource.count; i++) {
            UIImageView *iv = [[UIImageView alloc]initWithFrame:CGRectMake(0+([PicView imageWidth]+kJGG_GAP)*(i%3),floorf(i/3.0)*([PicView imageHeight]+kJGG_GAP),[PicView imageWidth], [PicView imageHeight])];
            if ([dataSource[i] isKindOfClass:[UIImage class]]) {
                iv.image = dataSource[i];
            }else if ([dataSource[i] isKindOfClass:[NSString class]]){
                [iv sd_setImageWithURL:[NSURL URLWithString:dataSource[i]] placeholderImage:[UIImage imageNamed:@"placeholder"]];
            }else if ([dataSource[i] isKindOfClass:[NSURL class]]){
                [iv sd_setImageWithURL:dataSource[i] placeholderImage:[UIImage imageNamed:@"placeholder"]];
            }
            self.dataSource = dataSource;
            self.tapBlock = tapBlock;// 一定要给self.tapBlock赋值
            iv.userInteractionEnabled = YES;//默认关闭NO，打开就可以接受点击事件
            iv.tag = i;
            iv.layer.cornerRadius = 15;
            iv.layer.masksToBounds = YES;
            [self addSubview:iv];
            UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapImageAction:)];
            [iv addGestureRecognizer:singleTap];
        }
    }
    return self;
}
-(void)PicView:(PicView *)picView DataSource:(NSArray *)dataSource completeBlock:(TapBlcok)tapBlock
{
    for (NSUInteger i=0; i<dataSource.count; i++) {
        UIImageView *iv = [UIImageView new];
        if ([dataSource[i] isKindOfClass:[UIImage class]]) {
            iv.image = dataSource[i];
        }else if ([dataSource[i] isKindOfClass:[NSString class]]){
            [iv sd_setImageWithURL:[NSURL URLWithString:dataSource[i]] placeholderImage:[UIImage imageNamed:@"placeholder"]];
        }else if ([dataSource[i] isKindOfClass:[NSURL class]]){
            [iv sd_setImageWithURL:dataSource[i] placeholderImage:[UIImage imageNamed:@"placeholder"]];
        }
        picView.dataSource = dataSource;
        picView.tapBlock = tapBlock;
        iv.userInteractionEnabled = YES;//默认关闭NO，打开就可以接受点击事件
        iv.tag = i;
        iv.layer.cornerRadius = 15;
        iv.layer.masksToBounds = YES;
        [picView addSubview:iv];
        //九宫格的布局
        CGFloat  Direction_X = (([PicView imageWidth]+kJGG_GAP)*(i%3));
        CGFloat  Direction_Y  = (floorf(i/3.0)*([PicView imageHeight]+kJGG_GAP));
        
        [iv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(picView).offset(Direction_X);
            make.top.mas_equalTo(picView).offset(Direction_Y);
            make.size.mas_equalTo(CGSizeMake([PicView imageWidth], [PicView imageHeight]));
        }];
        
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]initWithTarget:picView action:@selector(tapImageAction:)];
        [iv addGestureRecognizer:singleTap];
    }
    
}
#pragma mark
#pragma mark 配置图片的宽高
+(CGFloat)imageWidth{
    return ([UIScreen mainScreen].bounds.size.width-50)/3;
}
+(CGFloat)imageHeight{
    return ([UIScreen mainScreen].bounds.size.width-50)/3;
}

-(void)tapImageAction:(UITapGestureRecognizer *)tap{
    UIImageView *tapView = (UIImageView *)tap.view;
    
    if (self.tapBlock) {
        self.tapBlock(tapView.tag,self.dataSource,self.indexpath);
    }
}

@end
