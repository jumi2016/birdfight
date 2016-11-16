//
//  OtherAskViewController.m
//  BirdFight
//
//  Created by 聚米 on 16/10/15.
//  Copyright © 2016年 聚米. All rights reserved.
//

#import "OtherAskViewController.h"
#import "UIView+ShowView.h"
#import "ZJTextView.h"
#import "AutoFillScreenUtils.h"

@interface OtherAskViewController ()

@property (weak, nonatomic) IBOutlet UIView *view_TV;

@property (nonatomic, strong) ZJTextView * textView_other;

@property (weak, nonatomic) IBOutlet UILabel *label_1;
@property (weak, nonatomic) IBOutlet UILabel *label_2;

@property (weak, nonatomic) IBOutlet UIView *view_1;
@property (weak, nonatomic) IBOutlet UILabel *label_11;
@property (weak, nonatomic) IBOutlet UILabel *label_12;
@property (nonatomic, strong) UIButton * button1;

@property (weak, nonatomic) IBOutlet UIView *view_2;
@property (weak, nonatomic) IBOutlet UILabel *label_21;
@property (weak, nonatomic) IBOutlet UILabel *label_22;
@property (nonatomic, strong) UIButton * button2;

@property (weak, nonatomic) IBOutlet UIView *view_3;
@property (weak, nonatomic) IBOutlet UILabel *label_31;
@property (weak, nonatomic) IBOutlet UILabel *label_32;
@property (nonatomic, strong) UIButton * button3;

@end

@implementation OtherAskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // 设置导航栏
    self.title = @"对另一半的要求";
    UIBarButtonItem * rightBtn = [[UIBarButtonItem alloc]initWithTitle:@"保存" style:UIBarButtonItemStyleDone target:self action:@selector(tapRightBtn)];
    self.navigationItem.rightBarButtonItem = rightBtn;
    
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    // 设置控件
    _view_TV.frame = CGRectMake(0, 70, 320, 150);
    
    _textView_other = [[ZJTextView alloc]initWithFrame:CGRectMake(10, 10, 300, 105)];
    _textView_other.myPlaceholder = @"说点什么吧";
    _textView_other.myPlaceholderColor = [UIColor lightGrayColor];
    [self.view_TV addSubview:_textView_other];
    self.automaticallyAdjustsScrollViewInsets = NO;// 让文字在最顶端显示
    
    _label_1.frame = CGRectMake(230, 120, 80, 20);
    _label_2.frame = CGRectMake(60, 230, 200, 20);

    // 设置view1
    _view_1.frame = CGRectMake(10, 260, 300, 50);
    [_view_1 diyView];
    _label_11.frame = CGRectMake(15, 2, 80, 25);
    _label_12.frame = CGRectMake(15, 27, 270, 20);
    _button1 = [[UIButton alloc]initWithFrame:_view_1.bounds];
    [self setButtonInView:_view_1 withButton:_button1 withTag:1];
    
    // 设置view2
    _view_2.frame = CGRectMake(10, 320, 300, 50);
    [_view_2 diyView];
    _label_21.frame = CGRectMake(15, 2, 80, 25);
    _label_22.frame = CGRectMake(15, 27, 270, 20);
    _button2 = [[UIButton alloc]initWithFrame:_view_2.bounds];
    [self setButtonInView:_view_2 withButton:_button2 withTag:2];
    
    // 设置view3
    _view_3.frame = CGRectMake(10, 380, 300, 50);
    [_view_3 diyView];
    _label_31.frame = CGRectMake(15, 2, 80, 25);
    _label_32.frame = CGRectMake(15, 27, 270, 20);
    _button3 = [[UIButton alloc]initWithFrame:_view_3.bounds];
    [self setButtonInView:_view_3 withButton:_button3 withTag:3];
    
    
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
-(void)tapBtn:(UIButton *)button
{
    if (button.tag == 1) {
        if (button.selected == NO) {
            button.selected = YES;
            [self selectToLabelColor:_label_11 withColor:_label_12 withViewColor:_view_1];
            _textView_other.text = _label_12.text;
            
            _button2.selected = NO;
            [self unSelectToLabelColor:_label_21 withColor:_label_22 withViewColor:_view_2];
            _button3.selected = NO;
            [self unSelectToLabelColor:_label_31 withColor:_label_32 withViewColor:_view_3];
        }else{
            button.selected = NO;
            [self unSelectToLabelColor:_label_11 withColor:_label_12 withViewColor:_view_1];
            _textView_other.text = [_textView_other.text stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@",_label_12.text] withString:@""];
        }
    }else if (button.tag == 2){
        if (button.selected == NO) {
            button.selected = YES;
            [self selectToLabelColor:_label_21 withColor:_label_22 withViewColor:_view_2];
            _textView_other.text = _label_22.text;
            
            _button1.selected = NO;
            [self unSelectToLabelColor:_label_11 withColor:_label_12 withViewColor:_view_1];
            _button3.selected = NO;
            [self unSelectToLabelColor:_label_31 withColor:_label_32 withViewColor:_view_3];
        }else{
            button.selected = NO;
            [self unSelectToLabelColor:_label_21 withColor:_label_22 withViewColor:_view_2];
            _textView_other.text = [_textView_other.text stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@",_label_22.text] withString:@""];
        }

    }else if (button.tag ==3){
        if (button.selected == NO) {
            button.selected = YES;
            [self selectToLabelColor:_label_31 withColor:_label_32 withViewColor:_view_3];
            _textView_other.text = _label_32.text;
            
            _button2.selected = NO;
            [self unSelectToLabelColor:_label_21 withColor:_label_22 withViewColor:_view_2];
            _button1.selected = NO;
            [self unSelectToLabelColor:_label_11 withColor:_label_12 withViewColor:_view_1];
        }else{
            button.selected = NO;
            [self unSelectToLabelColor:_label_31 withColor:_label_32 withViewColor:_view_3];
            _textView_other.text = [_textView_other.text stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@",_label_32.text] withString:@""];
        }
    }
}

#pragma mark button
-(void)setButtonInView:(UIView *)view withButton:(UIButton *)button withTag:(int)tag
{
    button.backgroundColor = [UIColor clearColor];
    button.tag = tag;
    button.selected = NO;
    [button addTarget:self action:@selector(tapBtn:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button];
}

#pragma mark 选中
-(void)selectToLabelColor:(UILabel *)label_1 withColor:(UILabel *)label_2 withViewColor:(UIView *)view
{
    label_1.textColor = [UIColor whiteColor];
    label_2.textColor = [UIColor whiteColor];
    view.backgroundColor = [UIColor colorWithRed:249/255.0 green:83/255.0 blue:100/255.0 alpha:1];
}

#pragma mark 未选中
-(void)unSelectToLabelColor:(UILabel *)label_1 withColor:(UILabel *)label_2 withViewColor:(UIView *)view
{
    label_1.textColor = [UIColor blackColor];
    label_2.textColor = [UIColor darkGrayColor];
    view.backgroundColor = [UIColor whiteColor];
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
