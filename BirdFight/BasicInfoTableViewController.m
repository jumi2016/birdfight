//
//  BasicInfoTableViewController.m
//  BirdFight
//
//  Created by 聚米 on 16/10/15.
//  Copyright © 2016年 聚米. All rights reserved.
//

#import "BasicInfoTableViewController.h"
#import "InfoATableViewCell.h"
#import "InfoBTableViewCell.h"
#import "MainTabBarController.h"
#import "NickNameViewController.h"
#import "PersonalSignViewController.h"
#import "ProfessionViewController.h"
#import "StruggleViewController.h"
#import "LoveOpinionViewController.h"
#import "SexOpinionViewController.h"
#import "OtherAskViewController.h"
#import "SkillViewController.h"
#import "BodyPartsViewController.h"
#import "YueHuiViewController.h"
#import "QinMiViewController.h"
#import "AgeViewController.h"
#import "AreaViewController.h"
#import "LongStationViewController.h"
#import "MyAlertView.h"
#import "AutoFillScreenUtils.h"
#import "UIView+ShowView.h"

@interface BasicInfoTableViewController ()

@property (nonatomic, strong) NSMutableArray * mutableArray; // 选项

@property (nonatomic, strong) NSArray * str_arr; // 内容

@property (nonatomic, strong) NSArray * incomes; // 收入

@property (nonatomic, strong) NSArray * heights; // 身高

@property (nonatomic, strong) NSArray * weights; // 体重

@property (nonatomic, strong) MyAlertView * myAlertView; // 弹出框

@end

@implementation BasicInfoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _mutableArray = [NSMutableArray array];
    
    // 设置导航栏信息
    self.title = @"基本信息修改";
    // 设置navigation返回按钮0
    UIBarButtonItem * buttonItem = [[UIBarButtonItem alloc]init];
    buttonItem.title = @"返回";
    self.navigationItem.backBarButtonItem= buttonItem;
    
    UIBarButtonItem * rightBtn = [[UIBarButtonItem alloc]initWithTitle:@"确定" style:UIBarButtonItemStyleDone target:self action:@selector(tapRightBtn)];
    self.navigationItem.rightBarButtonItem = rightBtn;
    UIBarButtonItem * leftBtn = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(tapLeftBtn)];
    self.navigationItem.leftBarButtonItem = leftBtn;
    //加载cell内容
    [self loadMutableArray];
    [self loadStrArr];
    // 注册xibcell
    [self.tableView registerNib:[UINib nibWithNibName:@"InfoATableViewCell" bundle:nil] forCellReuseIdentifier:@"InfoACell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"InfoBTableViewCell" bundle:nil] forCellReuseIdentifier:@"InfoBCell"];
}

#pragma mark 加载字符串数组
-(void)loadStrArr
{
    if (_name_str == nil) {
        _name_str = @"填写";
    }
    if (_age_str == nil) {
        _age_str = @"请选择";
    }
    if (_area_str == nil) {
        _area_str = @"请选择";
    }
    if (_longStation_str == nil) {
        _longStation_str = @"请选择";
    }
    if (_personalSign_str == nil) {
        _personalSign_str = @"填写";
    }
    if (_profession_str == nil) {
        _profession_str = @"请选择";
    }
    if (_struggle_str == nil) {
        _struggle_str = @"请选择";
    }
    if (_income_str == nil) {
        _income_str = @"请选择";
    }
    if (_height_str == nil) {
        _height_str = @"请选择";
    }
    if (_weight_str == nil) {
        _weight_str = @"请选择";
    }
    if (_loveOpinion_str == nil) {
        _loveOpinion_str = @"请选择";
    }
    if (_sexOpinion_str == nil) {
        _sexOpinion_str = @"请选择";
    }
    if (_otherAsk_str == nil) {
        _otherAsk_str = @"请选择";
    }
    if (_skill_str == nil) {
        _skill_str = @"请选择";
    }
    if (_bodyParts_str == nil) {
        _bodyParts_str = @"请选择";
    }
    if (_yuehui_str == nil) {
        _yuehui_str = @"请选择";
    }
    if (_qinmi_str == nil) {
        _qinmi_str = @"请选择";
    }
    _str_arr = @[_name_str,_age_str,_area_str,_longStation_str,_personalSign_str,_profession_str,_struggle_str,_income_str,_height_str,_weight_str,_loveOpinion_str,_sexOpinion_str,_otherAsk_str,_skill_str,_bodyParts_str,_yuehui_str,_qinmi_str];
}

