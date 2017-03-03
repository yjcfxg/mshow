//
//  MJKLiveHandle.h
//  mshow
//
//  Created by yjcfxg on 2017/2/9.
//  Copyright © 2017年 yjcfxg. All rights reserved.
//

#import "MJKBaseHandle.h"

@interface MJKLiveHandle : MJKBaseHandle


/*
 获取热门直播信息
 
 */
+ (void)exeuteGetHotLiveTaskWithPage:(NSUInteger)page Success:(SuccessBlock)success failed:(FailedBlock)failed;


/*
   获取广告信息
 */

+ (void)exeuteGetADTaskWithSuccess:(SuccessBlock)success failed:(FailedBlock)failed;
/*
 *  获取附近的人
 *
 */

+ (void)exeuteGetNearLiveTaskWithSuccess:(SuccessBlock)success failed:(FailedBlock)failed;

/*
 *   获取广告页
 *
 */

+(void)execteGetAdvertiseTaskWithSuccess:(SuccessBlock)success failed:(FailedBlock)failed;



@end
