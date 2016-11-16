//
//  ChooseTableViewController.m
//  BirdFight
//
//  Created by 聚米 on 16/10/20.
//  Copyright © 2016年 聚米. All rights reserved.
//

#import "ChooseTableViewController.h"
#import "UIButton+Bird.h"
#import "AreaViewController.h"
#import "AgeViewController.h"
#import "MyAlertView.h"
#import "AutoFillScreenUtils.h"
#import "UIView+ShowView.h"
#import "InfoATableViewCell.h"
#import "ChooseA_TableViewCell.h"
#import "ChooseB_TableViewCell.h"
#import "ChooseC_TableViewCell.h"
#import "ChooseD_TableViewCell.h"
#import "BodyPart_Boy_TableViewCell.h"
#import "BodyPart_Girl_TableViewCell.h"
#import "ChooseModel.h"

#define Button_Size button.bounds.size

@interface ChooseTableViewController ()

@property (nonatomic, strong) ChooseModel * chooseModel; // 筛选模型

@property (nonatomic, strong) NSArray * incomes; // 收入

@property (nonatomic, strong) NSArray * heights; // 身高

@property (nonatomic, strong) NSArray * ages; // 年龄

@property (nonatomic, strong) MyAlertView * myAlertView; // 弹出框


@end

@implementation ChooseTableViewController

#pragma mark 视图出现
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
    
    //通知传值
    NSNotificationCenter * noti = [NSNotificationCenter defaultCenter];
    [noti addObserver:self selector:@selector(handleArea:) name:@"area" object:nil];

    
    if (_sort_str == nil) {
        _sort_str = @"最近活跃";
    }
    if (_sex_str == nil) {
        _sex_str = @"男";
    }
    
    if (_area_str == nil) {
        _area_str = @"";
    }
    if (_age_str == nil) {
        _age_str = @"不限";
    }
    if (_height_str == nil) {
        _height_str = @"不限";
    }
    if (_income_str == nil) {
        _income_str = @"不限";
    }
    
    [self.tableView reloadData];
}

#pragma mark 地区传值
-(void)handleArea:(NSNotification *)sender{
    NSDictionary * dic = [sender userInfo];
    _area_str = dic[@"area"];
    NSLog(@"点击了%@",_area_str);
    
    
    
    
    
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _chooseModel = [[ChooseModel alloc]init];
    
    
    // 设置导航栏信息
    self.title = @"筛选";
    
    UIBarButtonItem * rightBtn = [[UIBarButtonItem alloc]initWithTitle:@"搜索" style:UIBarButtonItemStyleDone target:self action:@selector(tapRightBtn)];
    self.navigationItem.rightBarButtonItem = rightBtn;
    
    //加载cell内容
    [self loadMutableArray];
    
    // 注册xibcell
    [self.tableView registerNib:[UINib nibWithNibName:@"InfoATableViewCell" bundle:nil] forCellReuseIdentifier:@"InfoACell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"ChooseA_TableViewCell" bundle:nil] forCellReuseIdentifier:@"ChooseA_Cell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"ChooseB_TableViewCell" bundle:nil] forCellReuseIdentifier:@"ChooseB_Cell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"ChooseC_TableViewCell" bundle:nil] forCellReuseIdentifier:@"ChooseC_Cell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"ChooseD_TableViewCell" bundle:nil] forCellReuseIdentifier:@"ChooseD_Cell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"BodyPart_Boy_TableViewCell" bundle:nil] forCellReuseIdentifier:@"Body_Boy"];
    [self.tableView registerNib:[UINib nibWithNibName:@"BodyPart_Girl_TableViewCell" bundle:nil] forCellReuseIdentifier:@"Body_Girl"];
    
}

#pragma mark 点击确定按钮
-(void)tapRightBtn
{
    NSLog(@"点击了搜索");
    [self.navigationController popViewControllerAnimated:YES];
    
    
    
    
    
    
    
    
    
    
    
}

#pragma mark 加载可变数组
-(void)loadMutableArray
{
    // 收入
    // 读取plist文件，从bundle目录获取文件路径
    NSString *path = [[NSBundle mainBundle] pathForResource:@"income_choose" ofType:@"plist"];
    // 将plist文件读取到数组中
    self.incomes = [NSArray arrayWithContentsOfFile:path];
    
    
    // 身高  140<=  <150
    NSMutableArray * hArr = [NSMutableArray array];
    int height = 0;
    for (int i = 0; height<221; i++) {
        height = 140 + 10 * i;
        [hArr addObject:[NSString stringWithFormat:@"%dcm-%dcm",height,height+10]];
    }
    [hArr insertObject:@"不限" atIndex:0];
    self.heights = [NSArray arrayWithArray:hArr];
    
    // 年龄  16<=  <=20
    NSMutableArray * aArr = [NSMutableArray array];
    int age = 0;
    for (int i = 0; age<61; i++) {
        age = 16 + 5 * i;
        [aArr addObject:[NSString stringWithFormat:@"%d—%d",age,age+4]];
    }
    [aArr insertObject:@"不限" atIndex:0];
    self.ages = [NSArray arrayWithArray:aArr];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source

#pragma mark 分区
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

#pragma mark 头高
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    NSInteger count;
    switch (section) {
        case 0:
        {
            count = 0;
            break;
        }
        case 1:
        {
            count = 50;
            break;
        }
        default:
            break;
    }
    return count;
}

