//
//  MJKUserView.h
//  mshow
//
//  Created by yjcfxg on 16/6/28.
//  Copyright © 2016年 yjcfxg. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MJKUsers;
@interface MJKUserView : UIView
+ (instancetype)userView;
/** 点击关闭 */
@property (nonatomic, copy) void (^closeBlock)();
/** 用户信息 */
@property (nonatomic, strong) MJKUsers *user;
@end