#pragma mark 加载可变数组
-(void)loadMutableArray
{
    // 选项
    NSString * plistPath = [[NSBundle mainBundle] pathForResource:@"basicContent" ofType:@"plist"];
    NSMutableArray * arr = [[NSMutableArray alloc]initWithContentsOfFile:plistPath];
    _mutableArray = arr;
    
    // 收入
    // 读取plist文件，从bundle目录获取文件路径
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Income" ofType:@"plist"];
    // 将plist文件读取到数组中
    self.incomes = [NSArray arrayWithContentsOfFile:path];
    
    
    // 身高
    NSMutableArray * hArr = [NSMutableArray array];
    int height = 0;
    for (int i = 0; height<221; i++) {
        height = 140 + i;
        [hArr addObject:[NSString stringWithFormat:@"%dcm",height]];
    }
    self.heights = [NSArray arrayWithArray:hArr];
    
    // 体重
    NSMutableArray * wArr = [NSMutableArray array];
    int weight = 0;
    for (int i = 0; weight<101; i++) {
        weight = 35 + i;
        [wArr addObject:[NSString stringWithFormat:@"%dkg",weight]];
    }
    self.weights = [NSArray arrayWithArray:wArr];
}

#pragma mark 点击确定按钮
-(void)tapRightBtn
{
    NSLog(@"点击了确定");
    
    // 跳转主页VC  保存信息
    MainTabBarController * vc = [[MainTabBarController alloc]initWithNibName:@"MainTabBarController" bundle:nil];
    self.view.window.rootViewController = vc;
    vc.view.transform = CGAffineTransformMakeScale(0.2, 0.2);
    [UIView animateWithDuration:0.3 animations:^{
        vc.view.transform = CGAffineTransformIdentity;
    }];

    
    
    
    
    
    
    
    
    
    
    
}

#pragma mark 点击取消按钮
-(void)tapLeftBtn
{
    NSLog(@"点击了取消");
    
    // 跳转主页
    MainTabBarController * vc = [[MainTabBarController alloc]initWithNibName:@"MainTabBarController" bundle:nil];
    self.view.window.rootViewController = vc;
    vc.view.transform = CGAffineTransformMakeScale(0.2, 0.2);
    [UIView animateWithDuration:0.3 animations:^{
        vc.view.transform = CGAffineTransformIdentity;
    }];
    
    
    
    
    
    
    
    
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
#pragma mark 分区数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

#pragma mark 行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _mutableArray.count;
}

#pragma mark 行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 4 || indexPath.row == 5 || indexPath.row == 10 || indexPath.row == 11 || indexPath.row == 12 || indexPath.row == 13 || indexPath.row == 14) {
        self.tableView.rowHeight = UITableViewAutomaticDimension;
        self.tableView.estimatedRowHeight = 80;
        return self.tableView.rowHeight;
    }
    return 50;
}

