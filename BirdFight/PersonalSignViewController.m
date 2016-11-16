//
//  PersonalSignViewController.m
//  BirdFight
//
//  Created by 聚米 on 16/10/15.
//  Copyright © 2016年 聚米. All rights reserved.
//

#import "PersonalSignViewController.h"

@interface PersonalSignViewController ()

@property (weak, nonatomic) IBOutlet UIView *view_tf;// 输入背景
@property (weak, nonatomic) IBOutlet UITextView *textView_Sign; // 输入框
@property (weak, nonatomic) IBOutlet UIView *view_1; // 红点
@property (weak, nonatomic) IBOutlet UIView *view_2; // 红点


@end

@implementation PersonalSignViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // 设置导航栏
    self.title = @"个性签名";
    UIBarButtonItem * rightBtn = [[UIBarButtonItem alloc]initWithTitle:@"保存" style:UIBarButtonItemStyleDone target:self action:@selector(tapRightBtn)];
    self.navigationItem.rightBarButtonItem = rightBtn;
    
    // 设置属性
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    _view_tf.backgroundColor = [UIColor whiteColor];
    _textView_Sign.backgroundColor = [UIColor clearColor];
    self.automaticallyAdjustsScrollViewInsets = NO;// 让文字在最顶端显示
    _view_1.layer.cornerRadius = 4;
    _view_2.layer.cornerRadius = 4;
    
}

#pragma mark 点击保存按钮
-(void)tapRightBtn
{
    NSLog(@"点击了保存");
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
