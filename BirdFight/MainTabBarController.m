//
//  MainTabBarController.m
//  BirdFight
//
//  Created by 聚米 on 16/10/15.
//  Copyright © 2016年 聚米. All rights reserved.
//

#import "MainTabBarController.h"
#import "NearByViewController.h"
#import "LookForViewController.h"
#import "MessageViewController.h"
#import "TreasureViewController.h"
#import "MineViewController.h"

#define TabbarItemNums 5.0

@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NearByViewController * nearVc = [[NearByViewController alloc]initWithNibName:@"NearByViewController" bundle:nil];
    UINavigationController * nav1 = [[UINavigationController alloc]initWithRootViewController:nearVc];
    
    LookForViewController * lookVc = [[LookForViewController alloc]initWithNibName:@"LookForViewController" bundle:nil];
    UINavigationController * nav2 = [[UINavigationController alloc]initWithRootViewController:lookVc];
    
    MessageViewController * messageVc = [[MessageViewController alloc]initWithNibName:@"MessageViewController" bundle:nil];
    UINavigationController * nav3 = [[UINavigationController alloc]initWithRootViewController:messageVc];
    
    TreasureViewController * treaVc = [[TreasureViewController alloc]initWithNibName:@"TreasureViewController" bundle:nil];
    UINavigationController * nav4 = [[UINavigationController alloc]initWithRootViewController:treaVc];
    
    MineViewController * mineVc = [[MineViewController alloc]initWithNibName:@"MineViewController" bundle:nil];
    UINavigationController * nav5 = [[UINavigationController alloc]initWithRootViewController:mineVc];
    
    self.viewControllers = @[nav1,nav2,nav3,nav4,nav5];
    
    
    // 加载item
    [self loadTabBarItem];
    
    [self showBadgeOnItemIndex:2];
    
}

#pragma mark 加载主界面item
-(void)loadTabBarItem
{
    // 设置字体颜色
    //未选中时
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor lightGrayColor],NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    //选中时
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:249/255.0 green:83/255.0 blue:100/255.0 alpha:1],NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
    
    //设置主菜单item图片
    UITabBar * tabbar = self.tabBar;
    UITabBarItem * item0 = [tabbar.items objectAtIndex:0];
    UITabBarItem * item1 = [tabbar.items objectAtIndex:1];
    UITabBarItem * item2 = [tabbar.items objectAtIndex:2];
    UITabBarItem * item3 = [tabbar.items objectAtIndex:3];
    UITabBarItem * item4 = [tabbar.items objectAtIndex:4];
    
    item0.selectedImage = [[UIImage imageNamed:@"nearby_yes"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item0.image = [[UIImage imageNamed:@"nearby_no"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item0.title = @"附近";
    
    item1.selectedImage = [[UIImage imageNamed:@"lookfor_yes"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item1.image = [[UIImage imageNamed:@"lookfor_no"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item1.title = @"寻觅";
    
    item2.selectedImage = [[UIImage imageNamed:@"message_yes"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item2.image = [[UIImage imageNamed:@"message_no"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item2.title = @"消息";
    item2.badgeValue = @"";//tabbar角标
    
    item3.selectedImage = [[UIImage imageNamed:@"xun_happy_yes"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item3.image = [[UIImage imageNamed:@"xun_happy_no"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item3.title = @"寻开心";
    
    item4.selectedImage = [[UIImage imageNamed:@"mine_yes"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item4.image = [[UIImage imageNamed:@"mine_no"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item4.title = @"我";

}


#pragma mark 显示小红点
-(void)showBadgeOnItemIndex:(int)index
{
    //移除之前的小红点
    [self removeBadgeOnItemIndex:index];
    
    //新建小红点
    UIView *badgeView = [[UIView alloc]init];
    badgeView.tag = 888 + index;
    badgeView.layer.cornerRadius = 5;//圆形
    badgeView.backgroundColor = [UIColor redColor];//颜色：红色
    CGRect tabFrame = self.tabBarController.tabBar.frame;
    
//    NSLog(@"==========tabFrame = %@",NSStringFromCGRect(tabFrame));
    
    //确定小红点的位置
    float percentX = (index +0.6) / TabbarItemNums;
    CGFloat x = ceilf(percentX * tabFrame.size.width);
    CGFloat y = ceilf(0.1 * tabFrame.size.height);
    badgeView.frame = CGRectMake(x, y, 10, 10);//圆形大小为10
    [self.tabBarController.tabBar addSubview:badgeView];
    
    NSLog(@"/////////////////badgeView.frame = %@",NSStringFromCGRect(badgeView.frame));
}

#pragma mark 隐藏小红点
- (void)hideBadgeOnItemIndex:(int)index{
    //移除小红点
    [self removeBadgeOnItemIndex:index];
}

#pragma mark 移除小红点
- (void)removeBadgeOnItemIndex:(int)index{
    //按照tag值进行移除
    for (UIView *subView in self.tabBarController.tabBar.subviews) {
        if (subView.tag == 888+index) {
            [subView removeFromSuperview];
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
