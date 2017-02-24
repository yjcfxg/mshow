//
//  MJKLive.h
//  mshow
//
//  Created by yjcfxg on 2017/2/9.
//  Copyright © 2017年 yjcfxg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJKCreator.h"

@interface MJKLive : NSObject
@property (nonatomic, strong) NSString * city;
@property (nonatomic, strong) MJKCreator * creator;
@property (nonatomic, assign) NSInteger group;
@property (nonatomic, strong) NSString * id;
@property (nonatomic, strong) NSString * image;
@property (nonatomic, assign) NSInteger link;
@property (nonatomic, strong) NSString * liveType;
@property (nonatomic, assign) NSInteger multi;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, assign) NSInteger onlineUsers;
@property (nonatomic, assign) NSInteger optimal;
@property (nonatomic, assign) NSInteger pubStat;
@property (nonatomic, assign) NSInteger roomId;
@property (nonatomic, assign) NSInteger rotate;
@property (nonatomic, strong) NSString * shareAddr;
@property (nonatomic, assign) NSInteger slot;
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, strong) NSString * streamAddr;
@property (nonatomic, assign) NSInteger tagId;
@property (nonatomic, strong) NSString * token;
@property (nonatomic, assign) NSInteger version;






@end
