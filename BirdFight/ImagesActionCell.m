//
//  ImagesActionCell.m
//  BirdFight
//
//  Created by 聚米 on 16/10/24.
//  Copyright © 2016年 聚米. All rights reserved.
//

#import "ImagesActionCell.h"
#import "UITableViewCell+HYBMasonryAutoCellHeight.h"
#import "Masonry.h"
#import "UITableViewCell+Bird.h"

#import "PicView.h"

#import "ImageActionModel.h"
#import "pingLunInfoModel.h"

#import "PingLun_2_ActionCell.h"


@interface ImagesActionCell ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic)  UIButton *headImageBtn;
@property (strong, nonatomic)  UILabel *nameLabel;
@property (strong, nonatomic)  UIImageView *sexImage;
@property (strong, nonatomic)  UILabel *ageLabel;
@property (strong, nonatomic)  UIButton *handleBtn;

@property (strong, nonatomic)  UILabel *contentLabel;

@property (strong, nonatomic)  UILabel *timeLabel;
@property (strong, nonatomic)  UILabel *distanceLabel;

@property (strong, nonatomic)  UIButton *supportBtn;
@property (strong, nonatomic)  UILabel *supportLabel;

@property (strong, nonatomic)  UIButton *reviewBtn;
@property (strong, nonatomic)  UILabel *reviewLabel;

@property (nonatomic, strong) UITableView * tableView;

@property (nonatomic, weak) id<UITableViewCellDelegate> delegate; // 代理属性
@property (nonatomic, strong) NSString * uid; // 用户标识符

@property (nonatomic, strong) NSMutableArray * pinglun_arr; // 评论数组

@property (nonatomic, strong) ActionInfoModel * actionModel; // 动态模型

@property (nonatomic, strong) NSArray * image_url; // 图片数组


@property (nonatomic, strong) PicView * picView;
@property (nonatomic, strong) NSIndexPath *indexPath;

@end

