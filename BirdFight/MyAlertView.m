//
//  MyAlertView.m
//  BirdFight
//
//  Created by 聚米 on 16/10/20.
//  Copyright © 2016年 聚米. All rights reserved.
//

#import "MyAlertView.h"
#import "UIView+ShowView.h"
#import "AutoFillScreenUtils.h"

@interface MyAlertView ()<UIPickerViewDelegate,UIPickerViewDataSource>

@property (nonatomic, strong) UILabel * label_title; // 标题
@property (nonatomic, strong) UIView * view_line; // 分割线
/** 选择器 */
@property (nonatomic, strong) UIPickerView * pickerV;
/** 数据数组 */
@property (nonatomic, strong) NSArray * arr;
/** 传出字符串 */
@property (copy, nonatomic) NSString * str;

@property (nonatomic, strong) UIButton * button_done; // 确定
@property (nonatomic, strong) UIButton * button_cancel; // 取消

@end

@implementation MyAlertView

#pragma mark 初始化
-(instancetype)initWithFrame:(CGRect)frame withTitle:(NSString *)title withArray:(NSArray *)arr
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _arr = arr;
        [self otherInit];
        _label_title.text = title;
        
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
//    self.backgroundColor = [UIColor clearColor];
    
    //初始化组建
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(20, 100, 280, 290)];
    view.backgroundColor = [UIColor whiteColor];
    [AutoFillScreenUtils autoLayoutFillScreen:view];
    [self addSubview:view];
    
    // 初始化view控件
    _label_title = [[UILabel alloc]initWithFrame:CGRectMake(40, 2, 200, 30)];
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
    _button_cancel.frame = CGRectMake(145, 405, 30, 30);
    [_button_cancel setImage:[UIImage imageNamed:@"cancel_x"] forState:UIControlStateNormal];
    [_button_cancel addTarget:self action:@selector(tapBtnForDismiss) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_button_cancel];
    
    self.pickerV = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 55, 280, 180)];
    self.pickerV.delegate = self;
    self.pickerV.dataSource = self;
    self.pickerV.tag = 1001;
    [view addSubview:self.pickerV];
    [self clearSeparatorWithView:self.pickerV];
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
        self.block(self.str);
    }
}

#pragma mark 设置pickView
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return _arr.count;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString * title = _arr[row];
    return title;
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.str = self.arr[[pickerView selectedRowInComponent:0]];
    
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

//#pragma mark 字体大小
//-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
//{
//    UILabel* pickerLabel = (UILabel*)view;
//    if (!pickerLabel){
//        pickerLabel = [[UILabel alloc] init];
//        pickerLabel.adjustsFontSizeToFitWidth = YES;
//        [pickerLabel setTextAlignment:NSTextAlignmentCenter];
//        [pickerLabel setBackgroundColor:[UIColor clearColor]];
//        [pickerLabel setFont:[UIFont boldSystemFontOfSize:15]];
//    }
//    pickerLabel.text=[self pickerView:pickerView titleForRow:row forComponent:component];
//    return pickerLabel;
//}


@end
