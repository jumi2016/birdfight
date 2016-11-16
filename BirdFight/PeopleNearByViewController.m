//
//  PeopleNearByViewController.m
//  BirdFight
//
//  Created by 聚米 on 16/10/24.
//  Copyright © 2016年 聚米. All rights reserved.
//

#import "PeopleNearByViewController.h"
#import "ChooseTableViewController.h"
#import "PeoplaeNearbyView.h"
#import "UserInfo.h"
#import "AutoFillScreenUtils.h"
#import "BaseMethod.h"

@interface PeopleNearByViewController ()

@property (weak, nonatomic) IBOutlet UIView *myview_1;
@property (weak, nonatomic) IBOutlet UIView *myview_2;
@property (weak, nonatomic) IBOutlet UIView *myview_3;



@property (nonatomic, strong) PeoplaeNearbyView * view_1;
@property (nonatomic, strong) PeoplaeNearbyView * view_2;
@property (nonatomic, strong) PeoplaeNearbyView * view_3;
@property (nonatomic, strong) PeoplaeNearbyView * view_4;
@property (nonatomic, strong) PeoplaeNearbyView * view_5;
@property (nonatomic, strong) PeoplaeNearbyView * view_6;
@property (nonatomic, strong) PeoplaeNearbyView * view_7;
@property (nonatomic, strong) UIButton * chooseBtn;
@property (nonatomic, strong) UIButton * setTopBtn;
@property (nonatomic, strong) UserInfo * info;

@property (nonatomic, strong) NSArray * info_arr;

@end

@implementation PeopleNearByViewController

