//
//  MJKBottomToolView.h
//  mshow
//
//  Created by yjcfxg on 16/6/16.
//  Copyright © 2016年 yjcfxg. All rights reserved.
//  直播间底部的工具栏

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, LiveToolType) {
    LiveToolTypePublicTalk,
    LiveToolTypeRank,
    LiveToolTypePrivateTalk,
    LiveToolTypeGift,
    LiveToolTypeShare,
    LiveToolTypeClose
};

@interface MJKBottomToolView : UIView
/** 点击工具栏  */
@property(nonatomic, copy)void (^clickToolBlock)(LiveToolType type);
@end
