//
//  MJKLiveHandle.m
//  mshow
//
//  Created by yjcfxg on 2017/2/9.
//  Copyright © 2017年 yjcfxg. All rights reserved.
//

#import "MJKLiveHandle.h"
#import "HttpTools.h"
#import "MJKLive.h"
#import "MJKLocationManager.h"
#import "MJKNearLive.h"
#import "MJKAdvertise.h"

@implementation MJKLiveHandle


+ (void)exeuteGetHotLiveTaskWithPage:(NSUInteger)page Success:(SuccessBlock)success failed:(FailedBlock)failed
{
    
    NSDictionary *params = @{@"uid":@"154362385",@"count":@(page * 5)};
    [HttpTools getWithPath:API_HotLive params:params success:^(id json) {
        if ([json[@"dm_error"] integerValue]) {
            failed(json);
        }else{
            //如果返回信息争正确
            NSArray *arr= [MJKLive mj_objectArrayWithKeyValuesArray:json[@"lives"]];
            success(arr);
        }
    } failure:^(NSError *error) {
        failed(error);
    }];
}

+ (void)exeuteGetADTaskWithSuccess:(SuccessBlock)success failed:(FailedBlock)failed
{
    [HttpTools getWithFullPath:API_HotAD params:nil success:^(id json) {
        if (![json[@"msg"] isEqualToString:@"操作成功"]) {
            failed(json);
        }
        //如果返回信息争正确
        NSArray *arr= json[@"data"];
        success(arr);
    } failure:^(NSError *error) {
        failed(error);
    }];
}
+ (void)exeuteGetNearLiveTaskWithSuccess:(SuccessBlock)success failed:(FailedBlock)failed
{
    MJKLocationManager *manager = [MJKLocationManager sharedManager];
    
    NSDictionary *params = @{@"uid":@"154362385",@"latitude":manager.lat,@"longitude":manager.lon};
    [HttpTools getWithPath:API_NearLive params:params success:^(id json) {
        if ([json[@"dm_error"] integerValue]) {
            failed(json);
        }else{
            //如果返回信息争正确
            NSArray *arr= [MJKNearLive mj_objectArrayWithKeyValuesArray:json[@"flow"]];
            //
            success(arr);
            
        }

    } failure:^(NSError *error) {
        failed(error);
    }];
}

+ (void)execteGetAdvertiseTaskWithSuccess:(SuccessBlock)success failed:(FailedBlock)failed
{
    [HttpTools getWithPath:API_Advertise params:nil success:^(id json) {
        if ([json[@"dm_error"] integerValue]) {
            failed(json);
        }else{
            //如果返回信息争正确
           MJKAdvertise *ad = [MJKAdvertise mj_objectWithKeyValues:json[@"resources"][0]];
            //
            success(ad);
            
        }
    } failure:^(NSError *error) {
        failed(error);
    }];
}
@end
