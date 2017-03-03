//
//  MJKLivePlayerViewController.m
//  mshow
//
//  Created by yjcfxg on 2017/2/24.
//  Copyright © 2017年 yjcfxg. All rights reserved.
//

#import "MJKLivePlayerViewController.h"
#import "MJKLiveViewCell.h"
#import "MJKRefreshGifHeader.h"
#import "MJKLiveFlowLayout.h"
#import "MJKLive.h"
#import "MJKUserView.h"


@interface MJKLivePlayerViewController ()

/** 用户信息 */
@property (nonatomic, weak) MJKUserView *userView;

@end

@implementation MJKLivePlayerViewController

static NSString * const reuseIdentifier = @"MJKLiveViewCell";

- (instancetype)init
{
    return [super initWithCollectionViewLayout:[[MJKLiveFlowLayout alloc] init]];
    
}

- (MJKUserView *)userView
{
    if (!_userView) {
        MJKUserView *userView = [MJKUserView userView];
        [self.collectionView addSubview:userView];
        _userView = userView;
        
        [userView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(@0);
            make.width.equalTo(@(KSCREEN_WIDTH));
            make.height.equalTo(@(kSCREEN_HEIGHT));
        }];
        userView.transform = CGAffineTransformMakeScale(0.01, 0.01);
        [userView setCloseBlock:^{
            [UIView animateWithDuration:0.5 animations:^{
                self.userView.transform = CGAffineTransformMakeScale(0.01, 0.01);
            } completion:^(BOOL finished) {
                [self.userView removeFromSuperview];
                self.userView = nil;
            }];
        }];
        
    }
    return _userView;
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    self.navigationController.navigationBarHidden = YES;
    // 1 B pop 回到 A 时，不会出现黑色区域，但可能会出现抖动情况
    //    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
    // 2 B pop 回到 A 时，会出现黑色区域，但不会出现抖动情况
    //    [self.navigationController setNavigationBarHidden:YES animated:NO];
    
    // 3 B pop 回到 A 时，不会出现黑色区域，也不会出现抖动情况
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    self.automaticallyAdjustsScrollViewInsets = NO;
//    self.automaticallyAdjustsScrollViewInsets = YES;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerClass:[MJKLiveViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    MJKRefreshGifHeader *header = [MJKRefreshGifHeader headerWithRefreshingBlock:^{
        [self.collectionView.mj_header endRefreshing];
        self.currentIndex++;
        if (self.currentIndex == self.lives.count) {
            self.currentIndex = 0;
        }
        [self.collectionView reloadData];
    }];
    header.stateLabel.hidden = NO;
    [header setTitle:@"下拉切换另一个主播" forState:MJRefreshStatePulling];
    [header setTitle:@"下拉切换另一个主播" forState:MJRefreshStateIdle];
    self.collectionView.mj_header = header;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(clickUser:) name:kNotifyClickUser object:nil];
}

- (void)clickUser:(NSNotification *)notify
{
    if (notify.userInfo[@"user"] != nil) {
        MJKUser *user = notify.userInfo[@"user"];
        self.userView.user = user;
        [UIView animateWithDuration:0.5 animations:^{
            self.userView.transform = CGAffineTransformIdentity;
        }];
    }
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MJKLiveViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.parentVc = self;
    if ([self.lives[self.currentIndex] isKindOfClass:[MJKLive class]]) {
        cell.live = self.lives[self.currentIndex];
    }else{
    
    cell.NearLive = self.lives[self.currentIndex];
    }
    NSUInteger relateIndex = self.currentIndex;
    if (self.currentIndex + 1 == self.lives.count) {
        relateIndex = 0;
    }else{
        relateIndex += 1;
    }
    if ([self.lives[self.currentIndex] isKindOfClass:[MJKLive class]]) {
        cell.relateLive = self.lives[relateIndex];
    }else{
        cell.relateNearLive = self.lives[relateIndex];
    }
    
    [cell setClickRelatedLive:^{
        self.currentIndex += 1;
        [self.collectionView reloadData];
    }];
    return cell;
}

#pragma mark <UICollectionViewDelegate>
#pragma mark <UICollectionViewDataSource>

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
