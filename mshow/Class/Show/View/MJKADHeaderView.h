//
//  MJKADHeaderView.h
//  mshow
//
//  Created by yjcfxg on 2017/2/18.
//  Copyright © 2017年 yjcfxg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MJKAD.h"

@interface MJKADHeaderView : UIView

@property (nonatomic, retain) UIScrollView *scrollView;
@property (nonatomic, retain) UIPageControl *pageControl;

@property (nonatomic, retain)NSMutableArray *allDataArray;

@property (nonatomic, copy)void (^tapBlock) (NSInteger);

#pragma mark 添加要显示的广告数据
- (void)addADArray:(NSArray *)arrayOfAD;

#pragma mark 重置UI
- (void)reloadUI;

#pragma mark 调整各控件frame
- (void)resetFrame;

#pragma mark 重载数据
- (void)reloadData;

#pragma mark 开始滚动图片
- (void)startScroll;

#pragma mark 停止滚动图片
- (void)stopScroll;


@end