#pragma mark 头内容
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView * headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 50)];
    headerView.backgroundColor = [UIColor colorWithRed:246/255.0 green:246/255.0 blue:246/255.0 alpha:1];
    
    // 设置控件label
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(10, 5, 100, 40)];
    label.text = @"高级筛选";
    label.textColor = [UIColor blackColor];
    label.font = [UIFont systemFontOfSize:17];
    label.backgroundColor = [UIColor clearColor];
    [headerView addSubview:label];
    
    // 设置控件button
    UIButton * button = [[UIButton alloc]initWithFrame:CGRectMake(headerView.bounds.size.width-80, 12, 70, 26)];
    [button setTitle:@"开通会员" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:12];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.backgroundColor = [UIColor colorWithRed:249/255.0 green:83/255.0 blue:100/255.0 alpha:1];
    button.layer.cornerRadius = 13;
    button.layer.masksToBounds = YES;
//    [button diyStyle];
    [button addTarget:self action:@selector(tapMemberBtn) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:button];
    
    return headerView;
}

-(void)tapMemberBtn
{
    NSLog(@"点击了开通会员");
    
    
    
    
    
    
    
    
}

#pragma mark 行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    NSInteger count;
    switch (section) {
        case 0:
        {
            count = 5;
            break;
        }
        case 1:
        {
            count = 4;
            break;
        }
        default:
            break;
    }
    
    return count;
}

#pragma mark 行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) {
        if (indexPath.row == 3) {
            self.tableView.rowHeight = UITableViewAutomaticDimension;
            self.tableView.estimatedRowHeight = 400;
            return self.tableView.rowHeight;
        }
    }
    return 50;
}

#pragma mark 加载数据
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * str = @"InfoACell";
    NSString * str_A = @"ChooseA_Cell";
    NSString * str_B = @"ChooseB_Cell";
    NSString * str_C = @"ChooseC_Cell";
    NSString * str_D = @"ChooseD_Cell";
    NSString * str_boy = @"Body_Boy";
    NSString * str_girl = @"Body_Girl";
    
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            ChooseA_TableViewCell * cell = [self.tableView dequeueReusableCellWithIdentifier:str_A];
            if (cell != nil) {
                cell.titleLabel.text = @"排序";
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
            }
            return cell;
            
        }else if (indexPath.row == 1){
            ChooseB_TableViewCell * cell = [self.tableView dequeueReusableCellWithIdentifier:str_B];
            if (cell != nil) {
                cell.titleLabel.text = @"性别";
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                
                cell.block = ^(UIButton * button){
                    switch (button.tag) {
                        case 1:
                        {
                            _sex_str = @"全部";
                            NSLog(@"点击了全部");
                            break;
                        }
                        case 2:
                        {
                            _sex_str = @"男";
                            NSLog(@"点击了男");
                            
                            break;
                        }
                        case 3:
                        {
                            _sex_str = @"女";
                            NSLog(@"点击了女");
                            break;
                        }
                        default:
                            break;
                    }
                    
                    
                };
                
            }
            return cell;
            
        }else if (indexPath.row == 2){
            InfoATableViewCell * cell = [self.tableView dequeueReusableCellWithIdentifier:str];
            if (cell != nil) {
                cell.textLabel.text = @"国家";
                cell.textLabel.textColor = [UIColor lightGrayColor];
                cell.detailTextLabel.text = @"中国";
                cell.userInteractionEnabled = NO;
            }
            return cell;
            
        }else if (indexPath.row == 3){
            InfoATableViewCell * cell = [self.tableView dequeueReusableCellWithIdentifier:str];
            if (cell != nil) {
                cell.textLabel.text = @"地区";
                cell.textLabel.textColor = [UIColor lightGrayColor];
                cell.detailTextLabel.text = _area_str;
            }
            return cell;
            
        }else if (indexPath.row == 4){
            ChooseC_TableViewCell * cell = [self.tableView dequeueReusableCellWithIdentifier:str_C];
            if (cell != nil) {
                cell.titleLabel.text = @"视频认证";
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                
                
                
                
                
                
                
            }
            return cell;
        }

    }else if (indexPath.section == 1){
        if (indexPath.row == 0) {
            InfoATableViewCell * cell = [self.tableView dequeueReusableCellWithIdentifier:str];
            if (cell != nil) {
                cell.textLabel.text = @"年龄";
                cell.textLabel.textColor = [UIColor lightGrayColor];
                cell.detailTextLabel.text = _age_str;
            }
            return cell;
            
        }else if (indexPath.row == 1){
            InfoATableViewCell * cell = [self.tableView dequeueReusableCellWithIdentifier:str];
            if (cell != nil) {
                cell.textLabel.text = @"身高";
                cell.textLabel.textColor = [UIColor lightGrayColor];
                cell.detailTextLabel.text = _height_str;
            }
            return cell;
            
        }else if (indexPath.row == 2){
            InfoATableViewCell * cell = [self.tableView dequeueReusableCellWithIdentifier:str];
            if (cell != nil) {
                cell.textLabel.text = @"收入";
                cell.textLabel.textColor = [UIColor lightGrayColor];
                cell.detailTextLabel.text = _income_str;
            }
            return cell;
            
        }else if (indexPath.row == 3){
            
            //通知传值
            NSNotificationCenter * noti = [NSNotificationCenter defaultCenter];
            
            if ([_sex_str isEqualToString:@"全部"]) {
                ChooseD_TableViewCell * cell = [self.tableView dequeueReusableCellWithIdentifier:str_D];
                if (cell != nil) {
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    
                    //通知传值
//                    NSNotificationCenter * noti = [NSNotificationCenter defaultCenter];
                    [noti addObserver:self selector:@selector(handleBodyPart:) name:@"bodyPart" object:nil];
                }

                return cell;
            }else if ([_sex_str isEqualToString:@"男"]){
                BodyPart_Boy_TableViewCell * cell = [self.tableView dequeueReusableCellWithIdentifier:str_boy];
                if (cell != nil) {
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    
                    //通知传值
//                    NSNotificationCenter * noti = [NSNotificationCenter defaultCenter];
                    [noti addObserver:self selector:@selector(handleBodyPart_boy:) name:@"bodyPart_boy" object:nil];
                }

                return cell;
            }else if ([_sex_str isEqualToString:@"女"]){
                ChooseD_TableViewCell * cell = [self.tableView dequeueReusableCellWithIdentifier:str_girl];
                if (cell != nil) {
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    
                    //通知传值
//                    NSNotificationCenter * noti = [NSNotificationCenter defaultCenter];
                    [noti addObserver:self selector:@selector(handleBodyPart_girl:) name:@"bodyPart_girl" object:nil];
                }

                return cell;
            }
        }
        
    }
    return nil;
}

