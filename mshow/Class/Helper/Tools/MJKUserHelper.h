//
//  MJKUserHelper.h
//  mshow
//
//  Created by yjcfxg on 2017/2/17.
//  Copyright © 2017年 yjcfxg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MJKUserHelper : NSObject


@property(nonatomic,copy) NSString *imgUrl;
@property(nonatomic,copy) NSString *nickName;

+(instancetype)shareUser;

+(BOOL)isAutoLogin;

+(void)saveUser;

@end
