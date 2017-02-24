//
//  MJKADHeaderView.m
//  mshow
//
//  Created by yjcfxg on 2017/2/18.
//  Copyright © 2017年 yjcfxg. All rights reserved.
//

#import "MJKADHeaderView.h"
#import "UIImageView+SDWebImage.h"
#import "UIImageView+WebCache.h"
#define kFrameOfImageView(index) CGRectMake(index * self.frame.size.width, 0, _scrollView.frame.size.width, _scrollView.frame.size.height)
#define kFrameOfPageControl CGRectMake(0, _scrollView.frame.size.height -20, _scrollView.frame.size.width, 20)
@interface MJKADHeaderView()<UIScrollViewDelegate>

@property (nonatomic, retain)NSTimer *scrollTimer;

@end
@implementation MJKADHeaderView


#pragma mark 指定初始化方法
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self addAllViews];
        
        self.allDataArray = [NSMutableArray array];
    }
    return self;
}

#pragma mark 添加所有视图
- (void)addAllViews
{
    // 1. scrollView
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 150)] ;
    _scrollView.pagingEnabled = YES;
    _scrollView.contentSize = CGSizeZero;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.delegate = self;
    [self addSubview:_scrollView];
    
    
    // 3. pageControl
    self.pageControl = [[UIPageControl alloc] initWithFrame: CGRectMake(0,120, self.frame.size.width, 30)];
    _pageControl.hidesForSinglePage = YES;
    _pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
    _pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    
    [self addSubview:_pageControl];
    
   
}
#pragma mark 添加要新的新闻数据
- (void)addADArray:(NSArray *)arrayOfAD
{
    [_allDataArray addObjectsFromArray:arrayOfAD];
    [self reloadData];
    [self reloadUI];
}

#pragma mark 重载数据
- (void)reloadData
{
    // 清除之前添加的imageView
    for (UIView *subView in _scrollView.subviews) {
        [subView removeFromSuperview];
    }

    for (int i = 0; i < _allDataArray.count; i++) {
        // 拿到ad
        MJKAD *ad = _allDataArray[i];
        
        [self addImageViewOnScrollViewAtIndex:i withAD:ad];
    }
    
}
#pragma mark tapGR
- (void)tapGRAction:(UITapGestureRecognizer *)sender
{
    NSInteger index = _scrollView.contentOffset.x / self.frame.size.width;
    if (_tapBlock){
        self.tapBlock(index);
    }
}

#pragma mark 重置UI
- (void)reloadUI
{
    // 重置UI
    [self resetFrame];
    [_scrollView setContentOffset:CGPointMake(self.frame.size.width, 0) animated:NO];
    _scrollView.contentSize = CGSizeMake(self.frame.size.width * _allDataArray.count, 0);
    _pageControl.numberOfPages = _allDataArray.count;
    _pageControl.currentPage = 0;
    [self resetFrame];
}

#pragma mark 调整各控件frame
- (void)resetFrame
{
    _scrollView.frame = self.frame;

    _pageControl.frame = kFrameOfPageControl;
    //    _button.frame = self.bounds;
    
    // scrollView subViews
    NSArray *subViewsArr = _scrollView.subviews;
    for (int i = 0; i < subViewsArr.count; i++) {
        UIImageView *imageView = subViewsArr[i];
        imageView.frame = kFrameOfImageView(i);
    }
}



#pragma mark 在指定offsetX创建ImageView并显示图片
- (UIImageView *)addImageViewOnScrollViewAtIndex:(NSInteger)index
                                        withAD:(MJKAD *)ad
{
    // 创建添加ImageView
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:kFrameOfImageView(index)] ;
    imageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGRAction:)];
    [imageView addGestureRecognizer:tapGR];
    [_scrollView addSubview:imageView];
    
    // 显示图片
    [imageView sd_setImageWithURL:[NSURL URLWithString:ad.imageUrl] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        imageView.image = image;
    }];
//    [imageView downloadImage:ad.imageUrl placeholder:@"placeholder_head"];
    return imageView;
}


#pragma mark 开始滚动图片
- (void)startScroll
{
    if (_scrollTimer) {
        return;
    }
    self.scrollTimer = [NSTimer scheduledTimerWithTimeInterval:8 target:self selector:@selector(scrollScrollView) userInfo:nil repeats:YES];
}

#pragma mark 滚动scrollView
- (void)scrollScrollView
{
    // 计算offset
    CGPoint newOffset = _scrollView.contentOffset;
    newOffset.x += self.frame.size.width;
    // 进行滚动
    [_scrollView setContentOffset:newOffset animated:YES];
    // 锁定控件
    _scrollView.userInteractionEnabled = NO;
    // 调用方法
    [self performSelector:@selector(scrollViewDidEndDecelerating:) withObject:_scrollView afterDelay:.5];
    [self performSelector:@selector(unlockUserInteraction:) withObject:_scrollView afterDelay:.51];
}

#pragma mark 解锁控件
- (void)unlockUserInteraction:(UIView *)view
{
    view.userInteractionEnabled = YES;
}

#pragma mark 停止滚动图片
- (void)stopScroll
{
    [_scrollTimer invalidate];
}

#pragma mark - UIScrollViewDelegateMethods
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    // 计算出当前显示的News的index
    NSUInteger index = scrollView.contentOffset.x / self.frame.size.width;
    
    // 如果向右滑回到了第一张
    if (index == _allDataArray.count + 1) {
        // 跳回到第一张
        _scrollView.contentOffset = CGPointMake(self.frame.size.width, 0);
        index = 1;
    }
    
    // 如果向左从第一张滑到了最后一张
    if (index == 0 || index > _allDataArray.count + 1) {
        
        _scrollView.contentOffset = CGPointMake((_allDataArray.count) * self.frame.size.width, 0);
        index = _allDataArray.count;
        
    }
    
    _pageControl.currentPage = index - 1;
   
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_scrollTimer invalidate];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.scrollTimer = [NSTimer scheduledTimerWithTimeInterval:8 target:self selector:@selector(scrollScrollView) userInfo:nil repeats:YES];
}


@end
