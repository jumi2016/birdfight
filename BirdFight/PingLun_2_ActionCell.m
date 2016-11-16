//
//  PingLun_2_ActionCell.m
//  BirdFight
//
//  Created by 聚米 on 16/10/24.
//  Copyright © 2016年 聚米. All rights reserved.
//

#import "PingLun_2_ActionCell.h"
#import "pingLunInfoModel.h"
#import "UITableViewCell+Bird.h"
#import "UITableViewCell+HYBMasonryAutoCellHeight.h"
#import "Masonry.h"
#import "UILabel+YBAttributeTextTapAction.h"

@interface PingLun_2_ActionCell ()<YBAttributeTapActionDelegate>

@property (strong, nonatomic)  UILabel * pinglun_label;

@property (nonatomic, weak) id<UITableViewCellDelegate> delegate; // 代理属性

@property (nonatomic, strong) NSString * uid_one; // 用户标识uid
@property (nonatomic, strong) NSString * uid_two; // 用户标识uid

@end


@implementation PingLun_2_ActionCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        
        self.contentView.backgroundColor = [UIColor whiteColor];
        
        // 固定label
        self.pinglun_label = [[UILabel alloc] init];
        [self.contentView addSubview:self.pinglun_label];
        self.pinglun_label.preferredMaxLayoutWidth = self.contentView.bounds.size.width;
        self.pinglun_label.numberOfLines = 0;
        self.pinglun_label.lineBreakMode = NSLineBreakByWordWrapping;
        //设置是否有点击效果，默认是YES
        self.pinglun_label.enabledTapEffect = YES;
        self.pinglun_label.textAlignment = NSTextAlignmentLeft;
        [self.pinglun_label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(5);
            make.left.mas_equalTo(0);
            make.right.mas_equalTo(-3);
        }];
        
        self.hyb_lastViewInCell = self.pinglun_label;
    }
    
    return self;
}


#pragma mark 设置数据
-(void)setCellInfo:(pingLunInfoModel *)info
{
    
    _uid_one = info.uid_one;
    _uid_two = info.uid_two;
    
    NSString * one_str = info.name_one;
    NSString * two_str = info.name_two;
    NSString * content_str = info.content;
    
    NSMutableArray * ranges = [NSMutableArray array]; // 修改文字颜色
    NSMutableArray * actionStrs = [NSMutableArray array]; // 添加点击事件
    
    NSString * str = [NSString string];
    
    if ([two_str isEqualToString:@""]) {
        str = [NSString stringWithFormat:@"%@ : %@",one_str,content_str];
    }else{
        str = [NSString stringWithFormat:@"%@ 回复 %@ : %@",one_str,two_str,content_str];
    }
    
    // 点击
    [actionStrs addObject:one_str];
    [actionStrs addObject:two_str];
    
    // 特殊字符串
    NSRange range1 = [str rangeOfString:one_str];
    [ranges addObject:[NSValue valueWithRange:range1]];
    
    NSRange range2 = [str rangeOfString:two_str];
    [ranges addObject:[NSValue valueWithRange:range2]];
    
    // 转换成富文本字符串
    NSMutableAttributedString * attStr = [[NSMutableAttributedString alloc] initWithString:str];
    [attStr addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13],NSForegroundColorAttributeName:[UIColor darkGrayColor]} range:NSMakeRange(0, str.length)];
    
    // 最好设置一下行高，不设的话默认是0
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineSpacing = 0;
    [attStr addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, str.length)];
    
    // 给指定文字添加颜色
    for (NSValue * rangeVal in ranges) {
        [attStr addAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:80/255.0 green:227/255.0 blue:194/255.0 alpha:1]} range:rangeVal.rangeValue];
    }
    
    self.pinglun_label.attributedText = attStr;
    
    // 给指定文字添加点击事件
    [self.pinglun_label yb_addAttributeTapActionWithStrings:actionStrs delegate:self];
    
}

#pragma mark 点击评论中姓名
// 点击代理
- (void)yb_attributeTapReturnString:(NSString *)string range:(NSRange)range index:(NSInteger)index
{
    if (index == 0) {
        if (self.block) {
            self.block(_uid_one);
        }
    }else if (index == 1){
        if (self.block) {
            self.block(_uid_two);
        }
    }
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
