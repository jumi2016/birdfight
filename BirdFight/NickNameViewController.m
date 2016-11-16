//
//  NickNameViewController.m
//  BirdFight
//
//  Created by 聚米 on 16/10/15.
//  Copyright © 2016年 聚米. All rights reserved.
//

#import "NickNameViewController.h"

@interface NickNameViewController ()
@property (weak, nonatomic) IBOutlet UIView *view_tf; // 输入背景
@property (weak, nonatomic) IBOutlet UITextField *nameTF; // 输入框

@end

@implementation NickNameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // 设置导航栏
    self.title = @"修改昵称";
    UIBarButtonItem * rightBtn = [[UIBarButtonItem alloc]initWithTitle:@"保存" style:UIBarButtonItemStyleDone target:self action:@selector(tapRightBtn)];
    self.navigationItem.rightBarButtonItem = rightBtn;
    
    // 设置属性
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    _view_tf.backgroundColor = [UIColor whiteColor];
    _nameTF.backgroundColor = [UIColor clearColor];
    _nameTF.borderStyle = UITextBorderStyleNone;
}

#pragma mark 点击保存按钮
-(void)tapRightBtn
{
    NSLog(@"点击了保存按钮");
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
