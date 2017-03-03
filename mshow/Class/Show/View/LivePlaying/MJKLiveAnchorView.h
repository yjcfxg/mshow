//
//  MJKLiveAnchorView.h
//  mshow
//
//  Created by yjcfxg on 16/6/16.
//  Copyright © 2016年 yjcfxg. All rights reserved.
//  直播间主播相关的视图

#import <UIKit/UIKit.h>

@class MJKLive;
@class MJKUser;
@class MJKNearLive;
@interface MJKLiveAnchorView : UIView
+ (instancetype)liveAnchorView;
/** 主播 */
@property(nonatomic, strong) MJKUser *user;
/** 直播 */
@property(nonatomic, strong) MJKLive *live;

@property(nonatomic,strong) MJKNearLive *nearLive;
//直播用户数组
@property (strong, nonatomic) NSArray *chaoYangUsers;

/** 点击开关  */
@property(nonatomic, copy)void (^clickDeviceShow)(bool selected);
@end
