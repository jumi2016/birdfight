//
//  SexSelectionViewController.m
//  BirdFight
//
//  Created by 聚米 on 16/10/14.
//  Copyright © 2016年 聚米. All rights reserved.
//

#import "SexSelectionViewController.h"
#import "AutoFillScreenUtils.h"
#import "UIButton+Bird.h"
#import "BasicInfoTableViewController.h"

@interface SexSelectionViewController ()
/** 提示label */
@property (weak, nonatomic) IBOutlet UILabel *label_title;
/** boy按钮 */
@property (weak, nonatomic) IBOutlet UIButton *boyBtn;
/** girl按钮 */
@property (weak, nonatomic) IBOutlet UIButton *girlBtn;
/** boy状态 */
@property (weak, nonatomic) IBOutlet UIImageView *signImage_boy;
/** boy */
@property (weak, nonatomic) IBOutlet UILabel *label_boy;
/** girl状态 */
@property (weak, nonatomic) IBOutlet UIImageView *signImage_girl;
/** girl */
@property (weak, nonatomic) IBOutlet UILabel *label_girl;
/** 确定按钮 */
@property (weak, nonatomic) IBOutlet UIButton *doneBtn;
/** 警示 */
@property (weak, nonatomic) IBOutlet UILabel *label_warn;


@end

@implementation SexSelectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // 设置标题
    self.title = @"请选择身份";
    
    // 设置控件frame
    _label_title.frame = CGRectMake(60, 120, 200, 30);
    
    _boyBtn.frame = CGRectMake(50, 220, 80, 80);
    [_boyBtn setImage:[UIImage imageNamed:@"shenfenxuanze_nan"] forState:UIControlStateNormal];
    _boyBtn.tag = 1;
    _girlBtn.frame = CGRectMake(190, 220, 80, 80);
    [_girlBtn setImage:[UIImage imageNamed:@"shenfenxuanze_nv"] forState:UIControlStateNormal];
    _girlBtn.tag = 3;
    
    _signImage_boy.frame = CGRectMake(65, 310, 20, 20);
    _signImage_boy.image = [UIImage imageNamed:@"noSelect"];
    _label_boy.frame = CGRectMake(90, 307, 25, 25);
    
    _signImage_girl.frame = CGRectMake(205, 310, 20, 20);
    _signImage_girl.image = [UIImage imageNamed:@"noSelect"];
    _label_girl.frame = CGRectMake(230, 307, 25, 25);
    
    _doneBtn.frame = CGRectMake(60, 360, 200, 40);
    [_doneBtn diyStyle];
    
    _label_warn.frame = CGRectMake(60, 420, 200, 20);
    
    // 等比例约束适配
    [AutoFillScreenUtils autoLayoutFillScreen:self.view];
    
}

#pragma mark 点击boy按钮
- (IBAction)tapBoyBtn:(UIButton *)sender
{
    if (sender.tag == 1) {
        _signImage_boy.image = [UIImage imageNamed:@"select"];
        sender.tag++;
        _signImage_girl.image = [UIImage imageNamed:@"noSelect"];
        _girlBtn.tag = 3;
    }else{
        _signImage_boy.image = [UIImage imageNamed:@"noSelect"];
        sender.tag--;
    }
}

#pragma mark 点击girl按钮
- (IBAction)tapGirlBtn:(UIButton *)sender
{
    if (sender.tag == 3) {
        _signImage_girl.image = [UIImage imageNamed:@"select"];
        sender.tag++;
        _signImage_boy.image = [UIImage imageNamed:@"noSelect"];
        _boyBtn.tag = 1;
    }else{
        _signImage_girl.image = [UIImage imageNamed:@"noSelect"];
        sender.tag--;
    }
}

#pragma mark 点击确定按钮
- (IBAction)tapDoneBtn:(UIButton *)sender
{
    // 跳转界面  存储性别选择
    
    BasicInfoTableViewController * vc = [[BasicInfoTableViewController alloc]initWithNibName:@"BasicInfoTableViewController" bundle:nil];
    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:vc];
    [self presentViewController:nav animated:YES completion:nil];
    
    
    
    
    
    
    
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
