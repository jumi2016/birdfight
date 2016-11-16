//
//  RegisterViewController.m
//  BirdFight
//
//  Created by 聚米 on 16/10/11.
//  Copyright © 2016年 聚米. All rights reserved.
//

#import "RegisterViewController.h"
#import "MBProgressHUD+Bird.h"
#import "UIButton+Bird.h"
#import "NSString+Bird.h"
#import "RegisterAgreeViewController.h"


@interface RegisterViewController ()
{
    NSTimer * _timer; // 计时器
    int _second;
}
/** 手机号视图 */
@property (weak, nonatomic) IBOutlet UIView *view1;
/** 密码视图 */
@property (weak, nonatomic) IBOutlet UIView *view2;
/** 验证码视图 */
@property (weak, nonatomic) IBOutlet UIView *view3;
/** 手机号输入 */
@property (weak, nonatomic) IBOutlet UITextField *phoneTF;
/** 密码输入 */
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;
/** 验证码输入 */
@property (weak, nonatomic) IBOutlet UITextField *yanzhengTF;
/** 获取验证码按钮 */
@property (weak, nonatomic) IBOutlet UIButton *getYanZhengBtn;
/** 注册协议按钮 */
@property (weak, nonatomic) IBOutlet UIButton *agreeBtn;
/** 注册按钮 */
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;
/** 获取验证码label */
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // 设置标题
    self.title = @"注册";
    //设置背景色
    self.view.backgroundColor = [UIColor colorWithRed:246/255.0 green:246/255.0 blue:246/255.0 alpha:1];
    
    // 设置视图圆角
    [self viewLayerCornerRadius:_view1];
    [self viewLayerCornerRadius:_view2];
    UIImage * backImage = [UIImage imageNamed:@"view_2"];
    _view3.layer.contents = (id)backImage.CGImage;
    _view3.backgroundColor = [UIColor colorWithPatternImage:backImage];
    
    // 设置输入框
    _phoneTF.borderStyle = UITextBorderStyleNone;
    _yanzhengTF.borderStyle = UITextBorderStyleNone;
    _passwordTF.borderStyle = UITextBorderStyleNone;
    
    // 设置获取验证码按钮
    _getYanZhengBtn.backgroundColor = [UIColor clearColor];
    _label.backgroundColor = [UIColor colorWithRed:246/255.0 green:246/255.0 blue:246/255.0 alpha:1];
    _label.hidden = YES;
    _label.textColor = [UIColor colorWithRed:249/255.0 green:83/255.0 blue:100/255.0 alpha:1];
    
    // 默认60秒
    _second = 60;
    
    // 设置注册协议按钮
    [_agreeBtn setTitle:@"《注册协议》" forState:UIControlStateNormal];
    [_agreeBtn setTitleColor:[UIColor colorWithRed:249/255.0 green:83/255.0 blue:100/255.0 alpha:1] forState:UIControlStateNormal];
    
    // 设置确认按钮
    [self.registerBtn setTitle:@"注册" forState:UIControlStateNormal];
    [_registerBtn diyStyle];

    
}

#pragma mark 设置view的圆角
-(void)viewLayerCornerRadius:(UIView *)view
{
    view.layer.cornerRadius = 20;
    
    view.layer.masksToBounds = YES;
}

#pragma mark 点击获取验证码按钮
- (IBAction)tapGetYanZhengBtn:(UIButton *)sender
{
    // 先判断电话号码是否输入 再判断是否正确
    if (!self.phoneTF.text.length) {
        [MBProgressHUD showError:@"请输入电话号码"];
    }else if (self.phoneTF.text.length){
        BOOL isTel = [self.phoneTF.text isMobilePhoneNumber];
        if (!isTel) {
            [MBProgressHUD showError:@"请输入正确的手机号"];
        }else{
            
            // 发送方法  成功提示  失败提示  开启定时器
            
            _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerFireMethod:) userInfo:nil repeats:YES];
            
        
            
            
            
            
            
        }
    }
}

#pragma mark 点击协议按钮
- (IBAction)tapAgreeBtn:(UIButton *)sender
{
    // 跳转注册协议界面
    RegisterAgreeViewController * vc = [[RegisterAgreeViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark 点击注册按钮
- (IBAction)tapRegisterBtn:(UIButton *)sender
{
    if (!self.phoneTF.text.length) {
        [MBProgressHUD showError:@"请输入电话号码"];
    }
    else if (!self.passwordTF.text.length) {
        [MBProgressHUD showError:@"请输入密码"];
    }
    else if (!self.yanzhengTF.text.length) {
        [MBProgressHUD showError:@"请输入验证码"];
    }
    else{
        
        // 发送方法  成功提示  失败提示  停止定时器
        
        [self releaseTimer];
        
        [self.navigationController popViewControllerAnimated:YES];
        
   
        
        
        
        
        
    }
}

#pragma mark 倒计时方法验证码实现倒计时60秒，60秒后按钮变换开始的样子
- (void)timerFireMethod:(NSTimer *)timer
{
    if (_second == 1) {
        [timer invalidate];
        _second = 60;
        [_getYanZhengBtn setEnabled:YES];
        _label.hidden = YES;
        
    }else{
        _second--;
        [_getYanZhengBtn setEnabled:NO];
        NSString * text = [NSString stringWithFormat:@"%ds后重试",_second];
        _label.hidden = NO;
        _label.text = text;
    }
}

#pragma mark 如果确认完成，停止验证码倒数
- (void)releaseTimer
{
    if (_timer) {
        if ([_timer respondsToSelector:@selector(isValid)]) {
            if ([_timer isValid]) {
                [_timer invalidate];
                _second = 60;
            }
        }
    }
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
