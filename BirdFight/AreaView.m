//
//  AreaView.m
//  BirdFight
//
//  Created by 聚米 on 16/10/19.
//  Copyright © 2016年 聚米. All rights reserved.
//

#import "AreaView.h"
#import "UIView+ShowView.h"
#import "AutoFillScreenUtils.h"

@interface AreaView ()<UIPickerViewDelegate,UIPickerViewDataSource>

@property (nonatomic, strong) UILabel * label_title; // 标题
@property (nonatomic, strong) UIView * view_line; // 分割线
/** 选择器 */
@property (nonatomic, strong) UIPickerView * pickerV;
/** 省份数组 */
@property (nonatomic, strong) NSArray * provinces;
/** 城市数组 */
@property (nonatomic, strong) NSArray * cities;
/** 省份 */
@property (copy, nonatomic) NSString *state;
/** 城市 */
@property (copy, nonatomic) NSString *city;
/** 所有地区 */
@property (copy, nonatomic) NSString *area;

@property (nonatomic, strong) UIButton * button_done; // 确定
@property (nonatomic, strong) UIButton * button_cancel; // 取消

@end

@implementation AreaView

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
    
    self.pickerV = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 55, 280, 180)];
    self.pickerV.delegate = self;
    self.pickerV.dataSource = self;
    self.pickerV.tag = 1001;
    [view addSubview:self.pickerV];
    [self clearSeparatorWithView:self.pickerV];
    
    [self loadData];


}

#pragma mark 加载数据
-(void)loadData
{
    // 读取plist文件，从bundle目录获取文件路径
    NSString *path = [[NSBundle mainBundle] pathForResource:@"area" ofType:@"plist"];
    // 将plist文件读取到数组中
    self.provinces = [NSArray arrayWithContentsOfFile:path];
    self.cities = self.provinces[0][@"Cities"];
    self.state = [[self.provinces objectAtIndex:0] objectForKey:@"State"];
    self.city = [[self.cities objectAtIndex:0] objectForKey:@"city"];
    self.area = [NSString stringWithFormat:@"%@ %@",self.state,self.city];
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
        self.block(self.area);
    }
}

#pragma mark 设置pickView
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    NSInteger count;
    switch (component) {
        case 0:
            count = self.provinces.count;
            break;
        case 1:
            count = self.cities.count;
            break;
            
        default:
            break;
    }
    return count;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString * title = nil;
    switch (component) {
        case 0:
            title = self.provinces[row][@"State"];
            break;
        case 1:
            title = self.cities[row][@"city"];
            break;
        default:
            break;
    }
    return title;
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    switch (component) {
        case 0:
            self.cities = self.provinces[row][@"Cities"];
            // 更新城市表盘
            [pickerView reloadComponent:1];
            self.area = [self getProvinceAndCity:pickerView];
            break;
        case 1:
            self.area = [self getProvinceAndCity:pickerView];
            break;
        default:
            break;
    }
}

#pragma mark 封装获取省份和城市名称的方法
- (NSString *)getProvinceAndCity:(UIPickerView *)pickerView
{
    // 获取省份和城市名称
    NSString *provinceName = self.provinces[[pickerView selectedRowInComponent:0]][@"State"];
    NSString *cityName = self.cities[[pickerView selectedRowInComponent:1]][@"city"];
    NSString *provinceAndCity = [NSString stringWithFormat:@"%@ %@",provinceName,cityName];
    return provinceAndCity;
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

#pragma mark 字体大小
-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UILabel* pickerLabel = (UILabel*)view;
    if (!pickerLabel){
        pickerLabel = [[UILabel alloc] init];
        pickerLabel.adjustsFontSizeToFitWidth = YES;
        [pickerLabel setTextAlignment:NSTextAlignmentCenter];
        [pickerLabel setBackgroundColor:[UIColor clearColor]];
        [pickerLabel setFont:[UIFont boldSystemFontOfSize:15]];
    }
    pickerLabel.text=[self pickerView:pickerView titleForRow:row forComponent:component];
    return pickerLabel;
}


@end
