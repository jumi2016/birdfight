//
//  DescActionViewController.m
//  BirdFight
//
//  Created by 聚米 on 16/11/8.
//  Copyright © 2016年 聚米. All rights reserved.
//

#import "DescActionViewController.h"
#import "KxMenu.h"
#import "UITableViewCell+HYBMasonryAutoCellHeight.h"
#import "UITableViewCell+Bird.h"

#import "DescTextActionCell.h"
#import "DescOneImageActionCell.h"
#import "DescTwoImageActionCell.h"
#import "DescImagesActionCell.h"
#import "DescVideoActionCell.h"

#import "PingLun_4_ActionCell.h"

#import "ZanView.h"
#import "AutoFillScreenUtils.h"

#import "STInputBar.h"

#define MainScreenWidth [[UIScreen mainScreen]bounds].size.width
#define MainScreenHeight [[UIScreen mainScreen]bounds].size.height

@interface DescActionViewController ()<UITableViewCellDelegate,UITableViewDelegate,UITableViewDataSource>
{
    int _index; // 上拉刷新计数器
    UIImageView *_imageView; // 放大图片
    NSArray *_images;
    NSInteger _currentTag;
    
    STInputBar *_inputBar;
}

//@property (nonatomic, weak) id<UITableViewCellDelegate> delegate; // 代理属性

@property (nonatomic, strong) UITableView * mytableView;

@property (nonatomic, strong) NSMutableArray  * pinglun_arr; // 评论数组
@property (nonatomic, strong) NSMutableArray  * zan_arr; // 赞数组


@end

@implementation DescActionViewController

#pragma mark 视图出现
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
    if (_text_model != nil) {
        _pinglun_arr = _text_model.commentModels;
        _zan_arr = _text_model.zan_Arr;
    }else if (_image_model != nil){
        _pinglun_arr = _image_model.commentModels;
        _zan_arr = _image_model.zan_Arr;
        
    }else if (_video_model != nil){
        _pinglun_arr = _video_model.commentModels;
        _zan_arr = _video_model.zan_Arr;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"动态详情";
    
    self.mytableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, MainScreenWidth, MainScreenHeight-44)];
    self.mytableView.delegate = self;
    self.mytableView.dataSource = self;
    self.mytableView.backgroundColor = [UIColor whiteColor];
    self.mytableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.mytableView];
    self.mytableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;

    _inputBar = [STInputBar inputBar];
    _inputBar.frame = CGRectMake(0, MainScreenHeight-44, MainScreenWidth, 44);
    [_inputBar setFitWhenKeyboardShowOrHide:YES];
    _inputBar.placeHolder = @"评论.....";
    [self.view addSubview:_inputBar];

    __weak typeof(self) weakSelf = self;
    [_inputBar setDidSendClicked:^(NSString *text) {
        [weakSelf updateMessage:text];
    }];

}


- (void)updateMessage:(NSString *)message{
    
    NSLog(@"评论了动态·········%@",message);
    
    [_inputBar endEditing:YES];
    [self.mytableView reloadData];
    
    
    
    
    
}

