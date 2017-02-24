//
//  MJKUserHelper.m
//  mshow
//
//  Created by yjcfxg on 2017/2/17.
//  Copyright © 2017年 yjcfxg. All rights reserved.
//

#import "MJKUserHelper.h"

@implementation MJKUserHelper

+ (instancetype)shareUser
{
    static MJKUserHelper *user = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        user = [[MJKUserHelper alloc] init];
    });
    return user;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        _imgUrl = [[NSUserDefaults standardUserDefaults] objectForKey:@"imgUrl"];
        _nickName = [[NSUserDefaults standardUserDefaults] objectForKey:@"nickName"];
    }
    return self;
}
+(BOOL)isAutoLogin
{
    if ([MJKUserHelper shareUser].nickName.length == 0) {
        return NO;
    }
    return YES;
}

+ (void)saveUser
{
    MJKUserHelper *user = [MJKUserHelper shareUser];
    if (user.nickName.length != 0) {
        [[NSUserDefaults standardUserDefaults] setObject:user.nickName forKey:@"nickName"];
        [[NSUserDefaults standardUserDefaults] setObject:user.imgUrl forKey:@"imgUrl"];

    }
    }
@end