// 测试数据
-(void)loadInfoArr
{
//    NSString * imageStr = [BaseMethod UIImageToBase64Str:[UIImage imageNamed:@"4"]];
    
    UserInfo * info_1 = [[UserInfo alloc]init];
    info_1.headImage = [UIImage imageNamed:@"1.jpg"];
    info_1.name = @"张小凡";
    info_1.vip = @"超级会员";
    info_1.sex = @"男";
    info_1.age = @"25";
    info_1.stance = @"100m";
    
    UserInfo * info_2 = [[UserInfo alloc]init];
    info_2.headImage = [UIImage imageNamed:@"2.jpg"];;
    info_2.name = @"碧瑶";
    info_2.vip = @"年会员";
    info_2.sex = @"女";
    info_2.age = @"25";
    info_2.stance = @"100m";

    UserInfo * info_3 = [[UserInfo alloc]init];
    info_3.headImage = [UIImage imageNamed:@"3.jpg"];;
    info_3.name = @"陆雪琪";
    info_3.vip = @"年会员";
    info_3.sex = @"女";
    info_3.age = @"25";
    info_3.stance = @"100m";

    UserInfo * info_4 = [[UserInfo alloc]init];
    info_4.headImage = [UIImage imageNamed:@"4.png"];;
    info_4.name = @"林惊羽";
    info_4.vip = @"半年会员";
    info_4.sex = @"男";
    info_4.age = @"25";
    info_4.stance = @"100m";

    UserInfo * info_5 = [[UserInfo alloc]init];
    info_5.headImage = [UIImage imageNamed:@"5.jpg"];;
    info_5.name = @"田灵儿";
    info_5.vip = @"季会员";
    info_5.sex = @"女";
    info_5.age = @"25";
    info_5.stance = @"100m";

    UserInfo * info_6 = [[UserInfo alloc]init];
    info_6.headImage = [UIImage imageNamed:@"6.jpg"];;
    info_6.name = @"小环";
    info_6.vip = @"季会员";
    info_6.sex = @"女";
    info_6.age = @"25";
    info_6.stance = @"100m";

    UserInfo * info_7 = [[UserInfo alloc]init];
    info_7.headImage = [UIImage imageNamed:@"7.jpg"];;
    info_7.name = @"鬼王";
    info_7.vip = @"超级会员";
    info_7.sex = @"男";
    info_7.age = @"25";
    info_7.stance = @"100m";

    self.info_arr = @[info_1,info_2,info_3,info_4,info_5,info_6,info_7];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    [self loadInfoArr];
    
    // 设置附近人
    _view_1 = [[PeoplaeNearbyView alloc]initWithFrame:CGRectMake(110, 20, 100, 126) withPeopleInfo:_info_arr[0]];
    [self.view addSubview:_view_1];
    
    _view_2 = [[PeoplaeNearbyView alloc]initWithFrame:CGRectMake(10, 84, 100, 126) withPeopleInfo:_info_arr[1]];
    [self.view addSubview:_view_2];
    
    _view_3 = [[PeoplaeNearbyView alloc]initWithFrame:CGRectMake(210, 84, 100, 126) withPeopleInfo:_info_arr[2]];
    [self.view addSubview:_view_3];
    
    _view_4 = [[PeoplaeNearbyView alloc]initWithFrame:CGRectMake(110, 147, 100, 126) withPeopleInfo:_info_arr[3]];
    [self.view addSubview:_view_4];
    
    _view_5 = [[PeoplaeNearbyView alloc]initWithFrame:CGRectMake(10, 210, 100, 126) withPeopleInfo:_info_arr[4]];
    [self.view addSubview:_view_5];
    
    _view_6 = [[PeoplaeNearbyView alloc]initWithFrame:CGRectMake(210, 210, 100, 126) withPeopleInfo:_info_arr[5]];
    [self.view addSubview:_view_6];
    
    _view_7 = [[PeoplaeNearbyView alloc]initWithFrame:CGRectMake(110, 273, 100, 126) withPeopleInfo:_info_arr[6]];
    [self.view addSubview:_view_7];
    
    // 设置筛选按钮
    _chooseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _chooseBtn.frame = CGRectMake(250, 15, 70, 30);
    [_chooseBtn setBackgroundImage:[UIImage imageNamed:@"shaixuan"] forState:UIControlStateNormal];
    [_chooseBtn setTitle:@"筛选" forState:UIControlStateNormal];
    [_chooseBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_chooseBtn addTarget:self action:@selector(tapChooseButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_chooseBtn];
    
    // 设置小火箭
    _setTopBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _setTopBtn.frame = CGRectMake(145, 403, 30, 60);
    [_setTopBtn setImage:[UIImage imageNamed:@"xiaohuojian"] forState:UIControlStateNormal];
    [_setTopBtn addTarget:self action:@selector(tapRocketButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_setTopBtn];
    
    
    // 等比例约束
    [AutoFillScreenUtils autoLayoutFillScreen:self.view];
    
    _view_1.headImageBtn.layer.cornerRadius = _view_1.headImageBtn.bounds.size.width/2;
    _view_1.headImageBtn.layer.masksToBounds = YES;
    _view_2.headImageBtn.layer.cornerRadius = _view_2.headImageBtn.bounds.size.width/2;
    _view_2.headImageBtn.layer.masksToBounds = YES;
    _view_3.headImageBtn.layer.cornerRadius = _view_3.headImageBtn.bounds.size.width/2;
    _view_3.headImageBtn.layer.masksToBounds = YES;
    _view_4.headImageBtn.layer.cornerRadius = _view_4.headImageBtn.bounds.size.width/2;
    _view_4.headImageBtn.layer.masksToBounds = YES;
    _view_5.headImageBtn.layer.cornerRadius = _view_5.headImageBtn.bounds.size.width/2;
    _view_5.headImageBtn.layer.masksToBounds = YES;
    _view_6.headImageBtn.layer.cornerRadius = _view_6.headImageBtn.bounds.size.width/2;
    _view_6.headImageBtn.layer.masksToBounds = YES;
    _view_7.headImageBtn.layer.cornerRadius = _view_7.headImageBtn.bounds.size.width/2;
    _view_7.headImageBtn.layer.masksToBounds = YES;
    
    __weak __block PeopleNearByViewController * copy_self = self;
    _view_1.block = ^{
        if (copy_self.headBlock) {
            copy_self.headBlock(copy_self.info_arr[0]);
        }
    };
    _view_2.block = ^{
        if (copy_self.headBlock) {
            copy_self.headBlock(copy_self.info_arr[1]);
        }
    };
    _view_3.block = ^{
        if (copy_self.headBlock) {
            copy_self.headBlock(copy_self.info_arr[2]);
        }
    };
    _view_4.block = ^{
        if (copy_self.headBlock) {
            copy_self.headBlock(copy_self.info_arr[3]);
        }
    };
    _view_5.block = ^{
        if (copy_self.headBlock) {
            copy_self.headBlock(copy_self.info_arr[4]);
        }
    };
    _view_6.block = ^{
        if (copy_self.headBlock) {
            copy_self.headBlock(copy_self.info_arr[5]);
        }
    };
    _view_7.block = ^{
        if (copy_self.headBlock) {
            copy_self.headBlock(copy_self.info_arr[6]);
        }
    };

}

#pragma mark 点击筛选按钮
-(void)tapChooseButton
{
    if (self.block) {
        self.block();
    }
}

#pragma mark 点击小火箭按钮
-(void)tapRocketButton
{
    
    NSLog(@"点击了小火箭");
    
    
    
    
    
    
    
    
    
    
    
    
    
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
