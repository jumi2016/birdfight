//
//  AgeViewController.m
//  BirdFight
//
//  Created by 聚米 on 16/10/19.
//  Copyright © 2016年 聚米. All rights reserved.
//

#import "AgeViewController.h"
#import "AutoFillScreenUtils.h"
#import "AgeView.h"
#import "UIView+ShowView.h"
#import "BaseMethod.h"

@interface AgeViewController ()

@property (weak, nonatomic) IBOutlet UIView *view_back;
@property (weak, nonatomic) IBOutlet UILabel *label_1;
@property (weak, nonatomic) IBOutlet UILabel *label_2;
@property (weak, nonatomic) IBOutlet UILabel *label_3;
@property (weak, nonatomic) IBOutlet UIView *view_1;
@property (weak, nonatomic) IBOutlet UIView *view_2;
@property (weak, nonatomic) IBOutlet UIButton *button_select;
@property (weak, nonatomic) IBOutlet UILabel *label_star;
@property (weak, nonatomic) IBOutlet UISwitch *switch_age;

@property (nonatomic, strong) AgeView * ageView;

@end

@implementation AgeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // 设置导航栏
    self.title = @"修改年龄";
    UIBarButtonItem * rightBtn = [[UIBarButtonItem alloc]initWithTitle:@"保存" style:UIBarButtonItemStyleDone target:self action:@selector(tapRightBtn)];
    self.navigationItem.rightBarButtonItem = rightBtn;
    
    // 设置属性
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    _view_back.frame = CGRectMake(0, 70, 320, 135);
    _label_1.frame = CGRectMake(10, 2, 40, 40);
    _view_1.frame = CGRectMake(10, 44, 300, 1);
    _label_2.frame = CGRectMake(10, 47, 40, 40);
    _view_2.frame = CGRectMake(10, 89, 300, 1);
    _label_3.frame = CGRectMake(10, 92, 100, 40);
    _button_select.frame = CGRectMake(50, 2, 260, 40);
    _label_star.frame = CGRectMake(210, 47, 100, 40);
    _switch_age.frame = CGRectMake(260, 97, 40, 30);

    // 等比例约束
    [AutoFillScreenUtils autoLayoutFillScreen:self.view];
}

#pragma mark 点击保存按钮
-(void)tapRightBtn
{
    NSLog(@"点击了保存按钮");
    [self.navigationController popViewControllerAnimated:YES];
    
    
    
    
    
    
    
    
    
    
}

#pragma mark 权限点击按钮跳转界面传递
- (void)loadAuthorizationBlock
{
    // 按钮传值事件
    __weak __block AgeViewController * copy_self = self;
    _ageView.block = ^(NSString * str){
        copy_self.ageStr = str;
        if (copy_self.ageStr != nil) {
            
            // 取出年份判断年龄
            NSString * str = [copy_self.ageStr substringToIndex:4];
            NSDate * date = [NSDate date];
            NSDateFormatter * dateFormatter = [[NSDateFormatter alloc]init];
            [dateFormatter setDateFormat:@"YYYY"];
            NSString * dateString = [dateFormatter stringFromDate:date];
            int i = [dateString intValue]-[str intValue];
            [copy_self.button_select setTitle:[NSString stringWithFormat:@"%d",i] forState:UIControlStateNormal];
            //取出日期判断星座
            NSString * month = [copy_self.ageStr substringWithRange:NSMakeRange(5, 2)];
            NSString * day = [copy_self.ageStr substringWithRange:NSMakeRange(8, 2)];
            NSString * star = [BaseMethod getAstroWithMongth:[month intValue] Day:[day intValue]];
            copy_self.label_star.text = [NSString stringWithFormat:@"%@座",star];
        }
    };
}

#pragma mark 点击选择按钮
- (IBAction)tapButtonSelect:(UIButton *)sender
{
    _ageView = [[AgeView alloc]initWithFrame:self.view.bounds];
    [AutoFillScreenUtils autoLayoutFillScreen:_ageView];
    [self.view addSubview:_ageView];

    // 传值
    [self loadAuthorizationBlock];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
