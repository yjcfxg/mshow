//
//  MJKMeTableViewController.m
//  mshow
//
//  Created by yjcfxg on 2017/2/17.
//  Copyright © 2017年 yjcfxg. All rights reserved.
//

#import "MJKMeTableViewController.h"
#import "MJKMeView.h"
#import "MJKSetting.h"

@interface MJKMeTableViewController ()


@property(nonatomic,strong) NSArray *datalist;
@property(nonatomic,strong) MJKMeView *meView;

@end

@implementation MJKMeTableViewController

- (NSArray *)datalist
{
    if (!_datalist) {
        _datalist = [NSArray array];
        
    }
    return _datalist;
}

- (MJKMeView *)meView
{
    if (!_meView) {
        _meView = [MJKMeView loadMeView];
    }
    return _meView;
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 50;
    //修改状态栏
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self loadData];
    
}

- (void)loadData{
    MJKSetting *set = [[MJKSetting alloc] init];
    set.title=@"直播贡献榜";
    set.subTitle = @"";
    set.VCName = @"MJKGongViewController";
    
    MJKSetting *set1 = [[MJKSetting alloc] init];
    set1.title=@"收益";
    set1.subTitle = @"0 映票";
    set1.VCName = @"MJKShowViewController";
    
    MJKSetting *set2 = [[MJKSetting alloc] init];
    set2.title=@"账户";
    set2.subTitle = @"0 钻石";
    set2.VCName = @"MJKZuaniewController";

    MJKSetting *set3 = [[MJKSetting alloc] init];
    set3.title=@"等级";
    set3.subTitle = @"3 级";
    set3.VCName = @"MJKDengViewController";
    
    MJKSetting *set4 = [[MJKSetting alloc] init];
    set4.title=@"设置";
    set4.subTitle = @"";
    set4.VCName = @"MJKSettingViewController";
    
    NSArray *arr1 = @[set,set1,set2];
    NSArray *arr2 = @[set3];
    NSArray *arr3 = @[set4];
    self.datalist = @[arr1,arr2,arr3];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.datalist.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *arr = self.datalist[section];
    return arr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
    
    MJKSetting *set = self.datalist[indexPath.section][indexPath.row];
    cell.textLabel.text = set.title;
    cell.detailTextLabel.text = set.subTitle;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return self.meView;
    }
    return nil;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return kScreenHeight *0.5;
    }
    return 5;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    
    
    return nil;
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