#pragma mark 通知传值
-(void)handleBodyPart:(NSNotification *)sender{
    NSDictionary * dic = [sender userInfo];
    NSString * str = dic[@"bodyPart"];
    NSLog(@"点击了%@",str);
    
    
    
    
    
    
    
}

-(void)handleBodyPart_boy:(NSNotification *)sender{
    NSDictionary * dic = [sender userInfo];
    NSString * str = dic[@"bodyPart_boy"];
    NSLog(@"点击了%@",str);
    
    
    
    
    
    
}

-(void)handleBodyPart_girl:(NSNotification *)sender{
    NSDictionary * dic = [sender userInfo];
    NSString * str = dic[@"bodyPart_girl"];
    NSLog(@"点击了%@",str);
    
    
    
    
    
    
}

#pragma mark 点击cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
   [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.section) {
        case 0:
        {
            switch (indexPath.row) {
                case 3:
                {
                    AreaViewController * vc = [[AreaViewController alloc]initWithNibName:@"AreaViewController" bundle:nil];
                     self.hidesBottomBarWhenPushed=YES;
                    [self.navigationController pushViewController:vc animated:YES];
                    
                    break;
                }
                default:
                    break;
            }
            break;
        }
        case 1:
        {
            switch (indexPath.row) {
                case 0:
                {
                    _myAlertView = [[MyAlertView alloc]initWithFrame:self.view.bounds withTitle:@"请选择年龄" withArray:_ages];
                    [_myAlertView show];
                    [AutoFillScreenUtils autoLayoutFillScreen:_myAlertView];
                    __weak __block ChooseTableViewController * copy_self = self;
                    _myAlertView.block = ^(NSString * str){
                        copy_self.age_str = str;
                        [copy_self.tableView reloadData];
                    };
                    break;
                }
                case 1:
                {
                    _myAlertView = [[MyAlertView alloc]initWithFrame:self.view.bounds withTitle:@"请选择身高" withArray:_heights];
                    [_myAlertView show];
                    [AutoFillScreenUtils autoLayoutFillScreen:_myAlertView];
                    __weak __block ChooseTableViewController * copy_self = self;
                    _myAlertView.block = ^(NSString * str){
                        copy_self.height_str = str;
                        [copy_self.tableView reloadData];
                    };

                    break;
                }
                case 2:
                {
                    _myAlertView = [[MyAlertView alloc]initWithFrame:self.view.bounds withTitle:@"请选择收入" withArray:_incomes];
                    [_myAlertView show];
                    [AutoFillScreenUtils autoLayoutFillScreen:_myAlertView];
                    __weak __block ChooseTableViewController * copy_self = self;
                    _myAlertView.block = ^(NSString * str){
                        copy_self.income_str = str;
                        [copy_self.tableView reloadData];
                    };

                    break;
                }
                default:
                    break;
            }
            break;
        }
        default:
            break;
    }
}

#pragma mark 移除通知
-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"bodyPart" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"bodyPart_boy" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"bodyPart_girl" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"area" object:nil];
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
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
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
