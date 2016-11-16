//
//  MeetNearByViewController.m
//  BirdFight
//
//  Created by 聚米 on 16/10/24.
//  Copyright © 2016年 聚米. All rights reserved.
//

#import "MeetNearByViewController.h"
#import "ZLSwipeableView.h"
#import "CardView.h"
#import "UserInfo.h"

#define MainScreenWidth [[UIScreen mainScreen]bounds].size.width
#define MainScreenHeight [[UIScreen mainScreen]bounds].size.height

@interface MeetNearByViewController ()<ZLSwipeableViewDelegate, ZLSwipeableViewDataSource>

@property (nonatomic) NSUInteger index;

@property (nonatomic, strong) NSArray * userInfo_arr;

@end

@implementation MeetNearByViewController


// 测试数据
-(void)loadArr
{
    UserInfo * info_1 = [[UserInfo alloc]init];
    info_1.uid = @"张小凡";
    info_1.headImage = [UIImage imageNamed:@"1.jpg"];
    info_1.name = @"张小凡";
    info_1.sex = @"男";
    info_1.age = @"25";
    info_1.stance = @"100m";
    info_1.sign = @"生活其实很美好，我希望茫茫人海中遇见你";
    
    UserInfo * info_2 = [[UserInfo alloc]init];
    info_2.uid = @"碧瑶";
    info_2.headImage = [UIImage imageNamed:@"2.jpg"];;
    info_2.name = @"碧瑶";
    info_2.sex = @"女";
    info_2.age = @"25";
    info_2.stance = @"1.5km";
    info_2.sign = @"约不约，张小凡！！！！！！！！！";
    
    UserInfo * info_3 = [[UserInfo alloc]init];
    info_3.uid = @"陆雪琪";
    info_3.headImage = [UIImage imageNamed:@"3.jpg"];;
    info_3.name = @"陆雪琪";
    info_3.sex = @"女";
    info_3.age = @"25";
    info_3.stance = @"1km";
    info_3.sign = @"生活其实很美好，我希望茫茫人海中遇见你";
    
    UserInfo * info_4 = [[UserInfo alloc]init];
    info_4.uid = @"林惊羽";
    info_4.headImage = [UIImage imageNamed:@"4.png"];;
    info_4.name = @"林惊羽";
    info_4.sex = @"男";
    info_4.age = @"25";
    info_4.stance = @"2.5km";
    info_4.sign = @"生活其实很美好，我希望茫茫人海中遇见你";
    
    UserInfo * info_5 = [[UserInfo alloc]init];
    info_5.uid = @"田灵儿";
    info_5.headImage = [UIImage imageNamed:@"5.jpg"];;
    info_5.name = @"田灵儿";
    info_5.sex = @"女";
    info_5.age = @"25";
    info_5.stance = @"100m";
    info_5.sign = @"啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦";
    
    UserInfo * info_6 = [[UserInfo alloc]init];
    info_6.uid = @"小环";
    info_6.headImage = [UIImage imageNamed:@"6.jpg"];;
    info_6.name = @"小环";
    info_6.sex = @"女";
    info_6.age = @"25";
    info_6.stance = @"100m";
    info_6.sign = @"生活其实很美好，我希望茫茫人海中遇见你";
    
    UserInfo * info_7 = [[UserInfo alloc]init];
    info_7.uid = @"鬼王";
    info_7.headImage = [UIImage imageNamed:@"7.jpg"];;
    info_7.name = @"鬼王";
    info_7.sex = @"男";
    info_7.age = @"25";
    info_7.stance = @"3000m";
    info_7.sign = @"哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈";
    
    self.userInfo_arr = @[info_1,info_2,info_3,info_4,info_5,info_6,info_7];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    // 加载测试数据
    [self loadArr];
    
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    self.index = 0;
    
    [self.view addSubview:self.swipeableView];
    ZLSwipeableView *swipeableView = _swipeableView;
    // Required Data Source
    self.swipeableView.dataSource = self;
    // Optional Delegate
    self.swipeableView.delegate = self;
    self.swipeableView.translatesAutoresizingMaskIntoConstraints = NO;
    
    // `1` `2` `3`
    UIButton *button_1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:button_1];
    button_1.translatesAutoresizingMaskIntoConstraints = NO;
    button_1.backgroundColor = [UIColor clearColor];
    [button_1 setImage:[UIImage imageNamed:@"Don't like"] forState:UIControlStateNormal];
    button_1.tag = 0;
    [button_1 addTarget:self action:@selector(handle:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *button_2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:button_2];
    button_2.translatesAutoresizingMaskIntoConstraints = NO;
    button_2.backgroundColor = [UIColor clearColor];
    [button_2 setImage:[UIImage imageNamed:@"peng hrart"] forState:UIControlStateNormal];
    button_2.tag = 1;
    [button_2 addTarget:self action:@selector(handle:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *button_3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:button_3];
    button_3.translatesAutoresizingMaskIntoConstraints = NO;
    button_3.backgroundColor = [UIColor clearColor];
    [button_3 setImage:[UIImage imageNamed:@"like"] forState:UIControlStateNormal];
    button_3.tag = 2;
    [button_3 addTarget:self action:@selector(handle:) forControlEvents:UIControlEventTouchUpInside];
    

    NSDictionary *metrics = NSDictionaryOfVariableBindings(_swipeableView,button_1,button_2,button_3);
    CGFloat h = (MainScreenWidth-180)/4;
    NSNumber * w = [NSNumber numberWithFloat:h];
    NSDictionary *dic = @{@"w":w};
    NSString * strH1 = @"H:|-15-[_swipeableView]-15-|";
    NSString * strH2= @"H:|-w-[button_1(==70)]-w-[button_2(==40)]-w-[button_3(==70)]-w-|";
    NSString * strV1 = @"V:|-20-[_swipeableView]-15-[button_1(==70)]-15-|";
    NSString * strV2 = @"V:|-20-[_swipeableView]-30-[button_2(==40)]-30-|";
    NSString * strV3 = @"V:|-20-[_swipeableView]-15-[button_3(==70)]-15-|";
    
    NSArray * c1 = [NSLayoutConstraint constraintsWithVisualFormat:strH1 options:0 metrics:dic views:metrics];
    [self.view addConstraints:c1];
    NSArray * c2 = [NSLayoutConstraint constraintsWithVisualFormat:strH2 options:0 metrics:dic views:metrics];
    [self.view addConstraints:c2];
    NSArray * c3 = [NSLayoutConstraint constraintsWithVisualFormat:strV1 options:0 metrics:dic views:metrics];
    [self.view addConstraints:c3];
    NSArray * c4 = [NSLayoutConstraint constraintsWithVisualFormat:strV2 options:0 metrics:nil views:metrics];
    [self.view addConstraints:c4];
    NSArray * c5 = [NSLayoutConstraint constraintsWithVisualFormat:strV3 options:0 metrics:dic views:metrics];
    [self.view addConstraints:c5];
    
}

// up down left right  点击按钮方法
- (void)handle:(UIButton *)sender
{
    HandleDirectionType type = sender.tag;
    switch (type) {
        case HandleDirectionLeft:
            [self.swipeableView swipeTopViewToLeft];
            break;
        case HandleFlowers:
            NSLog(@"点击了赠送花束按钮");
            
            
            
            break;
        case HandleDirectionRight:
            [self.swipeableView swipeTopViewToRight];
            break;
        default:
            break;
    }
}

- (ZLSwipeableView *)swipeableView
{
    if (_swipeableView == nil) {
        _swipeableView = [[ZLSwipeableView alloc] initWithFrame:CGRectZero];
    }
    return _swipeableView;
}
- (void)viewDidLayoutSubviews {
    [self.swipeableView loadViewsIfNeeded];
}

#pragma mark - ZLSwipeableViewDelegate 方法

- (void)swipeableView:(ZLSwipeableView *)swipeableView
         didSwipeView:(UIView *)view
          inDirection:(ZLSwipeableViewDirection)direction {
//    NSLog(@"did swipe in direction: %zd", direction);
    
    switch (direction) {
        case ZLSwipeableViewDirectionLeft:
        {
            NSLog(@"我不喜欢Ta");
            break;
        }
        case ZLSwipeableViewDirectionRight:
        {
            NSLog(@"我喜欢Ta");
            break;
        }
        default:
            break;
    }
    
    
}

- (void)swipeableView:(ZLSwipeableView *)swipeableView didCancelSwipe:(UIView *)view {
//    NSLog(@"did cancel swipe");
}

- (void)swipeableView:(ZLSwipeableView *)swipeableView
  didStartSwipingView:(UIView *)view
           atLocation:(CGPoint)location {
//    NSLog(@"did start swiping at location: x %f, y %f", location.x, location.y);
}

- (void)swipeableView:(ZLSwipeableView *)swipeableView
          swipingView:(UIView *)view
           atLocation:(CGPoint)location
          translation:(CGPoint)translation {
//    NSLog(@"swiping at location: x %f, y %f, translation: x %f, y %f", location.x, location.y,
//          translation.x, translation.y);
}

- (void)swipeableView:(ZLSwipeableView *)swipeableView
    didEndSwipingView:(UIView *)view
           atLocation:(CGPoint)location {
//    NSLog(@"did end swiping at location: x %f, y %f", location.x, location.y);
}

#pragma mark - ZLSwipeableViewDataSource 赋值

- (UIView *)nextViewForSwipeableView:(ZLSwipeableView *)swipeableView {
    
    if (self.index >= self.userInfo_arr.count) {
        self.index = 0;
    }
    
    CardView *view = [[CardView alloc] initWithFrame:swipeableView.bounds];
    // colors
    view.backgroundColor = [UIColor whiteColor];
    // info
    UserInfo * info = self.userInfo_arr[self.index];
    view.uid = info.uid;
    view.imageView.image = info.headImage;
    view.nameLabel.text = info.name;
    view.distanceLabel.text = info.stance;
    if ([info.sex isEqualToString:@"男"]) {
        view.sexImageView.image = [UIImage imageNamed:@"nan_people"];
    }else if([info.sex isEqualToString:@"女"]){
        view.sexImageView.image = [UIImage imageNamed:@"nv_people"];
    }

    view.ageLabel.text = info.age;
    view.signLabel.text = info.sign;
    // ++
    self.index++;
    
    // 添加手势
    UITapGestureRecognizer * singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapViewAction:)];
    [view addGestureRecognizer:singleTap];
    
    return view;
}

// 手势方法(进入主页)
-(void)tapViewAction:(UITapGestureRecognizer *)tap
{
    CardView * tapView = (CardView *)tap.view;
    NSString * str = tapView.uid;
    NSLog(@"点击了View,进入个人主页：%@",str);
    
    
    
    
    
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