- (NSString *)time{
    static NSDateFormatter *_dateFormatter = nil;
    if (!_dateFormatter){
        _dateFormatter = [NSDateFormatter new];
        _dateFormatter.dateFormat = @"HH:mm:ss";
    }
    return [_dateFormatter stringFromDate:[NSDate date]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section == 0) {
        return 1;
    }else if (section == 1){
        return self.pinglun_arr.count;
    }
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.section) {
        case 0:
        {
            if (_text_model != nil) {
                DescTextActionCell * cell = [tableView dequeueReusableCellWithIdentifier:@"text_cell"];
                if (!cell) {
                    cell = [[DescTextActionCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"text_cell"];
                    cell.delegate = self;
                }
                TextActionModel * info = _text_model;
                [cell setCellInfo:info];
                // 点击操作按钮
                cell.block = ^(UIButton * sender){
                    // 弹出框
                    UITableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath];
                    CGRect rect = [self.mytableView convertRect:CGRectMake(0, 0, cell.frame.size.width, cell.frame.size.height) fromView:cell];
                    CGRect f = CGRectMake(rect.size.width-50, rect.origin.y + 15, sender.bounds.size.width, sender.bounds.size.height);
                    CGRect frame = [self.mytableView convertRect:f toView:[self.mytableView superview]];
                    [self showMenu:frame];
                };
                return cell;
                
            }else if (_image_model != nil){
                ImageActionModel * info = _image_model;
                if (info.image_arr.count == 1) {
                    DescOneImageActionCell * cell = [tableView dequeueReusableCellWithIdentifier:@"oneImage_cell"];
                    if (!cell) {
                        cell = [[DescOneImageActionCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"oneImage_cell"];
                        cell.delegate = self;
                    }
                    [cell setCellInfo:info];
                    // 点击操作按钮
                    cell.block = ^(UIButton * sender){
                        // 弹出框
                        UITableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath];
                        CGRect rect = [self.mytableView convertRect:CGRectMake(0, 0, cell.frame.size.width, cell.frame.size.height) fromView:cell];
                        CGRect f = CGRectMake(rect.size.width-50, rect.origin.y + 15, sender.bounds.size.width, sender.bounds.size.height);
                        CGRect frame = [self.mytableView convertRect:f toView:[self.mytableView superview]];
                        [self showMenu:frame];
                    };
                    return cell;
                    
                }else if (info.image_arr.count == 2){
                    DescTwoImageActionCell * cell = [tableView dequeueReusableCellWithIdentifier:@"twoImage_cell"];
                    if (!cell) {
                        cell = [[DescTwoImageActionCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"twoImage_cell"];
                        cell.delegate = self;
                    }
                    [cell setCellInfo:info];
                    // 点击操作按钮
                    cell.block = ^(UIButton * sender){
                        // 弹出框
                        UITableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath];
                        CGRect rect = [self.mytableView convertRect:CGRectMake(0, 0, cell.frame.size.width, cell.frame.size.height) fromView:cell];
                        CGRect f = CGRectMake(rect.size.width-50, rect.origin.y + 15, sender.bounds.size.width, sender.bounds.size.height);
                        CGRect frame = [self.mytableView convertRect:f toView:[self.mytableView superview]];
                        [self showMenu:frame];
                    };
                    return cell;
                    
                }else if (info.image_arr.count > 2){
                    DescImagesActionCell * cell = [tableView dequeueReusableCellWithIdentifier:@"images_cell"];
                    if (!cell) {
                        cell = [[DescImagesActionCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"images_cell" ];
                        cell.delegate = self;
                    }
                    [cell setCellInfo:info];
                    // 点击操作按钮
                    cell.block = ^(UIButton * sender){
                        // 弹出框
                        UITableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath];
                        CGRect rect = [self.mytableView convertRect:CGRectMake(0, 0, cell.frame.size.width, cell.frame.size.height) fromView:cell];
                        CGRect f = CGRectMake(rect.size.width-50, rect.origin.y + 15, sender.bounds.size.width, sender.bounds.size.height);
                        CGRect frame = [self.mytableView convertRect:f toView:[self.mytableView superview]];
                        [self showMenu:frame];
                    };
                    return cell;
                }
                
            }else if (_video_model != nil){
                DescVideoActionCell * cell = [tableView dequeueReusableCellWithIdentifier:@"video_cell"];
                if (!cell) {
                    cell = [[DescVideoActionCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"video_cell"];
                    cell.delegate = self;
                }
                VideoActionModel * info = _video_model;
                
                [cell setCellInfo:info];
                
                
                // 点击操作按钮
                cell.block = ^(UIButton * sender){
                    // 弹出框
                    UITableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath];
                    CGRect rect = [self.mytableView convertRect:CGRectMake(0, 0, cell.frame.size.width, cell.frame.size.height) fromView:cell];
                    CGRect f = CGRectMake(rect.size.width-50, rect.origin.y + 15, sender.bounds.size.width, sender.bounds.size.height);
                    CGRect frame = [self.mytableView convertRect:f toView:[self.mytableView superview]];
                    [self showMenu:frame];
                };
                return cell;
            }
            
            break;
        }
        case 1:
        {
            pingLunInfoModel * info = _pinglun_arr[indexPath.row];
            
            PingLun_4_ActionCell * cell = [tableView dequeueReusableCellWithIdentifier:@"pinglun_4"];
            if (!cell) {
                cell = [[PingLun_4_ActionCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"pinglun_4"];
                cell.delegate = self;
            }
            
            
            [cell setCellInfo:info];
            // 点击评论姓名
            cell.block = ^(NSString * uid){
                
                NSLog(@"点击了评论姓名按钮:%@",uid);
                
                
                
                
                
                
            };
            
            return cell;
            
            
            break;
        }
        default:
            break;
    }
    return nil;
}

