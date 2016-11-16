//
//  LaunchViewController.m
//  BirdFight
//
//  Created by 聚米 on 16/10/11.
//  Copyright © 2016年 聚米. All rights reserved.
//

#import "LaunchViewController.h"
#import "MainTabBarController.h"
#import "LoginViewController.h"
#import "AutoFillScreenUtils.h"

#define LAUNCH_IMAGE  @"launch"

@interface LaunchViewController ()

/** 启动页图片 */
@property (nonatomic, strong) UIImageView * imageView;

/** 计时器 */
@property (nonatomic, strong) NSTimer * timer;

/** 计数 */
@property (nonatomic, assign) int count;

@end

@implementation LaunchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _count = 3;
    self.view.backgroundColor = [UIColor whiteColor];
    // 初始化ImageVIew
    _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(60, 134, 200, 300)];
    _imageView.image = [UIImage imageNamed:LAUNCH_IMAGE];
    [self.view addSubview:_imageView];
    
    //等比例约束
    [AutoFillScreenUtils autoLayoutFillScreen:self.view];
    
    // 计时器初始化
    if (!_timer) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(countDown) userInfo:nil repeats:YES];
    }
}

#pragma mark 重载约束
-(void)viewDidLayoutSubviews
{
    _imageView.frame = CGRectMake(60, 134, 200, 300);
    //等比例约束
    [AutoFillScreenUtils autoLayoutFillScreen:self.view];
}

#pragma mark 计时器方法
-(void)countDown
{
    _count--;
    if (_count == 0) {
        [self.timer invalidate];
        self.timer = nil;
        // 判断用户是否登录
        NSString * uid = [[NSUserDefaults standardUserDefaults] objectForKey:@"uid"];
        
        // 如果有则直接跳转主页
        if (uid) {
            // 主页VC
            MainTabBarController * vc = [[MainTabBarController alloc]initWithNibName:@"MainTabBarController" bundle:nil];
            self.view.window.rootViewController = vc;
            vc.view.transform = CGAffineTransformMakeScale(0.2, 0.2);
            [UIView animateWithDuration:0.3 animations:^{
                vc.view.transform = CGAffineTransformIdentity;
            }];
        }else{
            // 跳转至登录界面
            LoginViewController * vc = [[LoginViewController alloc]initWithNibName:@"LoginViewController" bundle:nil];
            UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:vc];
            [self presentViewController:nav animated:YES completion:nil];
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
