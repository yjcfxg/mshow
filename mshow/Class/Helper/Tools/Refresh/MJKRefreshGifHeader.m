//
//  MJKRefreshGifHeader.m
//  mshow
//
//  Created by yjcfxg on 16/6/14.
//  Copyright © 2016年 yjcfxg. All rights reserved.
//

#import "MJKRefreshGifHeader.h"

@implementation MJKRefreshGifHeader

- (instancetype)init
{
    if (self = [super init]) {
        self.lastUpdatedTimeLabel.hidden = YES;
        self.stateLabel.hidden = YES;
        [self setImages:@[[UIImage imageNamed:@"reflesh1_60x55"], [UIImage imageNamed:@"reflesh2_60x55"], [UIImage imageNamed:@"reflesh3_60x55"]]  forState:MJRefreshStateRefreshing];
        [self setImages:@[[UIImage imageNamed:@"reflesh1_60x55"], [UIImage imageNamed:@"reflesh2_60x55"], [UIImage imageNamed:@"reflesh3_60x55"]]  forState:MJRefreshStatePulling];
        [self setImages:@[[UIImage imageNamed:@"reflesh1_60x55"], [UIImage imageNamed:@"reflesh2_60x55"], [UIImage imageNamed:@"reflesh3_60x55"]]  forState:MJRefreshStateIdle];
    }
    return self;
}

@end
