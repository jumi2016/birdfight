//
//  ActionTableViewController.m
//  BirdFight
//
//  Created by 聚米 on 16/10/24.
//  Copyright © 2016年 聚米. All rights reserved.
//

#import "ActionTableViewController.h"
#import "KxMenu.h"
#import "UITableViewCell+HYBMasonryAutoCellHeight.h"
#import "UITableViewCell+Bird.h"

#import "TextActionModel.h"
#import "ImageActionModel.h"
#import "VideoActionModel.h"
#import "pingLunInfoModel.h"

#import "TextActionCell.h"
#import "OneImageActionCell.h"
#import "TwoImageActionCell.h"
#import "ImagesActionCell.h"
#import "VideoActionCell.h"


@interface ActionTableViewController ()<UITableViewCellDelegate>
{
    int _index; // 上拉刷新计数器
    UIImageView *_imageView; // 放大图片
    NSArray *_images;
    NSInteger _currentTag;
}

//@property (nonatomic, weak) id<UITableViewCellDelegate> delegate; // 代理属性

@property (nonatomic, strong) NSMutableArray * action_arr; // 动态数组
@property (nonatomic, strong) NSMutableArray * pinglun_arr; // 评论数组
@property (nonatomic, strong) NSMutableArray * zan_arr; // 赞数组

@end

@implementation ActionTableViewController

#pragma mark 加载赞
-(void)loadZanArr
{
    UserInfo * info_1 = [[UserInfo alloc]init];
    info_1.uid = @"张小凡";
    info_1.headImage = [UIImage imageNamed:@"1.jpg"];
    
    UserInfo * info_2 = [[UserInfo alloc]init];
    info_2.uid = @"林惊羽";
    info_2.headImage = [UIImage imageNamed:@"2.jpg"];
    
    [_zan_arr addObjectsFromArray:@[info_1,info_2,info_1,info_1,info_2,info_1,info_1,info_2,info_1,info_1,info_2,info_1]];
}

#pragma mark 加载数据
-(void)loadPingLunArr
{
    pingLunInfoModel * info_1 = [[pingLunInfoModel alloc]init];
    info_1.uid_one = @"张小凡";
    info_1.uid_two = @"";
    info_1.cid = [NSString stringWithFormat:@"commentModel%d",1];
    info_1.pinglun_type = @"remark";
    info_1.headImage = [UIImage imageNamed:@"1.jpg"];
    info_1.distance = @"1.5km";
    info_1.time = @"2016-10-27 8:41:23";
    info_1.name_one = @"张小凡";
    info_1.name_two = @"";
    info_1.content = @"哈哈哈哈哈哈哈哈哈哈哈哈哈哈";
    [_pinglun_arr addObject:info_1];
    
    pingLunInfoModel * info_2 = [[pingLunInfoModel alloc]init];
    info_2.uid_one = @"林惊羽";
    info_2.uid_two = @"";
    info_2.cid = [NSString stringWithFormat:@"commentModel%d",2];
    info_2.pinglun_type = @"remark";
    info_2.headImage = [UIImage imageNamed:@"2.jpg"];
    info_2.distance = @"1.5km";
    info_2.time = @"2016-10-27 8:41:23";
    info_2.name_one = @"林惊羽";
    info_2.name_two = @"";
    info_2.content = @"哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈";
    [_pinglun_arr addObject:info_2];
    
    pingLunInfoModel * info_3 = [[pingLunInfoModel alloc]init];
    info_3.uid_one = @"林惊羽";
    info_3.uid_two = @"张小凡";
    info_3.cid = [NSString stringWithFormat:@"commentModel%d",3];
    info_3.pinglun_type = @"reply";
    info_3.headImage = [UIImage imageNamed:@"3.jpg"];
    info_3.distance = @"1.5km";
    info_3.time = @"2016-10-27 8:41:23";
    info_3.name_one = @"林惊羽";
    info_3.name_two = @"张小凡";
    info_3.content = @"哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈";
    [_pinglun_arr addObject:info_3];
}


