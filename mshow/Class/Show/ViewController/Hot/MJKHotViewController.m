//
//  MJKHotViewController.m
//  mshow
//
//  Created by yjcfxg on 2017/2/8.
//  Copyright © 2017年 yjcfxg. All rights reserved.
//

#import "MJKHotViewController.h"
#import "MJKLiveHandle.h"
#import "MJKLiveTableViewCell.h"
#import "MJKPlayerViewController.h"
#import "HttpTools.h"
#import "MJKADHeaderView.h"
#import "MJKAD.h"
#import "AppDelegate.h"
#import "MJRefresh.h"
#import "MJKLivePlayerViewController.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width

@interface MJKHotViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic ,strong) NSMutableArray *datalist;
@property (nonatomic, retain) NSMutableArray *tempDataArray;

@property(nonatomic ,strong) NSMutableArray *ADList;
@property(nonatomic ,strong) MJKADHeaderView *ADView;
@property(nonatomic ,strong) UIScrollView *scrollView;
@property(nonatomic ,strong) UIPageControl *pageControl;
@property (nonatomic, retain)NSTimer *scrollTimer;
@property (nonatomic,assign) NSUInteger currentPage;

@end

static NSString *identifity = @"identifity";

@implementation MJKHotViewController

#pragma 懒加载
- (NSMutableArray *)datalist
{
    if (!_datalist) {
        _datalist = [NSMutableArray array];
        
    }
    return _datalist;
}

- (NSMutableArray *)tempDataArray
{
    if (!_tempDataArray) {
        _tempDataArray = [NSMutableArray array];
    }
    return _tempDataArray;
}
- (NSMutableArray *)ADList
{
    if (!_ADList) {
        _ADList = [NSMutableArray array];
        
    }
    return _ADList;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];

    
    [self initUI];
    
    [self loadData];

    
//    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:self.datalist.count - 1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
}


#pragma 初始化UI
- (void)initUI{
    [self.tableView registerNib:[UINib nibWithNibName:@"MJKLiveTableViewCell" bundle:nil] forCellReuseIdentifier:identifity];
    self.automaticallyAdjustsScrollViewInsets=NO;//
    
}
#pragma 添加网络广告
- (void)addAD{
    [MJKLiveHandle exeuteGetADTaskWithSuccess:^(id obj) {
        [self.ADList addObjectsFromArray:obj];
        [self.tableView reloadData];
    } failed:^(id obj) {
        NSLog(@"%@",obj);
    }];

}
#pragma 加载数据
- (void)loadData{
    
    self.currentPage = 1;
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.tempDataArray removeAllObjects];
        self.currentPage = 1;
        [self getHotLive:self.currentPage];
    }];
    [self.tableView.mj_header beginRefreshing];
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        self.currentPage++;
        [self getHotLive:self.currentPage];
    }];
    
    
