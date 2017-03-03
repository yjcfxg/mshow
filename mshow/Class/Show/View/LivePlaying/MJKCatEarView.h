//
//  MJKCatEarView.h
//  mshow
//
//  Created by ALin on 16/6/17.
//  Copyright © 2016年 yjcfxg. All rights reserved.
//  同一个工会的主播

#import <UIKit/UIKit.h>

@class MJKLive,MJKNearLive;
@interface MJKCatEarView : UIView
/** 主播/主播 */
@property(nonatomic, strong) MJKLive *live;

@property(nonatomic ,strong) MJKNearLive *nearLive;

+ (instancetype)catEarView;
@end
