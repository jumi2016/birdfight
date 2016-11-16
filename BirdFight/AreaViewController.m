//
//  AreaViewController.m
//  BirdFight
//
//  Created by 聚米 on 16/10/19.
//  Copyright © 2016年 聚米. All rights reserved.
//

#import "AreaViewController.h"
#import "InfoATableViewCell.h"
#import "AutoFillScreenUtils.h"
#import "AreaView.h"
#import "ChooseTableViewController.h"

@interface AreaViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *mytableView;

@property (nonatomic, strong) AreaView * areaView;

@end

@implementation AreaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    if (_area_str == nil) {
        _area_str = @"选择";
    }
    
    // 设置导航栏
    self.title = @"修改所在地";
    UIBarButtonItem * rightBtn = [[UIBarButtonItem alloc]initWithTitle:@"保存" style:UIBarButtonItemStyleDone target:self action:@selector(tapRightBtn)];
    self.navigationItem.rightBarButtonItem = rightBtn;
    
    // 设置属性
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    _mytableView.frame = CGRectMake(0, 70, 320, 100);
    _mytableView.backgroundColor = [UIColor clearColor];
    _mytableView.delegate = self;
    _mytableView.dataSource = self;
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    // 等比例约束
    [AutoFillScreenUtils autoLayoutFillScreen:self.view];
    
    // 注册xibcell
    [self.mytableView registerNib:[UINib nibWithNibName:@"InfoATableViewCell" bundle:nil] forCellReuseIdentifier:@"InfoACell"];
}

#pragma mark 点击保存按钮
-(void)tapRightBtn
{
    
    //通知传值
    NSDictionary * dic = [NSDictionary dictionaryWithObject:_area_str forKey:@"area"];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"area" object:self userInfo:dic];
    
    NSLog(@"点击了保存按钮");
    [self.navigationController popViewControllerAnimated:YES];
    
    
    
    
    
    
    
    
    
    
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}



#pragma mark cell显示数据
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString * str_A = @"InfoACell";
    InfoATableViewCell * cell = [self.mytableView dequeueReusableCellWithIdentifier:str_A];
    cell.detailTextLabel.textColor = [UIColor lightGrayColor];
    if (cell != nil) {
        if (indexPath.row == 0){
            cell.textLabel.text = @"选择国家";
            cell.detailTextLabel.text = @"中国";
            cell.userInteractionEnabled = NO;
        }else if(indexPath.row == 1){
            cell.textLabel.text = @"选择地区";
            cell.detailTextLabel.text = _area_str;
        }
    }
    return cell;
}

#pragma mark - Table view delegate 点击cell跳转界面
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    // 跳转
    _areaView = [[AreaView alloc]initWithFrame:self.view.bounds];
    [AutoFillScreenUtils autoLayoutFillScreen:_areaView];
    [self.view addSubview:_areaView];

    // 按钮传值事件
    if (indexPath.row == 1) {
        __weak __block AreaViewController * copy_self = self;
        _areaView.block = ^(NSString * str){
            copy_self.area_str = str;
            [copy_self.mytableView reloadData];
        };
    }
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
