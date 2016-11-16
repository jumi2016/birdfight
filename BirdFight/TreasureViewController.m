//
//  TreasureViewController.m
//  BirdFight
//
//  Created by 聚米 on 16/10/15.
//  Copyright © 2016年 聚米. All rights reserved.
//

#import "TreasureViewController.h"

@interface TreasureViewController ()

@end

@implementation TreasureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // 设置navigation返回按钮0
    UIBarButtonItem * buttonItem = [[UIBarButtonItem alloc]init];
    buttonItem.title = @"返回";
    self.navigationItem.backBarButtonItem= buttonItem;
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
