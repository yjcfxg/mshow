//
//  MJKFocuseViewController.m
//  mshow
//
//  Created by yjcfxg on 2017/2/8.
//  Copyright © 2017年 yjcfxg. All rights reserved.
//

#import "MJKFocuseViewController.h"

#import "MJKLiveHandle.h"
#import "MJKLiveTableViewCell.h"
#import "MJKPlayerViewController.h"

@interface MJKFocuseViewController ()

@property(nonatomic ,strong) NSArray *datalist;

@end

static NSString *identifity = @"focuse";
@implementation MJKFocuseViewController

- (NSArray *)datalist
{
    if (!_datalist) {
        _datalist = [NSArray array];
        
    }
    return _datalist;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    
    [self loadData];
    // Do any additional setup after loading the view from its nib.
}

- (void)loadData{
    MJKLive *live = [MJKLive new];
    live.city = @"北京市";
    live.onlineUsers = 100;
    MJKCreator *creator = [MJKCreator new];
    live.creator = creator;
    creator.nick = @"雨嫣";
    creator.portrait = @"focuse";
    self.datalist = @[live];
    [self.tableView reloadData];
}
/**
 
 */
- (void)initUI{
    [self.tableView registerNib:[UINib nibWithNibName:@"MJKLiveTableViewCell" bundle:nil] forCellReuseIdentifier:identifity];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MJKLiveTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifity];
    
    cell.live = self.datalist[indexPath.row];
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70+KSCREEN_WIDTH;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    MJKLive *live = self.datalist[indexPath.row];
    /*
     系统自带的播放不了直播视频
     */
    MJKPlayerViewController *playerVC = [[MJKPlayerViewController alloc] init];
    playerVC.live = live;
    //    playerVC.hidesBottomBarWhenPushed = YES;//push 时隐藏tabbar
    [self.navigationController pushViewController:playerVC animated:YES];
    
    
}

@end
