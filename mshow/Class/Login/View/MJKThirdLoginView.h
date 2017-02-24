//
//  MJKThirdLoginView.h
//  mshow
//
//  Created by yjcfxg on 2017/2/10.
//  Copyright © 2017年 yjcfxg. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, LoginType) {
    LoginTypeSina,
    LoginTypeQQ,
    LoginTypeWechat
};
@interface MJKThirdLoginView : UIView

/** 点击按钮 */
@property (nonatomic, copy) void (^clickLogin)(LoginType type);

@end
