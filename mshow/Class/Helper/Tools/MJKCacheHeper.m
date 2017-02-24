//
//  MJKCacheHeper.m
//  mshow
//
//  Created by yjcfxg on 2017/2/15.
//  Copyright © 2017年 yjcfxg. All rights reserved.
//

#import "MJKCacheHeper.h"

#define adVImage @"adImage"
@implementation MJKCacheHeper

+(NSString *)getAdVersite
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:adVImage];
    
}
+(void)setAdvertise:(NSString *)adImage{
    [[NSUserDefaults standardUserDefaults] setObject:adImage forKey:adVImage];
    //同步huancun
    [[NSUserDefaults standardUserDefaults] synchronize];

}
@end
