//
//  MJKMainViewController.m
//  mshow
//
//  Created by yjcfxg on 2017/2/7.
//  Copyright © 2017年 yjcfxg. All rights reserved.
//

#import "MJKMainViewController.h"
#import "MJKMainTopView.h"
#import "ALinWebViewController.h"
#import "MJKSearchViewController.h"

@interface MJKMainViewController ()<UIScrollViewDelegate>
@property (strong, nonatomic) IBOutlet UIScrollView *contentScrollView;
@property(nonatomic,strong) NSArray *dataList;
@property(nonatomic,strong) MJKMainTopView *topView;

@end

@implementation MJKMainViewController

- (NSArray *)dataList{
    if (!_dataList) {
        _dataList = @[@"关注",@"热门",@"附近"];
    }
    return _dataList;
}

- (MJKMainTopView *)topView
{
    if (!_topView) {
        _topView = [[MJKMainTopView alloc] initWithFrame:CGRectMake(0, 0, 200, 50) titleNames:self.dataList];
        @weakify(self);
        _topView.mainBlock=^(NSUInteger tag){
                    @strongify(self)
                    CGPoint point = CGPointMake(tag * kScreenWidth, self.contentScrollView.contentOffset.y);

            [self.contentScrollView setContentOffset:point animated:YES];
        };
    }
    return _topView;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initUI];
}
- (void)initUI
{
    [self setupNav];
    self.contentScrollView.bounces = NO;
    //添加子视图控制器
    [self setupChildViewControllers];
    
}
- (void)setupNav
{
    self.navigationItem.titleView = self.topView;
    self.navigationItem.leftBarButtonItem= [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"search_15x14"] style:UIBarButtonItemStylePlain target:self action:@selector(search)];
    self.navigationItem.rightBarButtonItem= [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"head_crown_24x24"] style:UIBarButtonItemStylePlain target:self action:@selector(rankCrown)];
  
}

#pragma mark ---- <push搜索栏>
- (void)search {
    MJKSearchViewController *searchVc = [[MJKSearchViewController alloc] init];
    
    [self.navigationController pushViewController:searchVc animated:YES];
}

- (void)rankCrown
{
    ALinWebViewController *web = [[ALinWebViewController alloc] initWithUrlStr:@"http://live.9158.com/Rank/WeekRank?Random=10"];
    web.navigationItem.title = @"排行";
    [self.navigationController pushViewController:web animated:YES];
}

- (void)setupChildViewControllers
{
    NSArray *VCNames= @[@"MJKFocuseViewController",@"MJKHotViewController",@"MJKNearViewController"];
    for (NSUInteger i = 0; i<[VCNames count]; i++) {
        NSString *vcname = VCNames[i];
        UIViewController *vc= [[NSClassFromString(vcname) alloc] init];
//        vc.view.frame = CGRectMake(0, 0, KSCREEN_WIDTH, kSCREEN_HEIGHT - 49);
        vc.title =self.dataList[i];
        //当执行这句话addchild时，不会执行该vc的ViewDidLoad
        [self addChildViewController:vc];
    }
    //将子控制器的view，加到mainViewcontroller的scrollview
    
    //设置scrollview的contentSize
    self.contentScrollView.contentSize =CGSizeMake(KSCREEN_WIDTH*[self.dataList count], 0);
    self.contentScrollView.bounces =NO;//取消回弹效果
    //默认先展示第二个页面
    self.contentScrollView.contentOffset = CGPointMake(KSCREEN_WIDTH, 0);
    //进入主控制器加载第一个页面
    //self.contentScrollView.delegate =self;
    [self scrollViewDidEndDecelerating:self.contentScrollView];
    
}

//动画结束调用
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    [self scrollViewDidEndDecelerating:scrollView];
    /*
    //
    CGFloat width = KSCREEN_WIDTH;//scrollView.frame.size.width;
    CGFloat height = kSCREEN_HEIGHT;
    CGFloat offset = scrollView.contentOffset.x;
    //获取索引值
    NSUInteger idx = offset/ width;
    //索引值联动topview
    [self.topView scrolling:idx];
    //根据索引值返回引用
    UIViewController *vc = self.childViewControllers[idx];
    //判断当前vc是否执行过viewdidload
    if ([vc isViewLoaded]) {
        return;
    }
    //设置子控制器的view大小
    vc.view.frame = CGRectMake(offset, 0, scrollView.frame.size.width, height);
    //将子视图控制器的view加入scrollview上
    [scrollView addSubview:vc.view];
     */
}

//减速结束时调用加载子控制器view的方法
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
//    [self scrollViewDidEndDecelerating:scrollView];
    
    //
    CGFloat width = KSCREEN_WIDTH;//scrollView.frame.size.width;
    CGFloat height = kSCREEN_HEIGHT;
    CGFloat offset = scrollView.contentOffset.x;
    //获取索引值
    NSUInteger idx = offset/ width;
    //索引值联动topview
    [self.topView scrolling:idx];
    //根据索引值返回vc引用controller
    UIViewController *vc = self.childViewControllers[idx];
    
    
    //判断当前vc是否执行过viewdidload
    if ([vc isViewLoaded]) {
        return;
    }
    //设置子控制器的view大小
    vc.view.frame = CGRectMake(offset, 0, scrollView.frame.size.width, height - 74);
    //将子视图控制器的view加入scrollview上
    [scrollView addSubview:vc.view];
    
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