//    self.tableView.tableFooterView = [[UIView alloc] init];
    
}
#pragma 获取热门主播
- (void)getHotLive:(NSUInteger)currentPage
{
    
    [MJKLiveHandle exeuteGetHotLiveTaskWithPage:currentPage Success:^(id obj) {
        
        if (obj!= nil) {
            for (MJKLive *live in obj) {
                if (![self.tempDataArray containsObject:live])
                {
                    [self.tempDataArray addObject:live];
                }
            }
            NSLog(@"%@",self.tempDataArray);
            if (self.tempDataArray.count != 0) {
                //        _allDataArray = _tempDataArray;
                [self.datalist removeAllObjects];
                [self.datalist addObjectsFromArray:_tempDataArray];
                [self.tableView reloadData];
            }
            
        }else{
            [self showHint:@"暂时没有更多最新数据"];
            // 恢复当前页
            self.currentPage--;
        }
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];

    } failed:^(id obj) {
        NSLog(@"%@",obj);
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
        self.currentPage--;
        [self showHint:@"网络异常"];
    }];
    
}
#pragma 提示信息
- (void)showHint:(NSString *)hint
{
    //显示提示信息
    UIView *view = [[UIApplication sharedApplication].delegate window];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.userInteractionEnabled = NO;
    hud.mode = MBProgressHUDModeText;
    hud.label.text = hint;
    hud.margin = 10.f;
    hud.removeFromSuperViewOnHide = YES;
    [hud hideAnimated:YES afterDelay:2];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.datalist.count;
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
#pragma tableview点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    MJKLive *live = self.datalist[indexPath.row];
    /*
     系统自带的播放不了直播视频
     */
    MJKLivePlayerViewController *liveVc = [[MJKLivePlayerViewController alloc] init];
    liveVc.lives = self.datalist;
    liveVc.currentIndex = indexPath.row;
//    MJKPlayerViewController *playerVC = [[MJKPlayerViewController alloc] init];
//    playerVC.live = live;
//    playerVC.hidesBottomBarWhenPushed = YES;//push 时隐藏tabbar
    [self.navigationController presentViewController:liveVc animated:YES completion:nil];
//    [self.navigationController pushViewController:liveVc animated:YES];
    
    
}
#pragma headerView 视图
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    /*
    self.ADView = [[MJKADHeaderView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 150)];
    [MJKLiveHandle exeuteGetADTaskWithSuccess:^(id obj) {
        [self.ADView addADArray:obj];
        
    } failed:^(id obj) {
    }];
    __block MJKHotViewController *wealf = self;
    self.ADView.tapBlock = ^(NSInteger i){
        MJKAD *ad = wealf.ADView.allDataArray[i];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:ad.link]];
        
    };
    
    [self.ADView startScroll];
    return self.ADView;
     */
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 140)];
    
    _scrollView = [[UIScrollView alloc] initWithFrame:headerView.frame];
    _scrollView.delegate = self;
    _scrollView.pagingEnabled = YES;
    [headerView addSubview:_scrollView];
    
    for (int i = 0; i < 4; i++)
    {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(WIDTH * i, 0, WIDTH, 160)];
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg",i+1]];
        [self.scrollView addSubview:imageView];
        
    }
    
    _scrollView.contentSize = CGSizeMake(WIDTH * 4, 0);
    _scrollView.bounces = NO;//去除弹簧效果
    
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 120, WIDTH, 20)];
    _pageControl.numberOfPages = 4;
    _pageControl.backgroundColor = [UIColor clearColor];
    [_pageControl addTarget:self action:@selector(Scroll:) forControlEvents:UIControlEventValueChanged];
    [headerView addSubview:_pageControl];
    
    [self startScroll];
    
    return headerView;
}
#pragma header Height
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return  140;
}


#pragma mark 开始滚动图片
- (void)startScroll
{
    if (_scrollTimer) {
        return;
    }
    self.scrollTimer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
    //防止timer被阻塞
    [[NSRunLoop currentRunLoop] addTimer:self.scrollTimer forMode:NSRunLoopCommonModes];
    
}

#pragma mark 滚动scrollView
- (void)nextImage
{
    int page = (int)self.pageControl.currentPage;
    NSInteger imageCount = 4;
    if (page == imageCount-1) page = 0;
    else page++;
    
    // 滚动scrollview
    [UIView animateWithDuration:.5f animations:^{
        CGFloat x = page * self.scrollView.frame.size.width;
        self.scrollView.contentOffset = CGPointMake(x, 0);
    }];
    /*
     // 计算offset
     CGPoint newOffset = _scrollView.contentOffset;
     newOffset.x += WIDTH;
     // 进行滚动
     [_scrollView setContentOffset:newOffset animated:YES];
     // 锁定控件
     _scrollView.userInteractionEnabled = NO;
     // 调用方法
     [self performSelector:@selector(scrollViewDidScroll:) withObject:_scrollView afterDelay:.5];
     [self performSelector:@selector(unlockUserInteraction:) withObject:_scrollView afterDelay:.51];
     */
}

#pragma 拖拽方法
// 开始拖拽的时候调用
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    // 关闭定时器(注意点; 定时器一旦被关闭,无法再开启)
    [self stopScroll];
    
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    self.scrollTimer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
    //防止timer被阻塞
    [[NSRunLoop currentRunLoop] addTimer:self.scrollTimer forMode:NSRunLoopCommonModes];
}
#pragma mark 停止滚动图片
- (void)stopScroll
{
    [_scrollTimer invalidate];
}

#pragma 内存处理
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma UIScrollViewDelegate method
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    _pageControl.currentPage = scrollView.contentOffset.x /WIDTH;
    /*
    if (scrollView == self.tableView) {
        CGFloat sectionHeaderHeight = 140;
        
        if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
            
            scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
            
        } else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
            
            scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
            
        }
    }
    */
    /*
     UIImageView *imgView = _ImageViewArray[index - 1];
     imgView.frame = CGRectMake((index - 1) *WIDTH, 0, WIDTH, 150);
     imgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld.jpg",index-1]];
     */
    
    //    [self resetFrame];
   
 
    
}

#pragma UIPageControl event  Method
- (void)Scroll:(UIPageControl *)page
{
    //    _scrollView.contentOffset = CGPointMake(page.currentPage * WIDTH, 0);
    [_scrollView setContentOffset:CGPointMake(page.currentPage * WIDTH, 0) animated:YES];
}

@end