#pragma mark 头内容
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case 1:
        {
            CGFloat autoSizeScaleX;
            CGFloat autoSizeScaleY;
            if (MainScreenHeight > 480) {
                autoSizeScaleX = MainScreenWidth/320;
                autoSizeScaleY = MainScreenHeight/568;
            }else{
                autoSizeScaleX = 1.0;
                autoSizeScaleY = 1.0;
            }
            
            CGFloat h;
            if (_zan_arr.count > 8) {
                h = 100*autoSizeScaleX;
            }else{
                h = 65*autoSizeScaleX;
            }
            
            ZanView * headerView = [[ZanView alloc]initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, h) withPeopleModel:_zan_arr withPinglunCount:_pinglun_arr.count];
            headerView.backgroundColor = [UIColor whiteColor];
            
            headerView.block = ^(NSString * uid){
                
                NSLog(@"在赞中点击了 %@ 的头像",uid);
                
                
                
                
                
                
                
                
            };
            return headerView;
            
            break;
        }
        default:
            break;
    }
    return 0;
}

#pragma mark cell头高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case 0:
        {
            return 0;
            break;
        }
        case 1:
        {
            CGFloat autoSizeScaleX;
            CGFloat autoSizeScaleY;
            if (MainScreenHeight > 480) {
                autoSizeScaleX = MainScreenWidth/320;
                autoSizeScaleY = MainScreenHeight/568;
            }else{
                autoSizeScaleX = 1.0;
                autoSizeScaleY = 1.0;
            }
            
            CGFloat h;
            if (_zan_arr.count > 8) {
                h = 100*autoSizeScaleX;
            }else{
                h = 65*autoSizeScaleX;
            }
            return h;
            break;
        }
        default:
            break;
    }
    return 0;
}

