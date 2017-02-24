//
//  MJKTabBar.h
//  mshow
//
//  Created by yjcfxg on 2017/2/7.
//  Copyright © 2017年 yjcfxg. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSUInteger,MJKItemType) {
    MJKItemTypeLanuch = 10,//   启动直播
    MJKItemTypeLive = 100,//展示直播
    MJKItemMe,// 我的
};

@class MJKTabBar;

typedef void(^TabBlock)(MJKTabBar *tabBar,MJKItemType) ;



@protocol MJKTabBarDelegate <NSObject>

- (void)tabbar:(MJKTabBar *)tabbar clickButton:(NSUInteger)index;

@end

@interface MJKTabBar : UIView


@property(nonatomic, weak)id<MJKTabBarDelegate>delegate;
@property(nonatomic ,copy) TabBlock block;

@end