@implementation ImagesActionCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        // 加载测试数据
        _pinglun_arr = [NSMutableArray array];
        
        
        // 设置
        self.contentView.backgroundColor = [UIColor whiteColor];
        
        __weak __typeof(self) weakSelf = self;
        
        // 分割线
        UIView * lineVIew = [[UIView alloc]init];
        lineVIew.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [self.contentView addSubview:lineVIew];
        [lineVIew mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.right.mas_equalTo(0);
            make.top.mas_equalTo(0);
            make.height.mas_equalTo(1);
        }];
        
        // 头像
        self.headImageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.headImageBtn.contentMode = UIViewContentModeScaleAspectFit;
        _headImageBtn.backgroundColor = [UIColor clearColor];
        _headImageBtn.layer.cornerRadius = 25;
        _headImageBtn.layer.masksToBounds = YES;
        [_headImageBtn addTarget:self action:@selector(tapHeadImage:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:self.headImageBtn];
        [self.headImageBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(20);
            make.top.mas_equalTo(lineVIew.mas_bottom).offset(15);
            make.width.height.mas_equalTo(50);
        }];
        
        // 操作按钮
        self.handleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.handleBtn.contentMode = UIViewContentModeScaleAspectFit;
        self.handleBtn.backgroundColor = [UIColor clearColor];
        [self.handleBtn setImage:[UIImage imageNamed:@"caozuo"] forState:UIControlStateNormal];
        [self.handleBtn addTarget:self action:@selector(tapHandle:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:self.handleBtn];
        [self.handleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-20);
            make.top.mas_equalTo(lineVIew.mas_bottom).offset(15);
            make.width.mas_equalTo(30);
            make.height.mas_equalTo(20);
        }];
        
        // 姓名
        self.nameLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.nameLabel];
        self.nameLabel.preferredMaxLayoutWidth = screenWidth - 135;
        self.nameLabel.numberOfLines = 1;
        self.nameLabel.font = [UIFont systemFontOfSize:16];
        _nameLabel.backgroundColor = [UIColor clearColor];
        _nameLabel.textColor = [UIColor blackColor];
        _nameLabel.textAlignment = NSTextAlignmentLeft;
        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(weakSelf.headImageBtn.mas_right).offset(15);
            make.top.mas_equalTo(weakSelf.headImageBtn);
            make.right.mas_equalTo(weakSelf.handleBtn.mas_left).offset(-10);
            make.height.mas_equalTo(20);
        }];
        
        // 性别
        self.sexImage = [[UIImageView alloc]init];
        self.sexImage.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:self.sexImage];
        [self.sexImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(weakSelf.nameLabel);
            make.top.mas_equalTo(weakSelf.nameLabel.mas_bottom).offset(10);
            make.width.mas_equalTo(10);
            make.height.mas_equalTo(15);
        }];
        
        // 年龄
        self.ageLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.ageLabel];
        self.ageLabel.numberOfLines = 1;
        self.ageLabel.font = [UIFont systemFontOfSize:14];
        self.ageLabel.backgroundColor = [UIColor clearColor];
        self.ageLabel.textColor = [UIColor darkGrayColor];
        self.ageLabel.textAlignment = NSTextAlignmentLeft;
        [self.ageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(weakSelf.sexImage.mas_right).offset(10);
            make.top.mas_equalTo(weakSelf.sexImage);
            make.width.mas_equalTo(40);
            make.height.mas_equalTo(15);
        }];
        
        // 文字
        self.contentLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.contentLabel];
        self.contentLabel.numberOfLines = 0;
        self.nameLabel.preferredMaxLayoutWidth = screenWidth - 40;
        self.contentLabel.font = [UIFont systemFontOfSize:15];
        self.contentLabel.backgroundColor = [UIColor clearColor];
        self.contentLabel.textColor = [UIColor darkGrayColor];
        self.contentLabel.textAlignment = NSTextAlignmentLeft;
        [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(20);
            make.right.mas_equalTo(-20);
            make.top.mas_equalTo(weakSelf.headImageBtn.mas_bottom).offset(10);
        }];
        
        // 多图片
        self.picView = [PicView new];
        [self.contentView addSubview:self.picView];
        [self.picView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentLabel);
            make.top.mas_equalTo(self.contentLabel.mas_bottom).offset(10);
        }];
        
        // 时间
        self.timeLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.timeLabel];
        self.timeLabel.numberOfLines = 1;
        self.timeLabel.font = [UIFont systemFontOfSize:13];
        self.timeLabel.backgroundColor = [UIColor clearColor];
        self.timeLabel.textColor = [UIColor lightGrayColor];
        self.timeLabel.textAlignment = NSTextAlignmentLeft;
        [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(20);
            make.top.mas_equalTo(_picView.mas_bottom).offset(10);
            make.width.mas_equalTo(60);
            make.height.mas_equalTo(20);
        }];
        
        // 距离
        self.distanceLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.distanceLabel];
        self.distanceLabel.numberOfLines = 1;
        self.distanceLabel.font = [UIFont systemFontOfSize:13];
        self.distanceLabel.backgroundColor = [UIColor clearColor];
        self.distanceLabel.textColor = [UIColor darkGrayColor];
        self.distanceLabel.textAlignment = NSTextAlignmentLeft;
        [self.distanceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(weakSelf.timeLabel.mas_right).offset(10);
            make.top.mas_equalTo(weakSelf.timeLabel);
            make.width.mas_equalTo(40);
            make.height.mas_equalTo(20);
        }];
        
        CGFloat m = screenWidth-310;
        
        // 赞按钮
        self.supportBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.supportBtn.contentMode = UIViewContentModeScaleAspectFit;
        self.supportBtn.backgroundColor = [UIColor clearColor];
        [_supportBtn setImage:[UIImage imageNamed:@"zan"] forState:UIControlStateNormal];
        [_supportBtn setImage:[UIImage imageNamed:@"dianzan"] forState:UIControlStateSelected];
        _supportBtn.selected = NO;
        [self.supportBtn addTarget:self action:@selector(tapSupport:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:self.supportBtn];
        [self.supportBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(weakSelf.distanceLabel.mas_right).offset(m);
            make.top.mas_equalTo(weakSelf.timeLabel);
            make.width.mas_equalTo(40);
            make.height.mas_equalTo(20);
        }];
        
        // 赞label
        self.supportLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.supportLabel];
        self.supportLabel.numberOfLines = 1;
        self.supportLabel.font = [UIFont systemFontOfSize:13];
        self.supportLabel.backgroundColor = [UIColor clearColor];
        self.supportLabel.textColor = [UIColor blackColor];
        self.supportLabel.textAlignment = NSTextAlignmentRight;
        [self.supportLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(weakSelf.supportBtn.mas_right).offset(0);
            make.top.mas_equalTo(weakSelf.timeLabel);
            make.width.mas_equalTo(30);
            make.height.mas_equalTo(20);
        }];
        
        // 评论按钮
        self.reviewBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.reviewBtn.contentMode = UIViewContentModeScaleAspectFit;
        self.reviewBtn.backgroundColor = [UIColor clearColor];
        [_reviewBtn setImage:[UIImage imageNamed:@"Slice Copy"] forState:UIControlStateNormal];
        [self.reviewBtn addTarget:self action:@selector(tapReview:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:self.reviewBtn];
        [self.reviewBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(weakSelf.supportLabel.mas_right).offset(10);
            make.top.mas_equalTo(weakSelf.timeLabel);
            make.width.mas_equalTo(40);
            make.height.mas_equalTo(20);
        }];
        
        // 评论label
        self.reviewLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.reviewLabel];
        self.reviewLabel.numberOfLines = 1;
        self.reviewLabel.font = [UIFont systemFontOfSize:13];
        self.reviewLabel.backgroundColor = [UIColor clearColor];
        self.reviewLabel.textColor = [UIColor blackColor];
        self.reviewLabel.textAlignment = NSTextAlignmentRight;
        [self.reviewLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(weakSelf.reviewBtn.mas_right).offset(0);
            make.top.mas_equalTo(weakSelf.timeLabel);
            make.width.mas_equalTo(30);
            make.height.mas_equalTo(20);
        }];
        
        // 评论tableview
        self.tableView = [[UITableView alloc] init];
        self.tableView.scrollEnabled = NO;
        [self.contentView addSubview:self.tableView];
        [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(20);
            make.right.mas_equalTo(-20);
            make.top.mas_equalTo(weakSelf.timeLabel.mas_bottom).offset(10);
        }];
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.hyb_lastViewInCell = self.tableView;
        self.hyb_bottomOffsetToCell = 10;
    }
    
    return self;
}

