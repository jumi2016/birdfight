//
//  MinePipeiTableViewController.m
//  BirdFight
//
//  Created by 聚米 on 16/11/11.
//  Copyright © 2016年 聚米. All rights reserved.
//

#import "MinePipeiTableViewController.h"
#import "UITableViewCell+Bird.h"
#import "MinePipeiCell.h"
#import "LikeModel.h"

@interface MinePipeiTableViewController ()<UITableViewCellDelegate>

@property (nonatomic, strong) NSMutableArray * like_arr;

@end

@implementation MinePipeiTableViewController

//测试数据
-(void)loadData
{
    LikeModel * model_1 = [[LikeModel alloc]init];
    model_1.type = @"tolike";
    model_1.uid = @"碧瑶";
    model_1.headImage = [UIImage imageNamed:@"1.jpg"];
    model_1.name = @"碧瑶";
    model_1.sex = @"女";
    model_1.age = @"26";
    model_1.time = @"2016-10-27 8:41:23";
    model_1.distance = @"1.5km";
    [_like_arr addObject:model_1];
    
    LikeModel * model_2 = [[LikeModel alloc]init];
    model_2.type = @"fromlike";
    model_2.uid = @"陆雪琪";
    model_2.headImage = [UIImage imageNamed:@"2.jpg"];
    model_2.name = @"陆雪琪";
    model_2.sex = @"女";
    model_2.age = @"26";
    model_2.time = @"2016-10-27 6:41:23";
    model_2.distance = @"1.5km";
    [_like_arr addObject:model_2];
    
    LikeModel * model_3 = [[LikeModel alloc]init];
    model_3.type = @"fromlike";
    model_3.uid = @"林惊羽";
    model_3.headImage = [UIImage imageNamed:@"6.jpg"];
    model_3.name = @"林惊羽";
    model_3.sex = @"男";
    model_3.age = @"24";
    model_3.time = @"2016-10-26 20:41:23";
    model_3.distance = @"1.5km";
    [_like_arr addObject:model_3];
    
    LikeModel * model_4 = [[LikeModel alloc]init];
    model_4.type = @"tolike";
    model_4.uid = @"小环";
    model_4.headImage = [UIImage imageNamed:@"7.jpg"];
    model_4.name = @"小环";
    model_4.sex = @"女";
    model_4.age = @"20";
    model_4.time = @"2016-10-25 17:41:23";
    model_4.distance = @"1.5km";
    [_like_arr addObject:model_4];
    for (int i = 0; i<20; i++) {
        [_like_arr addObject:model_1];
        [_like_arr addObject:model_2];
        [_like_arr addObject:model_3];
        [_like_arr addObject:model_4];
    }
}

#pragma mark 视图出现
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    // 导航栏
    self.navigationController.navigationBar.hidden = NO;
    self.title = @"我的匹配";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _like_arr = [NSMutableArray array];
    
    
    // 加载虚拟数据
    [self loadData];
    
    
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    // 注册xibcell
    [self.tableView registerNib:[UINib nibWithNibName:@"MinePipeiCell" bundle:nil] forCellReuseIdentifier:@"mine"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 点击头像
-(void)didTapHeadImageButton:(NSString *)uid
{
    NSLog(@"点击了头像===%@",uid);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.like_arr.count;
}

#pragma mark 行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 40;
    return self.tableView.rowHeight;
 
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MinePipeiCell * cell = [self.tableView dequeueReusableCellWithIdentifier:@"mine"];
    
    LikeModel * model = _like_arr[indexPath.row];
    
    [cell setCellInfo:model];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

#pragma mark cell编辑
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"删除";
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    LikeModel * model = _like_arr[indexPath.row];
    [_like_arr removeObject:model];
    [self.tableView reloadData];
    
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        // Delete the row from the data source
//        
//        LikeModel * model = _like_arr[indexPath.row];
//        [_like_arr removeObject:model];
//        [self.tableView reloadData];
//        
//    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
//        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//    }   
}



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
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
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
