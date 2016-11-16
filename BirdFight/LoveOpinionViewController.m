//
//  LoveOpinionViewController.m
//  BirdFight
//
//  Created by 聚米 on 16/10/15.
//  Copyright © 2016年 聚米. All rights reserved.
//

#import "LoveOpinionViewController.h"
#import "AutoFillScreenUtils.h"
#import "UIButton+Bird.h"
#import "ZJTextView.h"

@interface LoveOpinionViewController ()

@property (weak, nonatomic) IBOutlet UIView *view_TV; // 输入背景
@property (nonatomic, strong) ZJTextView * textView_love; // 输入框
@property (weak, nonatomic) IBOutlet UILabel *label_1; // 提示
@property (weak, nonatomic) IBOutlet UILabel *label_2; // 提示
@property (weak, nonatomic) IBOutlet UIButton *button_1; // 按钮1
@property (weak, nonatomic) IBOutlet UIButton *button_2; // 按钮2
@property (weak, nonatomic) IBOutlet UIButton *button_3; // 按钮3
@property (weak, nonatomic) IBOutlet UIButton *button_4; // 按钮4



@end

@implementation LoveOpinionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // 设置主题
    self.title = @"对爱情的看法";
    UIBarButtonItem * rightBtn = [[UIBarButtonItem alloc]initWithTitle:@"保存" style:UIBarButtonItemStyleDone target:self action:@selector(tapRightBtn)];
    self.navigationItem.rightBarButtonItem = rightBtn;
    
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    // 设置控件
    _view_TV.frame = CGRectMake(0, 70, 320, 150);
    
    _textView_love = [[ZJTextView alloc]initWithFrame:CGRectMake(10, 10, 300, 105)];
    _textView_love.myPlaceholder = @"说点什么吧";
    _textView_love.myPlaceholderColor = [UIColor lightGrayColor];
    [self.view_TV addSubview:_textView_love];
    self.automaticallyAdjustsScrollViewInsets = NO;// 让文字在最顶端显示
    
    _label_1.frame = CGRectMake(230, 120, 80, 20);
    _label_2.frame = CGRectMake(60, 230, 200, 20);
    _button_1.frame = CGRectMake(15, 260, 290, 50);
    [_button_1 setBtnYesOrNo];
    _button_2.frame = CGRectMake(15, 320, 290, 50);
    [_button_2 setBtnYesOrNo];
    _button_3.frame = CGRectMake(15, 380, 290, 50);
    [_button_3 setBtnYesOrNo];
    _button_4.frame = CGRectMake(15, 440, 290, 50);
    [_button_4 setBtnYesOrNo];
    
    // 等比例约束
    [AutoFillScreenUtils autoLayoutFillScreen:self.view];
}

#pragma mark 点击保存按钮
-(void)tapRightBtn
{
    NSLog(@"点击了保存");
    // 返回
    [self.navigationController popViewControllerAnimated:YES];
    
    
    
    
    
    
}

#pragma mark 点击按钮

- (IBAction)tapButton_1:(UIButton *)sender
{
    if (sender.selected == NO) {
        sender.selected = YES;
        sender.backgroundColor = [UIColor colorWithRed:249/255.0 green:83/255.0 blue:100/255.0 alpha:1];
        // 添加
        _textView_love.text = sender.titleLabel.text;
        
        _button_2.selected = NO;
        _button_2.backgroundColor = [UIColor whiteColor];
        _button_3.selected = NO;
        _button_3.backgroundColor = [UIColor whiteColor];
        _button_4.selected = NO;
        _button_4.backgroundColor = [UIColor whiteColor];
        
    }else{
        sender.selected = NO;
        sender.backgroundColor = [UIColor whiteColor];
        // 删除
        _textView_love.text = [_textView_love.text stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@",sender.titleLabel.text] withString:@""];
    }

}

- (IBAction)tapButton_2:(UIButton *)sender
{
    if (sender.selected == NO) {
        sender.selected = YES;
        sender.backgroundColor = [UIColor colorWithRed:249/255.0 green:83/255.0 blue:100/255.0 alpha:1];
        // 添加
        _textView_love.text = sender.titleLabel.text;
        
        _button_1.selected = NO;
        _button_1.backgroundColor = [UIColor whiteColor];
        _button_3.selected = NO;
        _button_3.backgroundColor = [UIColor whiteColor];
        _button_4.selected = NO;
        _button_4.backgroundColor = [UIColor whiteColor];
        
    }else{
        sender.selected = NO;
        sender.backgroundColor = [UIColor whiteColor];
        // 删除
        _textView_love.text = [_textView_love.text stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@",sender.titleLabel.text] withString:@""];
    }
}

- (IBAction)tapButton_3:(UIButton *)sender
{
    if (sender.selected == NO) {
        sender.selected = YES;
        sender.backgroundColor = [UIColor colorWithRed:249/255.0 green:83/255.0 blue:100/255.0 alpha:1];
        // 添加
        _textView_love.text = sender.titleLabel.text;
        
        _button_2.selected = NO;
        _button_2.backgroundColor = [UIColor whiteColor];
        _button_1.selected = NO;
        _button_1.backgroundColor = [UIColor whiteColor];
        _button_4.selected = NO;
        _button_4.backgroundColor = [UIColor whiteColor];
        
    }else{
        sender.selected = NO;
        sender.backgroundColor = [UIColor whiteColor];
        // 删除
        _textView_love.text = [_textView_love.text stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@",sender.titleLabel.text] withString:@""];
    }
}

- (IBAction)tapButton_4:(UIButton *)sender
{
    if (sender.selected == NO) {
        sender.selected = YES;
        sender.backgroundColor = [UIColor colorWithRed:249/255.0 green:83/255.0 blue:100/255.0 alpha:1];
        // 添加
        _textView_love.text = sender.titleLabel.text;
        
        _button_2.selected = NO;
        _button_2.backgroundColor = [UIColor whiteColor];
        _button_3.selected = NO;
        _button_3.backgroundColor = [UIColor whiteColor];
        _button_1.selected = NO;
        _button_1.backgroundColor = [UIColor whiteColor];
        
    }else{
        sender.selected = NO;
        sender.backgroundColor = [UIColor whiteColor];
        // 删除
        _textView_love.text = [_textView_love.text stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@",sender.titleLabel.text] withString:@""];
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
