//
//  SexOpinionViewController.m
//  BirdFight
//
//  Created by 聚米 on 16/10/15.
//  Copyright © 2016年 聚米. All rights reserved.
//

#import "SexOpinionViewController.h"
#import "AutoFillScreenUtils.h"
#import "UIButton+Bird.h"
#import "ZJTextView.h"

@interface SexOpinionViewController ()

@property (weak, nonatomic) IBOutlet UIView *view_TV;
@property (nonatomic, strong) ZJTextView * textView_sex;
@property (weak, nonatomic) IBOutlet UILabel *label_1;
@property (weak, nonatomic) IBOutlet UILabel *label_2;
@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UIButton *button3;
@property (weak, nonatomic) IBOutlet UIButton *button4;
@property (weak, nonatomic) IBOutlet UIButton *button5;
@property (weak, nonatomic) IBOutlet UIButton *button6;

@end

@implementation SexOpinionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // 设置导航栏
    self.title = @"对性的看法";
    UIBarButtonItem * rightBtn = [[UIBarButtonItem alloc]initWithTitle:@"保存" style:UIBarButtonItemStyleDone target:self action:@selector(tapRightBtn)];
    self.navigationItem.rightBarButtonItem = rightBtn;
    
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    // 设置控件
    _view_TV.frame = CGRectMake(0, 70, 320, 150);
    
    _textView_sex = [[ZJTextView alloc]initWithFrame:CGRectMake(10, 10, 300, 105)];
    _textView_sex.myPlaceholder = @"说点什么吧";
    _textView_sex.myPlaceholderColor = [UIColor lightGrayColor];
    [self.view_TV addSubview:_textView_sex];
    self.automaticallyAdjustsScrollViewInsets = NO;// 让文字在最顶端显示
    
    _label_1.frame = CGRectMake(230, 120, 80, 20);
    _label_2.frame = CGRectMake(60, 230, 200, 20);
    _button1.frame = CGRectMake(45, 265, 100, 40);
    [_button1 setBtnYesOrNo];
    _button2.frame = CGRectMake(175, 265, 100, 40);
    [_button2 setBtnYesOrNo];
    _button3.frame = CGRectMake(45, 320, 100, 40);
    [_button3 setBtnYesOrNo];
    _button4.frame = CGRectMake(175, 320, 100, 40);
    [_button4 setBtnYesOrNo];
    _button5.frame = CGRectMake(45, 375, 190, 40);
    [_button5 setBtnYesOrNo];
    _button6.frame = CGRectMake(45, 430, 100, 40);
    [_button6 setBtnYesOrNo];
    
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
- (IBAction)tapButton:(UIButton *)sender
{
    if (sender.tag == 1) {
        if (sender.selected == NO) {
            sender.selected = YES;
            sender.backgroundColor = [UIColor colorWithRed:249/255.0 green:83/255.0 blue:100/255.0 alpha:1];
            // 添加
            _textView_sex.text = sender.titleLabel.text;
            
            _button2.selected = NO;
            _button2.backgroundColor = [UIColor whiteColor];
            _button3.selected = NO;
            _button3.backgroundColor = [UIColor whiteColor];
            _button4.selected = NO;
            _button4.backgroundColor = [UIColor whiteColor];
            _button5.selected = NO;
            _button5.backgroundColor = [UIColor whiteColor];
            _button6.selected = NO;
            _button6.backgroundColor = [UIColor whiteColor];
            
        }else{
            sender.selected = NO;
            sender.backgroundColor = [UIColor whiteColor];
            // 删除
            _textView_sex.text = [_textView_sex.text stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@",sender.titleLabel.text] withString:@""];
        }
        
    }else if (sender.tag == 2){
        if (sender.selected == NO) {
            sender.selected = YES;
            sender.backgroundColor = [UIColor colorWithRed:249/255.0 green:83/255.0 blue:100/255.0 alpha:1];
            // 添加
            _textView_sex.text = sender.titleLabel.text;
            
            _button1.selected = NO;
            _button1.backgroundColor = [UIColor whiteColor];
            _button3.selected = NO;
            _button3.backgroundColor = [UIColor whiteColor];
            _button4.selected = NO;
            _button4.backgroundColor = [UIColor whiteColor];
            _button5.selected = NO;
            _button5.backgroundColor = [UIColor whiteColor];
            _button6.selected = NO;
            _button6.backgroundColor = [UIColor whiteColor];
            
        }else{
            sender.selected = NO;
            sender.backgroundColor = [UIColor whiteColor];
            // 删除
            _textView_sex.text = [_textView_sex.text stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@",sender.titleLabel.text] withString:@""];
        }
    
    }else if (sender.tag == 3){
        if (sender.selected == NO) {
            sender.selected = YES;
            sender.backgroundColor = [UIColor colorWithRed:249/255.0 green:83/255.0 blue:100/255.0 alpha:1];
            // 添加
            _textView_sex.text = sender.titleLabel.text;
            
            _button2.selected = NO;
            _button2.backgroundColor = [UIColor whiteColor];
            _button1.selected = NO;
            _button1.backgroundColor = [UIColor whiteColor];
            _button4.selected = NO;
            _button4.backgroundColor = [UIColor whiteColor];
            _button5.selected = NO;
            _button5.backgroundColor = [UIColor whiteColor];
            _button6.selected = NO;
            _button6.backgroundColor = [UIColor whiteColor];
            
        }else{
            sender.selected = NO;
            sender.backgroundColor = [UIColor whiteColor];
            // 删除
            _textView_sex.text = [_textView_sex.text stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@",sender.titleLabel.text] withString:@""];
        }
    }else if (sender.tag == 4){
        if (sender.selected == NO) {
            sender.selected = YES;
            sender.backgroundColor = [UIColor colorWithRed:249/255.0 green:83/255.0 blue:100/255.0 alpha:1];
            // 添加
            _textView_sex.text = sender.titleLabel.text;
            
            _button2.selected = NO;
            _button2.backgroundColor = [UIColor whiteColor];
            _button3.selected = NO;
            _button3.backgroundColor = [UIColor whiteColor];
            _button1.selected = NO;
            _button1.backgroundColor = [UIColor whiteColor];
            _button5.selected = NO;
            _button5.backgroundColor = [UIColor whiteColor];
            _button6.selected = NO;
            _button6.backgroundColor = [UIColor whiteColor];
            
        }else{
            sender.selected = NO;
            sender.backgroundColor = [UIColor whiteColor];
            // 删除
            _textView_sex.text = [_textView_sex.text stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@",sender.titleLabel.text] withString:@""];
        }
    }else if (sender.tag == 5){
        if (sender.selected == NO) {
            sender.selected = YES;
            sender.backgroundColor = [UIColor colorWithRed:249/255.0 green:83/255.0 blue:100/255.0 alpha:1];
            // 添加
            _textView_sex.text = sender.titleLabel.text;
            
            _button2.selected = NO;
            _button2.backgroundColor = [UIColor whiteColor];
            _button3.selected = NO;
            _button3.backgroundColor = [UIColor whiteColor];
            _button1.selected = NO;
            _button1.backgroundColor = [UIColor whiteColor];
            _button4.selected = NO;
            _button4.backgroundColor = [UIColor whiteColor];
            _button6.selected = NO;
            _button6.backgroundColor = [UIColor whiteColor];
            
        }else{
            sender.selected = NO;
            sender.backgroundColor = [UIColor whiteColor];
            // 删除
            _textView_sex.text = [_textView_sex.text stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@",sender.titleLabel.text] withString:@""];
        }
    }else if (sender.tag == 6){
        if (sender.selected == NO) {
            sender.selected = YES;
            sender.backgroundColor = [UIColor colorWithRed:249/255.0 green:83/255.0 blue:100/255.0 alpha:1];
            // 添加
            _textView_sex.text = sender.titleLabel.text;
            
            _button2.selected = NO;
            _button2.backgroundColor = [UIColor whiteColor];
            _button3.selected = NO;
            _button3.backgroundColor = [UIColor whiteColor];
            _button1.selected = NO;
            _button1.backgroundColor = [UIColor whiteColor];
            _button5.selected = NO;
            _button5.backgroundColor = [UIColor whiteColor];
            _button4.selected = NO;
            _button4.backgroundColor = [UIColor whiteColor];
            
        }else{
            sender.selected = NO;
            sender.backgroundColor = [UIColor whiteColor];
            // 删除
            _textView_sex.text = [_textView_sex.text stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@",sender.titleLabel.text] withString:@""];
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