#pragma mark cell高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
        {
            if (_text_model != nil) {
                TextActionModel * textModel = _text_model;
                CGFloat h = [DescTextActionCell hyb_heightForTableView:tableView config:^(UITableViewCell *sourceCell) {
                    DescTextActionCell *cell = (DescTextActionCell *)sourceCell;
                    [cell setCellInfo:textModel];
                } cache:^NSDictionary *{
                    NSDictionary *cache = @{kHYBCacheUniqueKey : textModel.cid,
                                            kHYBCacheStateKey  : @"",
                                            kHYBRecalculateForStateKey : @(textModel.shouldUpdateCache)};
                    textModel.shouldUpdateCache = NO;
                    return cache;
                }];
                
                return h;
                
            }else if (_image_model != nil){
                ImageActionModel * imageModel = _image_model;
                if (imageModel.image_arr.count == 1) {
                    CGFloat h = [DescOneImageActionCell hyb_heightForTableView:tableView config:^(UITableViewCell *sourceCell) {
                        DescOneImageActionCell *cell = (DescOneImageActionCell *)sourceCell;
                        [cell setCellInfo:imageModel];
                    } cache:^NSDictionary *{
                        NSDictionary *cache = @{kHYBCacheUniqueKey : imageModel.cid,
                                                kHYBCacheStateKey  : @"",
                                                kHYBRecalculateForStateKey : @(imageModel.shouldUpdateCache)};
                        imageModel.shouldUpdateCache = NO;
                        return cache;
                    }];
                    return h;
                }else if (imageModel.image_arr.count == 2){
                    CGFloat h = [DescTwoImageActionCell hyb_heightForTableView:tableView config:^(UITableViewCell *sourceCell) {
                        DescTwoImageActionCell *cell = (DescTwoImageActionCell *)sourceCell;
                        [cell setCellInfo:imageModel];
                    } cache:^NSDictionary *{
                        NSDictionary *cache = @{kHYBCacheUniqueKey : imageModel.cid,
                                                kHYBCacheStateKey  : @"",
                                                kHYBRecalculateForStateKey : @(imageModel.shouldUpdateCache)};
                        imageModel.shouldUpdateCache = NO;
                        return cache;
                    }];
                    return h;
                }else if (imageModel.image_arr.count >2){
                    CGFloat h = [DescImagesActionCell hyb_heightForTableView:tableView config:^(UITableViewCell *sourceCell) {
                        DescImagesActionCell *cell = (DescImagesActionCell *)sourceCell;
                        [cell setCellInfo:imageModel];
                    } cache:^NSDictionary *{
                        NSDictionary *cache = @{kHYBCacheUniqueKey : imageModel.cid,
                                                kHYBCacheStateKey  : @"",
                                                kHYBRecalculateForStateKey : @(imageModel.shouldUpdateCache)};
                        imageModel.shouldUpdateCache = NO;
                        return cache;
                    }];
                    return h;
                }
                
            }else if (_video_model != nil){
                VideoActionModel * videoModel = _video_model;
                CGFloat h = [DescVideoActionCell hyb_heightForTableView:tableView config:^(UITableViewCell *sourceCell) {
                    DescVideoActionCell *cell = (DescVideoActionCell *)sourceCell;
                    [cell setCellInfo:videoModel];
                } cache:^NSDictionary *{
                    NSDictionary *cache = @{kHYBCacheUniqueKey : videoModel.cid,
                                            kHYBCacheStateKey  : @"",
                                            kHYBRecalculateForStateKey : @(videoModel.shouldUpdateCache)};
                    videoModel.shouldUpdateCache = NO;
                    return cache;
                }];
                
                return h;
            }
            break;
        }
        case 1:
        {
            pingLunInfoModel *model = _pinglun_arr[indexPath.row];
            return [PingLun_4_ActionCell hyb_heightForTableView:self.mytableView config:^(UITableViewCell *sourceCell) {
                PingLun_4_ActionCell *cell = (PingLun_4_ActionCell *)sourceCell;
                [cell setCellInfo:model];
            } cache:^NSDictionary *{
                return @{kHYBCacheUniqueKey : model.cid,
                         kHYBCacheStateKey : @"",
                         kHYBRecalculateForStateKey : @(NO)};
            }];
            
            break;
        }
        default:
            break;
    }
    return 0;
}

#pragma mark - Table view delegate 点击cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.section) {
        case 0:
        {
            break;
        }
        case 1:
        {
            
            pingLunInfoModel * model = _pinglun_arr[indexPath.row];
            NSString * uid = model.uid_one;
            
            NSLog(@"回复了%@",model.name_one);
            
            
            
            
            
            
            
            
            break;
        }
        default:
            break;
    }
}

#pragma mark 点击头像按钮回调
- (void)didTapHeadImageButton:(NSString *)uid
{
    NSLog(@"点击了头像按钮,点击了%@",uid);
    
    
}

#pragma mark 点击赞按钮回调
- (void)didTapZanButton:(NSString *)actionID
{
    NSLog(@"点击了赞按钮");
    
    
}

#pragma mark 点击么么按钮回调
- (void)didTapMemeButton:(NSString *)actionID
{
    NSLog(@"点击了么么按钮");
    
    
}

#pragma mark 点击评论头像按钮回调
- (void)didTapPingLunHeadImageButton:(NSString *)uid
{
    NSLog(@"点击了头像按钮,点击了%@",uid);
    
    
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
    
    [KxMenu showMenuInView:self.mytableView
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


#pragma mark 点击表情发送按钮

@end
