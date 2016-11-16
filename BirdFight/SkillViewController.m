//
//  SkillViewController.m
//  BirdFight
//
//  Created by 聚米 on 16/10/15.
//  Copyright © 2016年 聚米. All rights reserved.
//

#import "SkillViewController.h"
#import "AutoFillScreenUtils.h"
#import "UIButton+MyFont.h"

#define VIEW_SIZE  self.view.bounds.size

@interface SkillViewController ()

@property (weak, nonatomic) IBOutlet UIView *view_TF;
@property (weak, nonatomic) IBOutlet UITextField *textField_skill;

@property (nonatomic, strong) NSMutableArray * mutableArray; // button数组

@end

@implementation SkillViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _mutableArray = [NSMutableArray array];
    [self loadMutableArray];
    
    // 设置导航栏
    self.title = @"擅长的技能";
    UIBarButtonItem * rightBtn = [[UIBarButtonItem alloc]initWithTitle:@"保存" style:UIBarButtonItemStyleDone target:self action:@selector(tapRightBtn)];
    self.navigationItem.rightBarButtonItem = rightBtn;
    
    // 设置属性
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.view_TF.backgroundColor = [UIColor whiteColor];
    self.view_TF.frame = CGRectMake(0, 70, VIEW_SIZE.width, 50);
    self.textField_skill.backgroundColor = [UIColor clearColor];
    self.textField_skill.borderStyle = UITextBorderStyleNone;
    self.textField_skill.frame = CGRectMake(10, 5, VIEW_SIZE.width-20, 40);
    
    // 遍历设置button
    for (int i = 0; i<_mutableArray.count; i++) {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.tag = i;
        
        int index = (int)button.tag;
        int cloumn = index%3;
        int row = index/3;
        
        CGFloat bw = 280/3.0;
        CGFloat x = 10 * (cloumn + 1) + bw * cloumn;
        CGFloat y = 140 + 40 * row;
        
        button.frame = CGRectMake(x, y, bw, 30);
        [button addTarget:self action:@selector(tapProfessionBtn:) forControlEvents:UIControlEventTouchUpInside];
        [button setTitle:self.mutableArray[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        button.titleLabel.font = [UIFont systemFontOfSize:13.0];
        [button myFont];
        button.backgroundColor = [UIColor whiteColor];
        button.layer.cornerRadius = 15;
        button.layer.masksToBounds = YES;
        button.selected = NO;
        [self.view addSubview:button];
    }
    // 等比例约束
    [AutoFillScreenUtils autoLayoutFillScreen:self.view];
}

#pragma mark 加载数组
-(void)loadMutableArray
{
    NSArray * arr = @[@"敲代码",@"钓鱼",@"泡美眉",@"打篮球",@"踢足球",@"摄影",@"游泳",@"烹饪美食",@"驾驶",@"瑜伽",@"英语",@"涂鸦",@"弹钢琴",@"舞蹈",@"唱歌",@"魔术"];
    _mutableArray = [NSMutableArray arrayWithArray:arr];
}

#pragma mark 点击保存按钮
-(void)tapRightBtn
{
    NSLog(@"点击了保存");
    // 返回
    [self.navigationController popViewControllerAnimated:YES];
    
    
    
    
    
    
    
}

#pragma mark 点击职业按钮
-(void)tapProfessionBtn:(UIButton *)sender
{
    if (sender.selected == NO) {
        sender.selected = YES;
        sender.backgroundColor = [UIColor colorWithRed:249/255.0 green:83/255.0 blue:100/255.0 alpha:1];
        // 添加
        NSString * str = sender.titleLabel.text;
        _textField_skill.text = [_textField_skill.text stringByAppendingString:[NSString stringWithFormat:@" %@;",str]];
        
    }else{
        sender.selected = NO;
        sender.backgroundColor = [UIColor whiteColor];
        // 删除
        _textField_skill.text = [_textField_skill.text stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@" %@;",sender.titleLabel.text] withString:@""];
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
