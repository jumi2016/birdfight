//
//  StruggleViewController.m
//  BirdFight
//
//  Created by 聚米 on 16/10/15.
//  Copyright © 2016年 聚米. All rights reserved.
//

#import "StruggleViewController.h"
#import "AutoFillScreenUtils.h"

@interface StruggleViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *Image_Strug; // 宣誓图片
@property (weak, nonatomic) IBOutlet UIView *view_tf; // 输入背景
@property (weak, nonatomic) IBOutlet UILabel *label_1; // 邮箱
@property (weak, nonatomic) IBOutlet UITextField *email_TF; // 输入框
@property (weak, nonatomic) IBOutlet UILabel *label_2; // 目的
@property (weak, nonatomic) IBOutlet UIButton *button_1; // 按钮1
@property (weak, nonatomic) IBOutlet UIButton *button_2; // 按钮2
@property (weak, nonatomic) IBOutlet UIButton *button_3; // 按钮3
@property (weak, nonatomic) IBOutlet UIButton *button_giveUp; // 放弃按钮


@end

@implementation StruggleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // 设置导航栏
    self.title = @"奋斗宣言";
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    // 设置控件
    _Image_Strug.frame = CGRectMake(15, 70, 290, 185);
    _view_tf.frame = CGRectMake(15, 265, 290, 40);
    _label_1.frame = CGRectMake(15, 5, 40, 30);
    _email_TF.frame = CGRectMake(65, 5, 205, 30);
    _email_TF.borderStyle = UITextBorderStyleNone;
    _label_2.frame = CGRectMake(30, 315, 260, 30);
    _button_1.frame = CGRectMake(45, 355, 230, 45);
    _button_1.layer.cornerRadius = 20;
    _button_1.layer.masksToBounds = YES;
    _button_2.frame = CGRectMake(45, 405, 230, 45);
    _button_2.layer.cornerRadius = 20;
    _button_2.layer.masksToBounds = YES;
    _button_3.frame = CGRectMake(45, 455, 230, 45);
    _button_3.layer.cornerRadius = 20;
    _button_3.layer.masksToBounds = YES;
    _button_giveUp.frame = CGRectMake(45, 505, 230, 45);
    _button_giveUp.layer.cornerRadius = 20;
    _button_giveUp.layer.masksToBounds = YES;
    
    // 等比例约束
    [AutoFillScreenUtils autoLayoutFillScreen:self.view];
}

#pragma mark 点击按钮1
- (IBAction)tapButton_1:(UIButton *)sender
{
    
    
    
    
    
    // 返回
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark 点击按钮2
- (IBAction)tapButton_2:(UIButton *)sender
{
    
    
    
    
    
    
    // 返回
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark 点击按钮3
- (IBAction)tapButton_3:(UIButton *)sender
{
    
    
    
    
    
    
    // 返回
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark 点击放弃按钮
- (IBAction)tapButton_giveUp:(UIButton *)sender
{
    // 返回
    [self.navigationController popViewControllerAnimated:YES];
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