#pragma mark cell显示数据
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    NSString * str_A = @"InfoACell";
    NSString * str_B = @"InfoBCell";
    if (indexPath.row == 4 || indexPath.row == 5 || indexPath.row == 10 || indexPath.row == 11 || indexPath.row == 12 || indexPath.row == 13 || indexPath.row == 14) {
        InfoBTableViewCell * cell = [self.tableView dequeueReusableCellWithIdentifier:str_B];
        cell.detailTitleLabel.textColor = [UIColor lightGrayColor];
        if (cell != nil) {
            cell.titleLabel.text = _mutableArray[indexPath.row];
            cell.detailTitleLabel.text = _str_arr[indexPath.row];
        }
        return cell;
    }else{
        InfoATableViewCell * cell = [self.tableView dequeueReusableCellWithIdentifier:str_A];
        cell.detailTextLabel.textColor = [UIColor lightGrayColor];
        if (cell != nil) {
            cell.textLabel.text = _mutableArray[indexPath.row];
            cell.detailTextLabel.text = _str_arr[indexPath.row];
        }
        return  cell;
    }
    return nil;
}

 #pragma mark - Table view delegate 点击cell跳转界面
 - (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 0) {
        NickNameViewController * vc = [[NickNameViewController alloc]initWithNibName:@"NickNameViewController" bundle:nil];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 1){
        AgeViewController * vc = [[AgeViewController alloc]initWithNibName:@"AgeViewController" bundle:nil];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 2){
        AreaViewController * vc = [[AreaViewController alloc]initWithNibName:@"AreaViewController" bundle:nil];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 3){
        LongStationViewController * vc = [[LongStationViewController alloc]initWithNibName:@"LongStationViewController" bundle:nil];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 4){
        PersonalSignViewController * vc = [[PersonalSignViewController alloc]initWithNibName:@"PersonalSignViewController" bundle:nil];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 5){
        ProfessionViewController * vc = [[ProfessionViewController alloc]initWithNibName:@"ProfessionViewController" bundle:nil];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 6){
        StruggleViewController * vc = [[StruggleViewController alloc]initWithNibName:@"StruggleViewController" bundle:nil];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 7){
        
        _myAlertView = [[MyAlertView alloc]initWithFrame:self.view.bounds withTitle:@"请选择收入" withArray:_incomes];
        [_myAlertView show];
        [AutoFillScreenUtils autoLayoutFillScreen:_myAlertView];
        __weak __block BasicInfoTableViewController * copy_self = self;
        _myAlertView.block = ^(NSString * str){
            copy_self.income_str = str;
            [copy_self loadStrArr];
            [copy_self.tableView reloadData];
        };
    
    }else if (indexPath.row == 8){
        
        _myAlertView = [[MyAlertView alloc]initWithFrame:self.view.bounds withTitle:@"请选择身高" withArray:_heights];
        [_myAlertView show];
        [AutoFillScreenUtils autoLayoutFillScreen:_myAlertView];
        __weak __block BasicInfoTableViewController * copy_self = self;
        _myAlertView.block = ^(NSString * str){
            copy_self.height_str = str;
            [copy_self loadStrArr];
            [copy_self.tableView reloadData];
        };

        
    }else if (indexPath.row == 9){
        
        _myAlertView = [[MyAlertView alloc]initWithFrame:self.view.bounds withTitle:@"请选择体重" withArray:_weights];
        [_myAlertView show];
        [AutoFillScreenUtils autoLayoutFillScreen:_myAlertView];
        __weak __block BasicInfoTableViewController * copy_self = self;
        _myAlertView.block = ^(NSString * str){
            copy_self.weight_str = str;
            [copy_self loadStrArr];
            [copy_self.tableView reloadData];
        };

        
    }else if (indexPath.row == 10){
        LoveOpinionViewController * vc = [[LoveOpinionViewController alloc]initWithNibName:@"LoveOpinionViewController" bundle:nil];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 11){
        SexOpinionViewController * vc = [[SexOpinionViewController alloc]initWithNibName:@"SexOpinionViewController" bundle:nil];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 12){
        OtherAskViewController * vc = [[OtherAskViewController alloc]initWithNibName:@"OtherAskViewController" bundle:nil];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 13){
        SkillViewController * vc = [[SkillViewController alloc]initWithNibName:@"SkillViewController" bundle:nil];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 14){
        BodyPartsViewController * vc = [[BodyPartsViewController alloc]initWithNibName:@"BodyPartsViewController" bundle:nil];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 15){
        YueHuiViewController * vc = [[YueHuiViewController alloc]initWithNibName:@"YueHuiViewController" bundle:nil];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 16){
        QinMiViewController * vc = [[QinMiViewController alloc]initWithNibName:@"QinMiViewController" bundle:nil];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
