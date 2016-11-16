//
//  GuideViewController.m
//  BirdFight
//
//  Created by 聚米 on 16/10/11.
//  Copyright © 2016年 聚米. All rights reserved.
//

#import "GuideViewController.h"
#import "LoginViewController.h"
#import "MainTabBarController.h"
#import "UIButton+Bird.h"

#define VIEW_SIZE self.view.bounds.size

@interface GuideViewController ()<UIScrollViewDelegate>

/** 滚动视图:展示软件信息 */
@property(nonatomic,strong) UIScrollView *scrollView;

/** 图片视图:展示软件信息 */
@property(nonatomic,strong) UIImageView *imageView;

/** Enter按钮 */
@property(nonatomic,strong) UIButton *enterButton;

/** 图片数组 */
@property(nonatomic,strong) NSArray *images;

@end

@implementation GuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 加载数据
    [self loadData];
    // 加载控件
    [self loadModule];
}

#pragma mark 加载数据
-(void)loadData
{
    //数据准备
    UIImage * image1 = [UIImage imageNamed:@"guide1"];
    UIImage * image2 = [UIImage imageNamed:@"guide2"];
    UIImage * image3 = [UIImage imageNamed:@"guide3"];
    self.images = @[image1,image2,image3];
}

#pragma mark 加载控件
-(void)loadModule
{
    // 初始化ScrollVIew
    self.scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:self.scrollView];
}

#pragma mark 重载约束
-(void)viewDidLayoutSubviews
{
    self.scrollView.frame = self.view.bounds;
    
    // 设置属性
    self.scrollView.contentSize = CGSizeMake(VIEW_SIZE.width * self.images.count, VIEW_SIZE.height);
    self.scrollView.pagingEnabled = YES;
    self.scrollView.scrollEnabled = YES;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.bounces = NO;
    self.scrollView.delegate = self;

    // 展示图片
    NSInteger count = self.images.count;
    for (int i = 0; i < count; i++) {
        // 初始化ImageVIew
        self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(VIEW_SIZE.width*i, 0, VIEW_SIZE.width, VIEW_SIZE.height)];
        _imageView.image = self.images[i];
        [self.scrollView addSubview:_imageView];
    }
    
    // 进入按钮
    self.enterButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.enterButton.frame = CGRectMake(VIEW_SIZE.width*count-120, VIEW_SIZE.height-130, 100, 100);
    self.enterButton.layer.cornerRadius = self.enterButton.bounds.size.width/2;
    self.enterButton.layer.masksToBounds = YES;
    [self.enterButton setImage:[UIImage imageNamed:@"go"] forState:UIControlStateNormal];
    [self.enterButton addTarget:self action:@selector(tapEnterButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:self.enterButton];
}

#pragma mark UIScrollVIew 代理
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
}

#pragma mark 点击进入按钮
- (void)tapEnterButton:(UIButton *)button
{
    // 存取flag
    NSUserDefaults * userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault setObject:@YES forKey:@"Guide"];
    // 数据同步
    [userDefault synchronize];
    
    // 判断用户是否登录
    NSString * uid = [userDefault objectForKey:@"uid"];
    
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
        // 跳转登录界面
        LoginViewController * vc = [[LoginViewController alloc]initWithNibName:@"LoginViewController" bundle:nil];
        UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:vc];
        [self presentViewController:nav animated:YES completion:nil];
    }
}

#pragma mark 隐藏状态栏
- (BOOL)prefersStatusBarHidden
{
    return YES;
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
