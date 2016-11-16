//
//  MeetMineViewController.m
//  BirdFight
//
//  Created by 聚米 on 16/11/10.
//  Copyright © 2016年 聚米. All rights reserved.
//

#import "MeetMineViewController.h"
#import "UIButton+Bird.h"
#import "MBProgressHUD+Bird.h"
#import "UIView+ShowView.h"
#import "AutoFillScreenUtils.h"

#import "UserInfo.h"

#import "MineCardView.h"
#import "SelectImageView.h"

#import "MinePipeiTableViewController.h"


#define MainScreenWidth [[UIScreen mainScreen]bounds].size.width
#define MainScreenHeight [[UIScreen mainScreen]bounds].size.height

@interface MeetMineViewController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate>
// 数据
@property (nonatomic, strong) UserInfo * info;
// 视图
@property (nonatomic, strong) UIView * backView;
@property (nonatomic, strong) MineCardView * cardView;
@property (nonatomic, strong) SelectImageView * selectView;
// pickerView
@property(nonatomic,strong) UIImagePickerController *picker;

@end

@implementation MeetMineViewController

#pragma mark 视图出现
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    // 导航栏
    self.navigationController.navigationBar.hidden = NO;
    self.title = @"我";
    UIBarButtonItem *myButton = [[UIBarButtonItem alloc] initWithTitle:@"我的匹配" style:UIBarButtonItemStyleDone target:self action:@selector(tapRightButton)];
    self.navigationItem.rightBarButtonItem = myButton;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    // 测试数据
    _info = [[UserInfo alloc]init];
    _info.uid = @"张小凡";
    _info.headImage = [UIImage imageNamed:@"1.jpg"];
    _info.name = @"张小凡";
    _info.sex = @"男";
    _info.age = @"25";
    _info.location = @"火星山顶洞";
    _info.like_count = @"2345 赞";
    _info.sign = @"生活其实很美好，我希望茫茫人海中遇见你";
    
    // 初始化Picker
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        self.picker = [[UIImagePickerController alloc] init];
        self.picker.allowsEditing = YES;
        self.picker.delegate = self;
    });
    // 背景颜色
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    // 约束图
    self.backView = [[UIView alloc]init];
    _backView.backgroundColor = [UIColor clearColor];
    _backView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:_backView];
    
    // 匹配设置
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button diyStyle];
    button.translatesAutoresizingMaskIntoConstraints = NO;
    [button setTitle:@"匹配设置" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(tapSetButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    NSDictionary *metrics = NSDictionaryOfVariableBindings(_backView,button);
    
    CGFloat h = self.navigationController.navigationBar.frame.size.height + 10;
    NSNumber * w = [NSNumber numberWithFloat:h];
    NSDictionary *dic = @{@"w":w};
    
    NSString * strH1 = @"H:|-15-[_backView]-15-|";
    NSString * strH2= @"H:|-15-[button]-15-|";
    NSString * strV = @"V:|-70-[_backView]-30-[button(==45)]-50-|";
    
    
    NSArray * c1 = [NSLayoutConstraint constraintsWithVisualFormat:strH1 options:0 metrics:dic views:metrics];
    [self.view addConstraints:c1];
    NSArray * c2 = [NSLayoutConstraint constraintsWithVisualFormat:strH2 options:0 metrics:dic views:metrics];
    [self.view addConstraints:c2];
    NSArray * c3 = [NSLayoutConstraint constraintsWithVisualFormat:strV options:0 metrics:dic views:metrics];
    [self.view addConstraints:c3];
    
    
    
}

-(void)viewDidLayoutSubviews
{
    _cardView = [[MineCardView alloc]initWithFrame:_backView.bounds withUserInfo:_info];
    [_backView addSubview:_cardView];
    __weak __block MeetMineViewController * copy_self = self;
    _cardView.block = ^{
        [copy_self tapSelectImage];
    };
    
    _selectView.frame = self.view.frame;
}

#pragma mark 点击右按钮
-(void)tapRightButton
{
    NSLog(@"点击了右侧安钮");
    
    MinePipeiTableViewController * vc = [[MinePipeiTableViewController alloc] initWithNibName:@"MinePipeiTableViewController" bundle:nil];
    self.hidesBottomBarWhenPushed=YES; // 隐藏tabbar
    [self.navigationController pushViewController:vc animated:YES];
    
}

#pragma mark 点击匹配设置按钮
-(void)tapSetButton
{
    NSLog(@"点击了匹配设置按钮");
    
    
}

#pragma mark 选择图片
- (void)tapSelectImage
{
    // 初始化alert
    _selectView = [[SelectImageView alloc]initWithFrame:self.view.bounds];
    [_selectView show];
    [AutoFillScreenUtils autoLayoutFillScreen:_selectView];
    __weak __block MeetMineViewController * weakSelf = self;
    _selectView.block = ^(NSInteger tag){
        switch (tag) {
            case 0:
            {
                // 相机不可用提示
                if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
                    [MBProgressHUD showError:@"相机不可用"];
                    return ;
                }
                // 相机可用
                weakSelf.picker.sourceType = UIImagePickerControllerSourceTypeCamera;
                [weakSelf presentViewController:weakSelf.picker animated:YES completion:nil];
                break;
            }
            case 1:
            {
                // 展示图库
                weakSelf.picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                [weakSelf presentViewController:weakSelf.picker animated:YES completion:nil];
                break;
            }
            default:
                break;
        }
    };
}

#pragma mark UIIMagePIcker代理
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    // 取出图片
    UIImage *image = info[UIImagePickerControllerEditedImage];
    if (image) {
        [self.cardView.imageView setImage:image forState:UIControlStateNormal];
    }
    
    // 退回
    [self dismissViewControllerAnimated:YES completion:nil];
    
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
