//
//  ZJTextView.m
//  BirdFight
//
//  Created by 聚米 on 16/10/18.
//  Copyright © 2016年 聚米. All rights reserved.
//

#import "ZJTextView.h"

@interface ZJTextView ()

@property (nonatomic, weak) UILabel * placeholderLabel;

@end

@implementation ZJTextView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        UILabel * placeholderLabel = [[UILabel alloc]init];
        placeholderLabel.backgroundColor = [UIColor clearColor];
        placeholderLabel.numberOfLines = 0; // 设置行数
        [self addSubview:placeholderLabel];
        self.placeholderLabel = placeholderLabel;
        self.myPlaceholderColor = [UIColor lightGrayColor];
        self.font = [UIFont systemFontOfSize:15];
        self.textColor = [UIColor blackColor];
        
        // 监听文字变化
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange) name:UITextViewTextDidChangeNotification object:self];
    }
    return self;
}

// 通知方法
-(void)textDidChange
{
    self.placeholderLabel.hidden = self.hasText;
}

// 重写label的frame
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.placeholderLabel.frame = CGRectMake(2, 2, 100, 20);
}

// 重写文字，颜色，font
-(void)setMyPlaceholder:(NSString *)myPlaceholder
{
    _myPlaceholder = [myPlaceholder copy];
    self.placeholderLabel.text = myPlaceholder;
}

-(void)setMyPlaceholderColor:(UIColor *)myPlaceholderColor
{
    _myPlaceholderColor= myPlaceholderColor;
    
    //设置颜色
    
    self.placeholderLabel.textColor= myPlaceholderColor;
}

-(void)setFont:(UIFont *)font
{
    [super setFont:font];
    
    self.placeholderLabel.font= font;
    
}

// 重写方法，控制UIlabel的显示和隐藏
-(void)setText:(NSString *)text
{
    [super setText:text];
    [self textDidChange];
}

- (void)setAttributedText:(NSAttributedString*)attributedText
{
    
    [super setAttributedText:attributedText];
    
    [self textDidChange]; //这里调用的就是UITextViewTextDidChangeNotification 通知的回调
    
}

- (void)dealloc{
    
    [[NSNotificationCenter defaultCenter]removeObserver:UITextViewTextDidChangeNotification];
    
}









@end
