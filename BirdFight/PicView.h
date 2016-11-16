//
//  PicView.h
//  BirdFight
//
//  Created by 聚米 on 16/11/7.
//  Copyright © 2016年 聚米. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^TapBlcok)(NSInteger index,NSArray *dataSource,NSIndexPath *indexpath);

@interface PicView : UIView

@property (nonatomic, copy)TapBlcok  tapBlock;

@property (nonatomic, copy)NSIndexPath  *indexpath;

/**
 *  九宫格显示的数据源，dataSource中可以放UIImage对象和NSString(http://sjfjfd.cjf.jpg)，还有NSURL也可以
 */
@property (nonatomic, retain)NSArray * dataSource;
/**
 *  Description 九宫格
 *
 *  @param frame      frame
 *  @param dataSource 数据源
 *  @return JGGView对象
 */
- (instancetype)initWithFrame:(CGRect)frame dataSource:(NSArray *)dataSource completeBlock:(TapBlcok )tapBlock;


/**
 *  Description 九宫格
 *
 *  @param dataSource 数据源
 */
-(void)PicView:(PicView *)picView DataSource:(NSArray *)dataSource completeBlock:(TapBlcok)tapBlock;

/**
 *  配置图片的宽（正方形，宽高一样）
 *
 *  @return 宽
 */
+(CGFloat)imageWidth;
/**
 *  配置图片的高（正方形，宽高一样）
 *
 *  @return 高
 */
+(CGFloat)imageHeight;

@end