#pragma mark 设置数据
-(void)setCellInfo:(ImageActionModel *)action
{
    
    _uid = action.uid;
    [_headImageBtn setImage:action.headImage forState:UIControlStateNormal];
    _nameLabel.text = action.name;
    if ([action.sex isEqualToString:@"男"]) {
        _sexImage.image = [UIImage imageNamed:@"男"];
    }else if ([action.sex isEqualToString:@"女"]){
        _sexImage.image = [UIImage imageNamed:@"女"];
    }
    _ageLabel.text = action.age;
    _contentLabel.text = action.content;
    _timeLabel.text = action.time_t;
    _distanceLabel.text = action.stance;
    _pinglun_arr = action.commentModels;
    
    if ([action.zanCount isEqualToString:@"0"]) {
        _supportLabel.text = @"赞";
    }else{
        _supportLabel.text = action.zanCount;
    }
    if ([action.pinglunCount isEqualToString:@"0"]) {
        _reviewLabel.text = @"评论";
    }else{
        _reviewLabel.text = action.pinglunCount;
    }
    

    CGFloat jjg_height = 0.0;
    CGFloat jjg_width = 0.0;
    if (action.image_arr.count>0&&action.image_arr.count<=3) {
        jjg_height = [PicView imageHeight];
        jjg_width  = (action.image_arr.count)*([PicView imageWidth]+10)-10;
    }else if (action.image_arr.count>3&&action.image_arr.count<=6){
        jjg_height = 2*([PicView imageHeight]+10)-10;
        jjg_width  = 3*([PicView imageWidth]+10)-10;
    }else  if (action.image_arr.count>6&&action.image_arr.count<=9){
        jjg_height = 3*([PicView imageHeight]+10)-10;
        jjg_width  = 3*([PicView imageWidth]+10)-10;
    }
    ///解决图片复用问题
    [self.picView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    ///布局九宫格
    [self.picView PicView:self.picView DataSource:action.image_arr completeBlock:^(NSInteger index, NSArray *dataSource, NSIndexPath *indexpath) {
        // 响应点击事件
        if ([self.delegate respondsToSelector:@selector(didTapImageAtIndex:WithImage:)]) {
            
            [self.delegate didTapImageAtIndex:index WithImage:dataSource];   ////   测试
        }
    }];
    [self.picView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentLabel);
        make.top.mas_equalTo(self.contentLabel.mas_bottom).offset(10);
        make.size.mas_equalTo(CGSizeMake(jjg_width, jjg_height));
    }];

    
    CGFloat tableViewHeight = 0;
    for (pingLunInfoModel * commentModel in action.commentModels) {
    
        CGFloat cellHeight = [PingLun_2_ActionCell hyb_heightForTableView:self.tableView config:^(UITableViewCell *sourceCell) {
            PingLun_2_ActionCell *cell = (PingLun_2_ActionCell *)sourceCell;
            [cell setCellInfo:commentModel];
        } cache:^NSDictionary *{
            return @{kHYBCacheUniqueKey : commentModel.cid,
                    kHYBCacheStateKey : @"",
                    kHYBRecalculateForStateKey : @(NO)};
        }];
        tableViewHeight += cellHeight;
    }
    
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(tableViewHeight);
    }];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView reloadData];
}