#pragma mark 加载数据
-(void)loadActionArr
{
    TextActionModel * info_1 = [[TextActionModel alloc]init];
    info_1.cid = [NSString stringWithFormat:@"actionModel%d",1];
    info_1.action_type = @"text";
    info_1.uid = @"碧瑶";
    info_1.headImage = [UIImage imageNamed:@"1.jpg"];
    info_1.name = @"碧瑶";
    info_1.sex = @"女";
    info_1.age = @"26";
    info_1.content = @"小凡小凡小凡小凡小凡小凡小凡";
    info_1.time = @"2016-10-27 8:41:23";
    info_1.stance = @"1.5km";
    info_1.zanCount = @"0";
    info_1.pinglunCount = @"0";
    info_1.commentModels = _pinglun_arr;
    info_1.zan_Arr = _zan_arr;
    [_action_arr addObject:info_1];
    
    VideoActionModel * info_2 = [[VideoActionModel alloc]init];
    info_2.cid = [NSString stringWithFormat:@"actionModel%d",2];
    info_2.action_type = @"video";
    info_2.uid = @"陆雪琪";
    info_2.headImage = [UIImage imageNamed:@"2.jpg"];
    info_2.name = @"陆雪琪";
    info_2.sex = @"女";
    info_2.age = @"26";
    info_2.content = @"小凡小凡小凡小凡小凡小凡小凡小凡小凡小凡小凡小凡小凡小凡小凡小凡小凡小凡小凡小凡小凡小凡小凡小凡小凡小凡小凡小凡小凡小凡小凡小凡小凡小凡小凡小凡小凡小凡";
    info_2.mp4URL = @"http://v.jxvdy.com/sendfile/HbTMxpilOKa7NyPRqdN3FDvIrYgTLhBMB5Hj_-dHcy5IPDOZXFD1HW2WgQUYTpDcBSnUL2xD5rDf2BujUbiMg6_rJl50vg";
    info_2.time = @"2016-10-27 8:41:23";
    info_2.stance = @"1.5km";
    info_2.zanCount = @"999";
    info_2.pinglunCount = @"99";
    info_2.commentModels = _pinglun_arr;
    info_2.zan_Arr = _zan_arr;
    [_action_arr addObject:info_2];
    
    ImageActionModel * info_3 = [[ImageActionModel alloc]init];
    info_3.cid = [NSString stringWithFormat:@"actionModel%d",3];
    info_3.action_type = @"image";
    info_3.uid = @"小环";
    info_3.headImage = [UIImage imageNamed:@"3.jpg"];
    info_3.name = @"小环";
    info_3.sex = @"女";
    info_3.age = @"26";
    info_3.content = @"小凡小凡小凡小凡小凡小凡小凡小凡小凡小凡小凡小凡小凡小凡小凡小凡小凡小凡小凡小凡小凡小凡小凡小凡小凡小凡小凡小凡小凡小凡小凡小凡";
    info_3.image_arr = @[[UIImage imageNamed:@"1.jpg"],[UIImage imageNamed:@"2.jpg"],[UIImage imageNamed:@"1.jpg"],[UIImage imageNamed:@"2.jpg"],[UIImage imageNamed:@"1.jpg"],[UIImage imageNamed:@"2.jpg"],[UIImage imageNamed:@"1.jpg"]];
    info_3.time = @"2016-10-27 8:41:23";
    info_3.stance = @"1.5km";
    info_3.zanCount = @"999";
    info_3.pinglunCount = @"99";
    info_3.commentModels = _pinglun_arr;
    info_3.zan_Arr = _zan_arr;
    [_action_arr addObject:info_3];
    
    ImageActionModel * info_4 = [[ImageActionModel alloc]init];
    info_4.cid = [NSString stringWithFormat:@"actionModel%d",4];
    info_4.action_type = @"image";
    info_4.uid = @"林惊羽";
    info_4.headImage = [UIImage imageNamed:@"4.png"];
    info_4.name = @"林惊羽";
    info_4.sex = @"男";
    info_4.age = @"26";
    info_4.content = @"小凡小凡小凡小凡小凡小凡小凡小凡小凡小凡小凡小凡小凡小凡小凡小凡小凡小凡小凡";
    info_4.image_arr = @[[UIImage imageNamed:@"1.jpg"],[UIImage imageNamed:@"2.jpg"]];
    info_4.time = @"2016-10-27 8:41:23";
    info_4.stance = @"1.5km";
    info_4.zanCount = @"0";
    info_4.pinglunCount = @"0";
    info_4.commentModels = _pinglun_arr;
    info_4.zan_Arr = _zan_arr;
    [_action_arr addObject:info_4];
    
    ImageActionModel * info_5 = [[ImageActionModel alloc]init];
    info_5.cid = [NSString stringWithFormat:@"actionModel%d",5];
    info_5.action_type = @"image";
    info_5.uid = @"鬼王";
    info_5.headImage = [UIImage imageNamed:@"7.jpg"];
    info_5.name = @"鬼王";
    info_5.sex = @"男";
    info_5.age = @"26";
    info_5.content = @"小凡小凡小凡小凡小凡小凡小凡小凡小凡小凡小凡小凡小凡小凡小凡小凡小凡小凡小凡";
    info_5.image_arr = @[[UIImage imageNamed:@"2.jpg"]];
    info_5.time = @"2016-10-27 8:41:23";
    info_5.stance = @"1.5km";
    info_5.zanCount = @"999";
    info_5.pinglunCount = @"99";
    info_5.commentModels = _pinglun_arr;
    info_5.zan_Arr = _zan_arr;
    [_action_arr addObject:info_5];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    
    _action_arr = [NSMutableArray array];
    _pinglun_arr = [NSMutableArray array];
    _zan_arr = [NSMutableArray array];
    
    [self loadPingLunArr];
    [self loadActionArr];
    [self loadZanArr];
    
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    [self.tableView reloadData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _action_arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ActionInfoModel * model = _action_arr[indexPath.row];
    if ([model.action_type isEqualToString:@"text"]) {
        TextActionCell * cell = [tableView dequeueReusableCellWithIdentifier:@"text_cell"];
        if (!cell) {
            cell = [[TextActionCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"text_cell"];
            cell.delegate = self;
        }
        TextActionModel * info = _action_arr[indexPath.row];
        [cell setCellInfo:info];
        // 点击操作按钮
        cell.block = ^(UIButton * sender){
            // 弹出框
            UITableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath];
            CGRect rect = [self.tableView convertRect:CGRectMake(0, 0, cell.frame.size.width, cell.frame.size.height) fromView:cell];
            CGRect f = CGRectMake(rect.size.width-50, rect.origin.y + 15, sender.bounds.size.width, sender.bounds.size.height);
            CGRect frame = [self.tableView convertRect:f toView:[self.tableView superview]];
            [self showMenu:frame];
        };
        // 点击评论姓名
        cell.name_block = ^(NSString * uid){
            
            NSLog(@"点击了评论姓名按钮:%@",uid);
            
            
            
            
            
            
        };
        return cell;
        
    }else if ([model.action_type isEqualToString:@"image"]){
        ImageActionModel * info = _action_arr[indexPath.row];
        if (info.image_arr.count == 1) {
            OneImageActionCell * cell = [tableView dequeueReusableCellWithIdentifier:@"oneImage_cell"];
            if (!cell) {
                cell = [[OneImageActionCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"oneImage_cell"];
                cell.delegate = self;
            }
            [cell setCellInfo:info];
            // 点击操作按钮
            cell.block = ^(UIButton * sender){
                // 弹出框
                UITableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath];
                CGRect rect = [self.tableView convertRect:CGRectMake(0, 0, cell.frame.size.width, cell.frame.size.height) fromView:cell];
                CGRect f = CGRectMake(rect.size.width-50, rect.origin.y + 15, sender.bounds.size.width, sender.bounds.size.height);
                CGRect frame = [self.tableView convertRect:f toView:[self.tableView superview]];
                [self showMenu:frame];
            };
            // 点击评论姓名
            cell.name_block = ^(NSString * uid){
                
                NSLog(@"点击了评论姓名按钮:%@",uid);
                
                
                
                
                
                
            };
            return cell;

        }else if (info.image_arr.count == 2){
            TwoImageActionCell * cell = [tableView dequeueReusableCellWithIdentifier:@"twoImage_cell"];
            if (!cell) {
                cell = [[TwoImageActionCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"twoImage_cell"];
                cell.delegate = self;
            }
            [cell setCellInfo:info];
            // 点击操作按钮
            cell.block = ^(UIButton * sender){
                // 弹出框
                UITableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath];
                CGRect rect = [self.tableView convertRect:CGRectMake(0, 0, cell.frame.size.width, cell.frame.size.height) fromView:cell];
                CGRect f = CGRectMake(rect.size.width-50, rect.origin.y + 15, sender.bounds.size.width, sender.bounds.size.height);
                CGRect frame = [self.tableView convertRect:f toView:[self.tableView superview]];
                [self showMenu:frame];
            };
            // 点击评论姓名
            cell.name_block = ^(NSString * uid){
                
                NSLog(@"点击了评论姓名按钮:%@",uid);
                
                
                
                
                
                
            };
            return cell;

        }else if (info.image_arr.count > 2){
            ImagesActionCell * cell = [tableView dequeueReusableCellWithIdentifier:@"images_cell"];
            if (!cell) {
                cell = [[ImagesActionCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"images_cell" ];
                cell.delegate = self;
            }
            [cell setCellInfo:info];
            // 点击操作按钮
            cell.block = ^(UIButton * sender){
                // 弹出框
                UITableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath];
                CGRect rect = [self.tableView convertRect:CGRectMake(0, 0, cell.frame.size.width, cell.frame.size.height) fromView:cell];
                CGRect f = CGRectMake(rect.size.width-50, rect.origin.y + 15, sender.bounds.size.width, sender.bounds.size.height);
                CGRect frame = [self.tableView convertRect:f toView:[self.tableView superview]];
                [self showMenu:frame];
            };
            // 点击评论姓名
            cell.name_block = ^(NSString * uid){
                
                NSLog(@"点击了评论姓名按钮:%@",uid);
                
                
                
                
                
                
            };
            return cell;
        }
    }else if ([model.action_type isEqualToString:@"video"]) {
        VideoActionCell * cell = [tableView dequeueReusableCellWithIdentifier:@"video_cell"];
        if (!cell) {
            cell = [[VideoActionCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"video_cell"];
            cell.delegate = self;
        }
        VideoActionModel * info = _action_arr[indexPath.row];
        
        [cell setCellInfo:info];
        

        // 点击操作按钮
        cell.block = ^(UIButton * sender){
            // 弹出框
            UITableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath];
            CGRect rect = [self.tableView convertRect:CGRectMake(0, 0, cell.frame.size.width, cell.frame.size.height) fromView:cell];
            CGRect f = CGRectMake(rect.size.width-50, rect.origin.y + 15, sender.bounds.size.width, sender.bounds.size.height);
            CGRect frame = [self.tableView convertRect:f toView:[self.tableView superview]];
            [self showMenu:frame];
        };
        // 点击评论姓名
        cell.name_block = ^(NSString * uid){
            
            NSLog(@"点击了评论姓名按钮:%@",uid);
            
            
            
            
            
            
        };
        return cell;
        
    }
    
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ActionInfoModel *model = _action_arr[indexPath.row];
    if ([model.action_type isEqualToString:@"text"]) {
        TextActionModel * textModel = _action_arr[indexPath.row];
        CGFloat h = [TextActionCell hyb_heightForTableView:tableView config:^(UITableViewCell *sourceCell) {
            TextActionCell *cell = (TextActionCell *)sourceCell;
            [cell setCellInfo:textModel];
        } cache:^NSDictionary *{
            NSDictionary *cache = @{kHYBCacheUniqueKey : textModel.cid,
                                    kHYBCacheStateKey  : @"",
                                    kHYBRecalculateForStateKey : @(textModel.shouldUpdateCache)};
            model.shouldUpdateCache = NO;
            return cache;
        }];
        
        return h;

    }else if([model.action_type isEqualToString:@"image"]){
        ImageActionModel * imageModel = _action_arr[indexPath.row];
        if (imageModel.image_arr.count == 1) {
            CGFloat h = [OneImageActionCell hyb_heightForTableView:tableView config:^(UITableViewCell *sourceCell) {
                OneImageActionCell *cell = (OneImageActionCell *)sourceCell;
                [cell setCellInfo:imageModel];
            } cache:^NSDictionary *{
                NSDictionary *cache = @{kHYBCacheUniqueKey : imageModel.cid,
                                        kHYBCacheStateKey  : @"",
                                        kHYBRecalculateForStateKey : @(imageModel.shouldUpdateCache)};
                model.shouldUpdateCache = NO;
                return cache;
            }];
            return h;
        }else if (imageModel.image_arr.count == 2){
            CGFloat h = [TwoImageActionCell hyb_heightForTableView:tableView config:^(UITableViewCell *sourceCell) {
                TwoImageActionCell *cell = (TwoImageActionCell *)sourceCell;
                [cell setCellInfo:imageModel];
            } cache:^NSDictionary *{
                NSDictionary *cache = @{kHYBCacheUniqueKey : imageModel.cid,
                                        kHYBCacheStateKey  : @"",
                                        kHYBRecalculateForStateKey : @(imageModel.shouldUpdateCache)};
                model.shouldUpdateCache = NO;
                return cache;
            }];
            return h;
        }else if (imageModel.image_arr.count >2){
            CGFloat h = [ImagesActionCell hyb_heightForTableView:tableView config:^(UITableViewCell *sourceCell) {
                ImagesActionCell *cell = (ImagesActionCell *)sourceCell;
                [cell setCellInfo:imageModel];
            } cache:^NSDictionary *{
                NSDictionary *cache = @{kHYBCacheUniqueKey : imageModel.cid,
                                        kHYBCacheStateKey  : @"",
                                        kHYBRecalculateForStateKey : @(imageModel.shouldUpdateCache)};
                model.shouldUpdateCache = NO;
                return cache;
            }];
            return h;
        }
    }else if ([model.action_type isEqualToString:@"video"]) {
        VideoActionModel * videoModel = _action_arr[indexPath.row];
        CGFloat h = [VideoActionCell hyb_heightForTableView:tableView config:^(UITableViewCell *sourceCell) {
            VideoActionCell *cell = (VideoActionCell *)sourceCell;
            [cell setCellInfo:videoModel];
        } cache:^NSDictionary *{
            NSDictionary *cache = @{kHYBCacheUniqueKey : videoModel.cid,
                                    kHYBCacheStateKey  : @"",
                                    kHYBRecalculateForStateKey : @(videoModel.shouldUpdateCache)};
            model.shouldUpdateCache = NO;
            return cache;
        }];
        
        return h;
    }
    return 0;
}


#pragma mark - Table view delegate
 - (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

     [tableView deselectRowAtIndexPath:indexPath animated:YES];
     
     ActionInfoModel * model = _action_arr[indexPath.row];
     if ([model.action_type isEqualToString:@"text"]) {
        TextActionModel * info = _action_arr[indexPath.row];
         if (self.text_block) {
             self.text_block(info);
         }
     }else if ([model.action_type isEqualToString:@"image"]){
        ImageActionModel * info = _action_arr[indexPath.row];
         if (self.image_block) {
             self.image_block(info);
         }
     }else if ([model.action_type isEqualToString:@"video"]) {
        VideoActionModel * info = _action_arr[indexPath.row];
         if (self.video_block) {
             self.video_block(info);
         }
     }
 }

#pragma mark - HYBTestCellDelegate
- (void)reloadCellHeightForModel:(ActionInfoModel *)model atIndexPath:(NSIndexPath *)indexPath {
    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
}



#pragma mark 点击头像按钮回调
- (void)didTapHeadImageButton:(NSString *)uid
{
    NSLog(@"点击了头像按钮");
    
    
}

#pragma mark 点击赞按钮回调
- (void)didTapZanButton:(NSString *)actionID
{
    NSLog(@"点击了赞按钮");
    
    
}

#pragma mark 点击评论按钮回调
- (void)didTapPinglunButton:(NSString *)actionID
{
    NSLog(@"点击了评论按钮");
    
    
}

#pragma mark 弹出小菜单
- (void)showMenu:(CGRect)rect
{
    KxMenuItem * item_1 = [KxMenuItem menuItem:@"操作" image:nil target:nil action:NULL];
    KxMenuItem * item_2 = [KxMenuItem menuItem:@"不感兴趣" image:nil target:self action:@selector(pushMenuItem:)];
      
    KxMenuItem * item_3 = [KxMenuItem menuItem:@"举报" image:nil target:self action:@selector(pushMenuItem:)];
      
    KxMenuItem * item_4 = [KxMenuItem menuItem:@"取消" image:nil target:self  action:@selector(pushMenuItem:)];
    NSArray *menuItems = @[item_1,item_2,item_3,item_4];
    
    item_1.alignment = NSTextAlignmentCenter;
    item_2.alignment = NSTextAlignmentCenter;
    item_3.alignment = NSTextAlignmentCenter;
    item_4.foreColor = [UIColor colorWithRed:249/255.0 green:83/255.0 blue:100/255.0 alpha:1];
    item_4.alignment = NSTextAlignmentCenter;
    
    [KxMenu showMenuInView:self.tableView
                  fromRect:rect
                 menuItems:menuItems];
}

#pragma mark 点击小菜单按钮
- (void) pushMenuItem:(id)sender
{
    NSLog(@"%@", sender);
    
    
    
    
    
}

#pragma mark 点击图片回调
- (void)didTapImageAtIndex:(NSInteger)index WithImage:(NSArray *)image_url
{
//    _images = image_url;
    _images = image_url;
    _currentTag = index;
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    // 初始化一个按钮遮罩
    UIButton *coverBtn = [[UIButton alloc] init];
    coverBtn.backgroundColor = [UIColor blackColor];
    coverBtn.alpha = 0;
    coverBtn.center = window.center;
    coverBtn.tag = 100;
    [coverBtn addTarget:self action:@selector(tapCover:) forControlEvents:UIControlEventTouchUpInside];
    [window addSubview:coverBtn];
    
    [UIView animateWithDuration:0.5 animations:^{
        // 覆盖的按钮
        coverBtn.alpha = 1.0;
        coverBtn.frame = window.bounds;
        
        // 设置起点为屏幕中央
        UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(window.bounds.size.width/2, window.bounds.size.height/2, 0, 0)];
        
        // 设置图片
//        [imageV sd_setImageWithURL:image_url[index] placeholderImage:[UIImage imageNamed:@"zwt"]];
        
        
        imageV.image = image_url[index];  /////////   测试
        
        
        imageV.contentMode = UIViewContentModeScaleAspectFit;// 自适应
        
        // 设置ImageV的最大宽高
        imageV.frame = window.bounds;
        // 设置ImageV的Center
        imageV.center = window.center;
        
        [window addSubview:imageV];
        _imageView = imageV;
    }];
    
    // 判断数组长度
    if (image_url.count>1) {
        // 添加滑动手势
        UIPanGestureRecognizer *panG = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(slideImage:)];
        _imageView.userInteractionEnabled = YES;
        [_imageView addGestureRecognizer:panG];
        
        UITapGestureRecognizer *tapG = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture:)];
        [_imageView addGestureRecognizer:tapG];
    }
}

