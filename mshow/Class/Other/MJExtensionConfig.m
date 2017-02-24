//
//  MJExtensionConfig.m
//  mshow
//
//  Created by yjcfxg on 2017/2/9.
//  Copyright © 2017年 yjcfxg. All rights reserved.
//

#import "MJExtensionConfig.h"
#import "MJKCreator.h"
#import "MJKLive.h"
@implementation MJExtensionConfig

+ (void)load{
    [NSObject mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{
                 @"ID":@"id"
                 };
    }];
    [MJKCreator mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{
                 @"desc":@"description"
                 };
        
    }];
    //驼峰转下划线
    [MJKCreator mj_setupReplacedKeyFromPropertyName121:^id(NSString *propertyName) {
        return [propertyName mj_underlineFromCamel];
    }];
    [MJKLive mj_setupReplacedKeyFromPropertyName121:^id(NSString *propertyName) {
        return [propertyName mj_underlineFromCamel];
    }];

}

@end