#pragma mark 点击头像按钮回调
- (void)tapHeadImage:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(didTapHeadImageButton:)]) {
        [self.delegate didTapHeadImageButton:_uid];
    }
}

#pragma mark 点击赞按钮回调
- (void)tapSupport:(UIButton *)sender
{
    if (sender.selected == NO) {
        sender.selected = YES;
    }else{
        sender.selected = NO;
    }
    
    
    if ([self.delegate respondsToSelector:@selector(didTapZanButton:)]) {
        [self.delegate didTapZanButton:_uid];
    }
}

#pragma mark 点击评论按钮回调
- (void)tapReview:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(didTapPinglunButton:)]) {
        [self.delegate didTapPinglunButton:_uid];
    }
}

#pragma mark 点击操作按钮
- (void)tapHandle:(UIButton *)sender
{
    if (self.block) {
        self.block(sender);
    }
}

#pragma mark 点击评论姓名按钮

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectio
{
    
    return _pinglun_arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    pingLunInfoModel * info = _pinglun_arr[indexPath.row];
    
    PingLun_2_ActionCell * cell = [tableView dequeueReusableCellWithIdentifier:@"pinglun_2"];
    if (!cell) {
        cell = [[PingLun_2_ActionCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"pinglun_2"];
    }
        
        
    [cell setCellInfo:info];
    cell.block = ^(NSString * uid){
        if (self.name_block) {
            self.name_block(uid);
        }
    };
        
    return cell;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    pingLunInfoModel *model = _pinglun_arr[indexPath.row];
    
    return [PingLun_2_ActionCell hyb_heightForTableView:self.tableView config:^(UITableViewCell *sourceCell) {
        PingLun_2_ActionCell *cell = (PingLun_2_ActionCell *)sourceCell;
        [cell setCellInfo:model];
    } cache:^NSDictionary *{
        return @{kHYBCacheUniqueKey : model.cid,
                kHYBCacheStateKey : @"",
                kHYBRecalculateForStateKey : @(NO)};
    }];
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
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




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
