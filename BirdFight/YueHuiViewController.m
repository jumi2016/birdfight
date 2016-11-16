//
//  YueHuiViewController.m
//  BirdFight
//
//  Created by 聚米 on 16/10/15.
//  Copyright © 2016年 聚米. All rights reserved.
//

#import "YueHuiViewController.h"
#import "AutoFillScreenUtils.h"

@interface YueHuiViewController ()

@property (weak, nonatomic) IBOutlet UIView *view_back;
@property (weak, nonatomic) IBOutlet UIButton *acceptBtn;
@property (weak, nonatomic) IBOutlet UIButton *unAcceptBtn;
@property (weak, nonatomic) IBOutlet UILabel *label_1;
@property (weak, nonatomic) IBOutlet UILabel *label_2;


@end

@implementation YueHuiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // 设置导航栏
    self.title = @"是否接受线下约会";
    UIBarButtonItem * rightBtn = [[UIBarButtonItem alloc]initWithTitle:@"保存" style:UIBarButtonItemStyleDone target:self action:@selector(tapRightBtn)];
    self.navigationItem.rightBarButtonItem = rightBtn;
    
    // 设置属性
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    _view_back.frame = CGRectMake(0, 80, 320, 160);
    _acceptBtn.frame = CGRectMake(60, 30, 60, 60);
    _unAcceptBtn.frame = CGRectMake(200, 30, 60, 60);
    _label_1.frame = CGRectMake(60, 100, 60, 20);
    _label_2.frame = CGRectMake(200, 100, 60, 20);
    
    // 等比例约束
    [AutoFillScreenUtils autoLayoutFillScreen:self.view];
}

#pragma mark 点击保存按钮
-(void)tapRightBtn
{
    NSLog(@"点击了保存");
    // 返回
    [self.navigationController popViewControllerAnimated:YES];
    
    
    
    
    
    
    
}

#pragma mark 点击按钮
- (IBAction)tapAcceptBtn:(UIButton *)sender
{
    NSLog(@"点击了接受");
    // 返回
    [self.navigationController popViewControllerAnimated:YES];
    
    
    
    
    
    
    
    
}

- (IBAction)tapUnacceptBtn:(UIButton *)sender
{
    NSLog(@"点击了不接受");
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
