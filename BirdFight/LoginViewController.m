//
//  LoginViewController.m
//  BirdFight
//
//  Created by 聚米 on 16/10/11.
//  Copyright © 2016年 聚米. All rights reserved.
//

#import "LoginViewController.h"
#import "UIButton+Bird.h"
#import "UIView+ShowView.h"
#import "ForgetViewController.h"
#import "RegisterViewController.h"
#import "AutoFillScreenUtils.h"
#import "AuthorizationView.h"
#import "SexSelectionViewController.h"

@interface LoginViewController ()<UINavigationControllerDelegate>
/** 手机号输入 */
@property (weak, nonatomic) IBOutlet UITextField *telField;
/** 密码输入 */
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
/** 忘记密码按钮 */
@property (weak, nonatomic) IBOutlet UIButton *forgetBtn;
/** 登录按钮 */
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
/** 看看按钮 */
@property (weak, nonatomic) IBOutlet UIButton *seeBtn;
/** 注册按钮 */
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;
/** QQ按钮 */
@property (weak, nonatomic) IBOutlet UIButton *QQBtn;
/** 微信按钮 */
@property (weak, nonatomic) IBOutlet UIButton *weixinBtn;
/** 微博按钮 */
@property (weak, nonatomic) IBOutlet UIButton *weiboBtn;
/** 权限界面 */
@property (nonatomic, strong) AuthorizationView * authorizationView;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // 设置navigation返回按钮
    UIBarButtonItem * buttonItem = [[UIBarButtonItem alloc]init];
    buttonItem.title = @"返回";
    self.navigationItem.backBarButtonItem= buttonItem;
    // 设置textField
    self.telField.backgroundColor = [UIColor clearColor];
    self.telField.borderStyle = UITextBorderStyleNone;
    self.passwordField.backgroundColor = [UIColor clearColor];
    self.passwordField.borderStyle = UITextBorderStyleNone;
    [self.telField setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    [self.passwordField setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    // 设置忘记密码按钮
    [self.forgetBtn setTitle:@"忘记密码？" forState:UIControlStateNormal];
    [self.forgetBtn setTitleColor:[UIColor colorWithRed:249/255.0 green:83/255.0 blue:100/255.0 alpha:1] forState:UIControlStateNormal];
    self.forgetBtn.backgroundColor = [UIColor clearColor];
    // 设置登录按钮
    [self.loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [self.loginBtn diyStyle];
    // 设置看看按钮
    [self.seeBtn setTitle:@"随便看看" forState:UIControlStateNormal];
    [self.seeBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.seeBtn diyStyleOther];
    // 设置注册按钮
    [self.registerBtn setTitle:@"注册" forState:UIControlStateNormal];
    [self.registerBtn setTitleColor:[UIColor colorWithRed:249/255.0 green:83/255.0 blue:100/255.0 alpha:1] forState:UIControlStateNormal];
    [self.registerBtn diyStyleOther];
    
}

#pragma mark 权限点击按钮跳转界面传递
- (void)loadAuthorizationBlock
{
    // 按钮传值事件
    __weak __block LoginViewController * copy_self = self;
    _authorizationView.block = ^{
        SexSelectionViewController * vc = [[SexSelectionViewController alloc]initWithNibName:@"SexSelectionViewController" bundle:nil];
        UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:vc];
        [copy_self presentViewController:nav animated:YES completion:nil];
    };
}

#pragma mark 利用生命周期设置是否隐藏 navigationBar
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

#pragma mark 点击忘记密码
- (IBAction)tapforget:(UIButton *)sender
{
    ForgetViewController * vc = [[ForgetViewController alloc]initWithNibName:@"ForgetViewController" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark 点击登录
- (IBAction)taploginBtn:(UIButton *)sender
{
    // 判断权限界面是否有值，无值跳转权限界面，有值再判断身份选择界面是否有值，有值跳转主界面，无值跳转身份界面
    
    
    
    // 加载权限界面
    _authorizationView = [[AuthorizationView alloc]initWithFrame:self.view.bounds];
    [AutoFillScreenUtils autoLayoutFillScreen:_authorizationView];
    [_authorizationView show];
    // 加载按钮跳转事件
    [self loadAuthorizationBlock];
    
    
    
    

}

#pragma mark 点击随便看看
- (IBAction)tapseeBtn:(UIButton *)sender
{
    
}

#pragma mark 点击注册
- (IBAction)tapregisterBtn:(UIButton *)sender
{
    RegisterViewController * vc = [[RegisterViewController alloc]initWithNibName:@"RegisterViewController" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark 点击QQ
- (IBAction)tapQQBtn:(UIButton *)sender
{
    
}

#pragma mark 点击微信
- (IBAction)tapweixinBtn:(UIButton *)sender
{
    
}

#pragma mark 点击微博
- (IBAction)tapweiboBtn:(UIButton *)sender
{
    
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
