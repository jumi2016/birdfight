//
//  NearByViewController.m
//  BirdFight
//
//  Created by 聚米 on 16/10/24.
//  Copyright © 2016年 聚米. All rights reserved.
//

#import "NearByViewController.h"

#import "ChooseTableViewController.h"
#import "PeopleNearByViewController.h"
#import "ActionTableViewController.h"
#import "MeetNearByViewController.h"
#import "LocationTableViewController.h"
#import "DescActionViewController.h"
#import "MeetMineViewController.h"

#import "UserInfo.h"
#import "AutoFillScreenUtils.h"

#define MainScreenWidth [[UIScreen mainScreen]bounds].size.width
#define MainScreenHeight [[UIScreen mainScreen]bounds].size.height

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define titleWidth 60
#define titleHeight 60
#define navigationBarHeight  self.navigationController.navigationBar.bounds.size.height
#define backColor [UIColor colorWithWhite:0.300 alpha:1.000]

@interface NearByViewController ()<UIScrollViewDelegate> {
    
    UIButton *selectButton;
    UIView *_sliderView;
    UIViewController *_viewController;
    UIScrollView *_scrollView;
}
/** 导航栏按钮数组 */
@property (nonatomic, strong) NSMutableArray *buttonArray;
/** 人 */
@property (nonatomic, strong) PeopleNearByViewController * oneVC;
/** 动态 */
@property (nonatomic, strong) ActionTableViewController * twoVC;
/** 碰碰 */
@property (nonatomic, strong) MeetNearByViewController * threeVC;
/** 引导 */
@property (nonatomic, strong) UIView * view_1;
/** 引导 */
@property (nonatomic, strong) UIView * view_2;
/** 引导 */
@property (nonatomic, strong) UIView * view_3;
/** 计时器 */
@property (nonatomic, strong) NSTimer * timer;
/** 计数 */
@property (nonatomic, assign) int count;
/** 碰碰我按钮 */
@property (nonatomic, strong) UIButton * mine_button;

@end

@implementation NearByViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.hidden = YES;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _buttonArray = [NSMutableArray array];
    
    _count = 3;
    
    // 设置导航栏隐藏
    self.navigationController.navigationBar.hidden = YES;
    // 设置navigation返回按钮
    UIBarButtonItem * buttonItem = [[UIBarButtonItem alloc]init];
    buttonItem.title = @"返回";
    self.navigationItem.backBarButtonItem= buttonItem;
    
    // 计时器初始化
    if (!_timer) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(countDown) userInfo:nil repeats:YES];
    }
    
    // 设置顶部菜单
    self.titleArray = @[@"人",@"动态",@"碰碰"];
    
    _oneVC = [[PeopleNearByViewController alloc] init];
    _twoVC = [[ActionTableViewController alloc] init];
    _threeVC = [[MeetNearByViewController alloc] init];
    
    
    self.controllerArray = @[_oneVC,_twoVC,_threeVC];
    
    // 点击筛选
    __weak __block NearByViewController * copy_self = self;
    _oneVC.block = ^{
        
        ChooseTableViewController * vc = [[ChooseTableViewController alloc]initWithNibName:@"ChooseTableViewController" bundle:nil];
        copy_self.hidesBottomBarWhenPushed=YES; // 隐藏tabbar
        [copy_self.navigationController pushViewController:vc animated:YES];
        copy_self.hidesBottomBarWhenPushed=NO; // 显示tabbar
    };
    // 点击头像
    _oneVC.headBlock = ^(UserInfo * info){
        
        NSMutableDictionary * dic = [NSMutableDictionary dictionary];
        [dic setValue:info.headImage forKey:@"headimage"];
        [dic setValue:info.name forKey:@"name"];
        [dic setValue:info.vip forKey:@"vip"];
        [dic setValue:info.sex forKey:@"sex"];
        [dic setValue:info.age forKey:@"age"];
        [dic setValue:info.stance forKey:@"stance"];
        NSLog(@"附近人信息：%@",dic);
        
        
        
        
        
        
        
        
        
        
        
        
    };
    
    // 点击动态cell
    _twoVC.text_block = ^(TextActionModel * action){
        
        DescActionViewController * vc = [[DescActionViewController alloc]initWithNibName:@"DescActionViewController" bundle:nil];
        vc.text_model = action;
        copy_self.hidesBottomBarWhenPushed=YES; // 隐藏tabbar
        [copy_self.navigationController pushViewController:vc animated:YES];
        copy_self.hidesBottomBarWhenPushed=NO; // 显示tabbar
    };
    _twoVC.image_block = ^(ImageActionModel * action){
        
        DescActionViewController * vc = [[DescActionViewController alloc]initWithNibName:@"DescActionViewController" bundle:nil];
        vc.image_model = action;
        copy_self.hidesBottomBarWhenPushed=YES; // 隐藏tabbar
        [copy_self.navigationController pushViewController:vc animated:YES];
        copy_self.hidesBottomBarWhenPushed=NO; // 显示tabbar
    };
    _twoVC.video_block = ^(VideoActionModel * action){
        
        DescActionViewController * vc = [[DescActionViewController alloc]initWithNibName:@"DescActionViewController" bundle:nil];
        vc.video_model = action;
        copy_self.hidesBottomBarWhenPushed=YES; // 隐藏tabbar
        [copy_self.navigationController pushViewController:vc animated:YES];
        copy_self.hidesBottomBarWhenPushed=NO; // 显示tabbar
    };
}

