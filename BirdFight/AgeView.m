//
//  AgeView.m
//  BirdFight
//
//  Created by 聚米 on 16/10/19.
//  Copyright © 2016年 聚米. All rights reserved.
//

#import "AgeView.h"
#import "UIView+ShowView.h"
#import "AutoFillScreenUtils.h"

@interface AgeView ()

@property (nonatomic, strong) UILabel * label_title; // 标题
@property (nonatomic, strong) UIView * view_line; // 分割线
/** 日期选择器 */
@property (nonatomic, strong) UIDatePicker * datePicker;
/** 日期 */
@property (nonatomic, strong) NSString * birthdayDate;

@property (nonatomic, strong) UIButton * button_done; // 确定
@property (nonatomic, strong) UIButton * button_cancel; // 取消

@end

@implementation AgeView

#pragma mark 初始化
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self otherInit];
    }
    return self;
}

#pragma mark 初始化
- (void)awakeFromNib
{
    [super awakeFromNib];
    [self otherInit];
}

#pragma mark 方法
-(void)otherInit
{
    self.backgroundColor = [UIColor clearColor];
    
    //初始化组建
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(20, 210, 280, 290)];
    view.backgroundColor = [UIColor whiteColor];
    [AutoFillScreenUtils autoLayoutFillScreen:view];
    [self addSubview:view];
    
    // 初始化view控件
    _label_title = [[UILabel alloc]initWithFrame:CGRectMake(40, 2, 200, 30)];
    _label_title.text = @"请选择具体日期";
    _label_title.textColor = [UIColor lightGrayColor];
    _label_title.textAlignment = NSTextAlignmentCenter;
    _label_title.backgroundColor = [UIColor clearColor];
    _label_title.font = [UIFont systemFontOfSize:17];
    [view addSubview:_label_title];
    
    _view_line = [[UIView alloc]initWithFrame:CGRectMake(0, 34, 280, 1)];
    _view_line.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [view addSubview:_view_line];
    
    _button_done = [UIButton buttonWithType:UIButtonTypeCustom];
    _button_done.frame = CGRectMake(0, 255, 280, 35);
    [_button_done setTitle:@"确定" forState:UIControlStateNormal];
    [_button_done setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _button_done.backgroundColor = [UIColor colorWithRed:249/255.0 green:83/255.0 blue:100/255.0 alpha:1];
    [_button_done addTarget:self action:@selector(tapBtnToDone) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:_button_done];
    
    _button_cancel = [UIButton buttonWithType:UIButtonTypeCustom];
    _button_cancel.frame = CGRectMake(145, 515, 30, 30);
    [_button_cancel setImage:[UIImage imageNamed:@"xxxx"] forState:UIControlStateNormal];
    [_button_cancel addTarget:self action:@selector(tapBtnForDismiss) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_button_cancel];
    

    
    self.datePicker = [[UIDatePicker alloc]initWithFrame:CGRectMake(0, 55, 280, 180)];
    [view addSubview:self.datePicker];
    //设置监听事件，
    [self.datePicker addTarget:self action:@selector(dateChanged:) forControlEvents:UIControlEventValueChanged];
    NSLocale * locale = [[NSLocale alloc]initWithLocaleIdentifier:@"zh_CN"];
    self.datePicker.locale = locale;
    //设置类型
    self.datePicker.datePickerMode = UIDatePickerModeDate;
    //当前时间创建NSDate
    NSDate * localDate = [NSDate date];
    //在当前时间加上的时间：格里高利历
    NSCalendar * gregorian = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents * offsetComponents = [[NSDateComponents alloc]init];
    //设置时间
    [offsetComponents setYear:-12];
    [offsetComponents setMonth:0];
    [offsetComponents setDay:0];
    //设置最大值时间
    NSDate * maxDate = [gregorian dateByAddingComponents:offsetComponents toDate:localDate options:0];
    //设置属性
    self.datePicker.maximumDate = maxDate;
    //清除线
    [self clearSeparatorWithView:self.datePicker];
    //默认值
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"YYYY-MM-dd"];
    NSString * dateString = [dateFormatter stringFromDate:maxDate];
    self.birthdayDate = dateString;
}

#pragma mark 取消
- (void)tapBtnForDismiss
{
    [self dismiss];
}

#pragma mark 确定
- (void)tapBtnToDone
{
    
    [self dismiss];
    // 值传递
    if (self.block) {
        self.block(self.birthdayDate);
    }
}

#pragma mark 日期改变
-(void)dateChanged:(id)sender{
    UIDatePicker * control = (UIDatePicker *)sender;
    NSDate * date = control.date;
    
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"YYYY-MM-dd"];
    NSString * dateString = [dateFormatter stringFromDate:date];
    self.birthdayDate = dateString;
}

#pragma mark 清除线
- (void)clearSeparatorWithView:(UIView * )view
{
    if(view.subviews != 0  )
    {
        if(view.bounds.size.height < 5)
        {
            view.backgroundColor = [UIColor clearColor];
        }
        
        [view.subviews enumerateObjectsUsingBlock:^( UIView *  obj, NSUInteger idx, BOOL *  stop) {
            [self clearSeparatorWithView:obj];
        }];
    }
}




@end
