//
//  MJKLiveViewCell.h
//  mshow
//
//  Created by yjcfxg on 16/6/23.
//  Copyright © 2016年 yjcfxg. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MJKLive, MJKUser,MJKNearLive;
@interface MJKLiveViewCell : UICollectionViewCell
/** 直播 */
@property (nonatomic, strong) MJKLive *live;

@property (nonatomic ,strong) MJKNearLive *NearLive;
/** 相关的直播或者主播 */
@property (nonatomic, strong) MJKLive *relateLive;

@property (nonatomic,strong) MJKNearLive *relateNearLive;
/** 父控制器 */
@property (nonatomic, weak) UIViewController *parentVc;
/** 点击关联主播 */
@property (nonatomic, copy) void (^clickRelatedLive)();
@end