#pragma mark 计时器方法
-(void)countDown
{
    _count--;
    if (_count == 0) {
        [self.timer invalidate];
        self.timer = nil;
        [_view_1 removeFromSuperview];
        [_view_2 removeFromSuperview];
        [_view_3 removeFromSuperview];
    }
}

#pragma mark 设置title数组
- (void)setTitleArray:(NSArray *)titleArray {
    _titleArray = titleArray;
    [self initWithTitleButton];
}

#pragma mark 设置controller数组
- (void)setControllerArray:(NSArray *)controllerArray {
    _controllerArray = controllerArray;
    [self initWithController];
}

#pragma mark 初始化title
- (void)initWithTitleButton
{
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, titleHeight)];
    titleView.backgroundColor = [UIColor colorWithRed:249/255.0 green:83/255.0 blue:100/255.0 alpha:1];
    [self.view addSubview:titleView];
    
    titleView.frame = CGRectMake(0, 0, SCREEN_WIDTH, titleHeight);
    
    // 定位按钮
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(10, 30, 40, 20);
    [button setTitle:@"淄博" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:15];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(tapDingWeiButton) forControlEvents:UIControlEventTouchUpInside];
    [titleView addSubview:button];
    
    // 小标题
    for (int i = 0; i < _titleArray.count; i++) {
        
        UIButton *titleButton = [UIButton buttonWithType:UIButtonTypeCustom];
        titleButton.frame = CGRectMake((SCREEN_WIDTH/2-90)+titleWidth*i, 20, titleWidth, 40);
        [titleButton setTitle:_titleArray[i] forState:UIControlStateNormal];
        [titleButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        titleButton.titleLabel.font = [UIFont systemFontOfSize:16];
        titleButton.tag = 100+i;
        [titleButton addTarget:self action:@selector(scrollViewSelectToIndex:) forControlEvents:UIControlEventTouchUpInside];
        [titleView addSubview:titleButton];
        if (i == 0) {
            selectButton = titleButton;
            [selectButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }
        [_buttonArray addObject:titleButton];
    }
    
    //滑块
    UIView *sliderV=[[UIView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-90, titleHeight-2, titleWidth, 2)];
    sliderV.backgroundColor = [UIColor whiteColor];
    [titleView addSubview:sliderV];
    _sliderView=sliderV;
    
    // 左边进入碰碰界面后显示的按钮
    _mine_button = [UIButton buttonWithType:UIButtonTypeCustom];
    _mine_button.frame = CGRectMake(titleView.frame.size.width-40, 30, 30, 20);
    [_mine_button setTitle:@"我" forState:UIControlStateNormal];
    _mine_button.titleLabel.font = [UIFont systemFontOfSize:15];
    [_mine_button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_mine_button addTarget:self action:@selector(tapMineButton) forControlEvents:UIControlEventTouchUpInside];
    _mine_button.hidden = YES;
    [titleView addSubview:_mine_button];
}

#pragma mark 点击定位按钮
-(void)tapDingWeiButton
{
    LocationTableViewController * vc = [[LocationTableViewController alloc]initWithNibName:@"LocationTableViewController" bundle:nil];
    self.hidesBottomBarWhenPushed=YES; // 隐藏tabbar
    [self.navigationController pushViewController:vc animated:YES];
    self.hidesBottomBarWhenPushed=NO; // 显示tabbar
    
}

#pragma mark 点击碰碰我的按钮
-(void)tapMineButton
{
    MeetMineViewController * vc = [[MeetMineViewController alloc]initWithNibName:@"MeetMineViewController" bundle:nil];
    self.hidesBottomBarWhenPushed=YES; // 隐藏tabbar
    [self.navigationController pushViewController:vc animated:YES];
    self.hidesBottomBarWhenPushed=NO; // 显示tabbar
}

#pragma mark ScrollVIew
- (void)scrollViewSelectToIndex:(UIButton *)button
{
    
    [self selectButton:button.tag-100];
    [UIView animateWithDuration:0 animations:^{
        _scrollView.contentOffset = CGPointMake(SCREEN_WIDTH*(button.tag-100), 0);
    }];
    
    if (button.tag-100 == self.titleArray.count-1) {
        _mine_button.hidden = NO;
    }else{
        _mine_button.hidden = YES;
    }
}

#pragma mark 选择某个标题
- (void)selectButton:(NSInteger)index
{
    [selectButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    selectButton = _buttonArray[index];
    [selectButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [UIView animateWithDuration:0.3 animations:^{
        _sliderView.frame = CGRectMake((SCREEN_WIDTH/2-90)+titleWidth*index, titleHeight-2, titleWidth, 2);
    }];
}

#pragma mark 监听滚动事件判断当前拖动到哪一个了
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    NSInteger index = scrollView.contentOffset.x / SCREEN_WIDTH;
    [self selectButton:index];
    if (index == self.titleArray.count-1) {
        _mine_button.hidden = NO;
    }else{
        _mine_button.hidden = YES;
    }
    
}

#pragma mark 初始化view
- (void)initWithController
{
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    
    scrollView.frame = CGRectMake(0, titleHeight, SCREEN_WIDTH, SCREEN_HEIGHT-titleHeight-self.tabBarController.tabBar.bounds.size.height);
    
    scrollView.delegate = self;
    scrollView.backgroundColor = [UIColor colorWithWhite:0.900 alpha:1.000];
    scrollView.pagingEnabled = YES;
    scrollView.scrollEnabled = YES;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.bounces = NO;
    scrollView.contentSize = CGSizeMake(SCREEN_WIDTH*_controllerArray.count, 0);
    [self.view addSubview:scrollView];
    _scrollView = scrollView;
    
    for (int i = 0; i < _controllerArray.count; i++) {
        UIView *viewcon = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH*i, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        UIViewController *viewcontroller = _controllerArray[i];
        viewcon = viewcontroller.view;
        viewcon.frame = CGRectMake(SCREEN_WIDTH*i, 0, SCREEN_WIDTH, scrollView.bounds.size.height);
        
        [scrollView addSubview:viewcon];
    }
    
    
    //  设置操作引导
    BOOL flag = [[NSUserDefaults standardUserDefaults] objectForKey:@"isFirstLogin"];
    if (!flag) {

        [[NSUserDefaults standardUserDefaults] setValue:@YES forKey:@"isFirstLogin"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        NSLog(@"是否第一次登录：%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"isFirstLogin"]);
    
        _view_1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, titleHeight)];
        _view_1.backgroundColor = [UIColor blackColor];
        _view_1.alpha = 0.6;
        [[UIApplication sharedApplication].keyWindow addSubview:_view_1];
    
        _view_2 = [[UIView alloc]initWithFrame:CGRectMake(0, titleHeight+scrollView.bounds.size.height,SCREEN_WIDTH, SCREEN_HEIGHT-titleHeight-scrollView.bounds.size.height)];
        _view_2.backgroundColor = [UIColor blackColor];
        _view_2.alpha = 0.6;
        [[UIApplication sharedApplication].keyWindow addSubview:_view_2];
    
        _view_3 = [[UIView alloc]initWithFrame:CGRectMake(0, titleHeight, SCREEN_WIDTH, SCREEN_HEIGHT-titleHeight-self.tabBarController.tabBar.bounds.size.height)];
        [[UIApplication sharedApplication].keyWindow addSubview:_view_3];
        
        //中间镂空的矩形框
        
        CGFloat head_x = 110;
        CGFloat head_y = 147;
        CGFloat head_w = 100;
        CGFloat head_h = 100;
        
        CGFloat choose_x = 250;
        CGFloat choose_y = 13;
        CGFloat choose_w = 70;
        CGFloat choose_h = 34;
        
        CGFloat rocket_x = 127;
        CGFloat rocket_y = 400;
        CGFloat rocket_w = 66;
        CGFloat rocket_h = 66;
        CGFloat autoSizeScaleX;
        CGFloat autoSizeScaleY;
        
        if (MainScreenHeight > 480) {
            autoSizeScaleX = MainScreenWidth/320;
            autoSizeScaleY = MainScreenHeight/568;
        }else{
            autoSizeScaleX = 1.0;
            autoSizeScaleY = 1.0;
        }
        head_x = head_x * autoSizeScaleX;
        head_y = head_y * autoSizeScaleY;
        head_w = head_w * autoSizeScaleX;
        head_h = head_h * autoSizeScaleX;
        choose_x = choose_x * autoSizeScaleX;
        choose_y = choose_y * autoSizeScaleY;
        choose_w = choose_w * autoSizeScaleX;
        choose_h = choose_h * autoSizeScaleX;
        rocket_x = rocket_x * autoSizeScaleX;
        rocket_y = rocket_y * autoSizeScaleY;
        rocket_w = rocket_w * autoSizeScaleX;
        rocket_h = rocket_h * autoSizeScaleX;
        
        CGRect myRect_1 = CGRectMake(head_x, head_y, head_w, head_h);
        CGRect myRect_2 = CGRectMake(choose_x, choose_y, choose_w, choose_h);
        CGRect myRect_3 = CGRectMake(rocket_x, rocket_y, rocket_w, rocket_h);
        //背景
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:_view_3.bounds cornerRadius:0];
        //镂空
        UIBezierPath * circlePath = [UIBezierPath bezierPathWithOvalInRect:myRect_1];
        [path appendPath:circlePath];
        UIBezierPath * choosePath = [UIBezierPath bezierPathWithRect:myRect_2];
        [path appendPath:choosePath];
        UIBezierPath * rockerPath = [UIBezierPath bezierPathWithOvalInRect:myRect_3];
        [path appendPath:rockerPath];
        
        [path setUsesEvenOddFillRule:YES];
        
        
        CAShapeLayer *fillLayer = [CAShapeLayer layer];
        fillLayer.path = path.CGPath;
        fillLayer.fillRule = kCAFillRuleEvenOdd;//中间镂空的关键点 填充规则
        fillLayer.fillColor = [UIColor blackColor].CGColor;
        fillLayer.opacity = 0.6;
        [_view_3.layer addSublayer:fillLayer];

        // 设置按钮
        UIButton * skip_button = [UIButton buttonWithType:UIButtonTypeCustom];
        skip_button.frame = CGRectMake(260, 0, 50, 30);
        [skip_button setImage:[UIImage imageNamed:@"跳过"] forState:UIControlStateNormal];
        [skip_button addTarget:self action:@selector(tapSkip_Button) forControlEvents:UIControlEventTouchUpInside];
        [_view_2 addSubview:skip_button];
        
        // 设置头像引导
        UIImageView * imageV_1 = [[UIImageView alloc]initWithFrame:CGRectMake(80, 250, 160, 60)];
        imageV_1.image = [UIImage imageNamed:@"引导点击头像"];
        [_view_3 addSubview:imageV_1];
        // 设置筛选引导
        UIImageView * imageV_2 = [[UIImageView alloc]initWithFrame:CGRectMake(100, 30, 150, 100)];
        imageV_2.image = [UIImage imageNamed:@"引导点击筛选"];
        [_view_3 addSubview:imageV_2];
        // 设置小火箭引导
        UIImageView * imageV_3 = [[UIImageView alloc]initWithFrame:CGRectMake(45, 423, 80, 15)];
        imageV_3.image = [UIImage imageNamed:@"引导点击火箭"];
        [_view_3 addSubview:imageV_3];
        
        // 等比例约束
        [AutoFillScreenUtils autoLayoutFillScreen:_view_3];
        [AutoFillScreenUtils autoLayoutFillScreen:_view_2];
    }

}

#pragma mark 点击跳过按钮
-(void)tapSkip_Button
{
    [_view_1 removeFromSuperview];
    [_view_2 removeFromSuperview];
    [_view_3 removeFromSuperview];
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
