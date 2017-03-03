//
//  MJKNearViewController.m
//  mshow
//
//  Created by yjcfxg on 2017/2/8.
//  Copyright © 2017年 yjcfxg. All rights reserved.
//

#import "MJKNearViewController.h"
#import "MJKLiveHandle.h"
#import "MJKNearLiveCollectionViewCell.h"
#import "MJKPlayerViewController.h"
#import "MJRefresh.h"
#import "MJKLivePlayerViewController.h"

static NSString *identifity = @"identifity";
#define KMargin 5
#define KItemWidth 100

@interface MJKNearViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic,strong) NSMutableArray *datalist;

@end

@implementation MJKNearViewController

#pragma 懒加载
- (NSMutableArray *)datalist
{
    if (!_datalist) {
        _datalist = [NSMutableArray array];
    }
    return _datalist;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets=NO;//

    [self initUI];
    [self loadData];
    
    
}
#pragma 初始化UI
- (void)initUI{
    [self.collectionView registerNib:[UINib nibWithNibName:@"MJKNearLiveCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:identifity];
    _collectionView.showsHorizontalScrollIndicator = NO;
    _collectionView.showsVerticalScrollIndicator = NO;
    
    
}


#pragma 加载数据
- (void)loadData{
    
    self.collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        [self getNear];
    }];
    
    [self.collectionView.mj_header beginRefreshing];
    

}
#pragma 获取附近的人数据
- (void)getNear{
    [MJKLiveHandle exeuteGetNearLiveTaskWithSuccess:^(id obj) {
        //        self.datalist = [NSMutableArray arrayWithArray:[self NearWithDataArray:obj]];
        [self.collectionView.mj_header endRefreshing];
        [self.collectionView.mj_footer endRefreshing];
        if (obj!= nil) {
            [self.datalist addObjectsFromArray:obj];
            [self.collectionView reloadData];

        }else{
            [self showHint:@"暂时没有更多最新数据"];
           
        }

    } failed:^(id obj) {
        NSLog(@"%@",obj);
        [self.collectionView.mj_header endRefreshing];
        [self.collectionView.mj_footer endRefreshing];
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

#pragma 逐层解析json数据
- (NSArray *)NearWithDataArray:(NSArray *)arr
{
    NSMutableArray *NearArray = [NSMutableArray array];
    for (NSDictionary *dict in arr) {
        NSDictionary *dic = dict[@"info"];
        [NearArray addObject:dic];
    }
    return NearArray;
}

#pragma UITableview delegate method
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.datalist.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    MJKNearLiveCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifity forIndexPath:indexPath];
    
    cell.live = self.datalist[indexPath.row];
    
    return cell;
}
#pragma cell 的每一项item大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    NSInteger count = self.collectionView.width / KItemWidth;
   CGFloat etraWidth = (self.collectionView.width - KMargin*(count+1))/ count;
    return CGSizeMake(etraWidth, etraWidth+20);
}
#pragma collectionViewDelegate  点击事件
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
//    MJKNearLive *Nearlive = self.datalist[indexPath.row];
    MJKLivePlayerViewController *player = [[MJKLivePlayerViewController alloc] init];
//    MJKPlayerViewController *player = [[MJKPlayerViewController alloc] init];
    player.lives = self.datalist;
    player.currentIndex = indexPath.row;
    [self.navigationController presentViewController:player animated:YES completion:nil];
}


#pragma cell将要显示时调用
- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    MJKNearLiveCollectionViewCell *ce = (MJKNearLiveCollectionViewCell *)cell;
    [ce showAnimation];
}
#pragma 内存警告
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