#pragma mark 点击退回
- (void)tapCover:(UIButton *)coverBtn
{
    [UIView animateWithDuration:0.5 animations:^{
        coverBtn.bounds = CGRectZero;
        coverBtn.alpha = 0;
        _imageView.bounds = CGRectZero;
        _imageView.alpha = 0;
    } completion:^(BOOL finished) {
        [coverBtn removeFromSuperview];
        [_imageView removeFromSuperview];
        _imageView = nil;
    }];
}

#pragma mark 拖动手势
- (void)slideImage:(UIPanGestureRecognizer *)panG
{
    // 判断手势
    if (panG.state == UIGestureRecognizerStateEnded) {
        // 获取滑动的点
        CGPoint point = [panG translationInView:panG.view];
        if (point.x < -100) {// 左滑
            if (_currentTag < _images.count-1) {
                _currentTag++;
//                [_imageView sd_setImageWithURL:_images[_currentTag] placeholderImage:[UIImage imageNamed:@"zwt"]];
                
                
                _imageView.image = _images[_currentTag];   //  测试
            }
        }
        if (point.x > 100) { // 右滑
            if (_currentTag > 0){
                _currentTag--;
                
//                [_imageView sd_setImageWithURL:_images[_currentTag] placeholderImage:[UIImage imageNamed:@"zwt"]];
                
                
                _imageView.image = _images[_currentTag];   //  测试
            }
        }
    }
}

#pragma mark 单击手势
- (void)tapGesture:(UITapGestureRecognizer *)tapG
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    UIButton *button = (UIButton *)[window viewWithTag:100];
    [self tapCover:button];
}






/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
