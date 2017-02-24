//
//  MJKInfo.h
//  mshow
//
//  Created by yjcfxg on 2017/2/13.
//  Copyright © 2017年 yjcfxg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJKNearCreator.h"
#import "MJKExtra.h"

@interface MJKInfo : NSObject

@property (nonatomic, strong) NSString * city;
@property (nonatomic, strong) MJKNearCreator * creator;
@property (nonatomic, strong) NSString * distance;
@property (nonatomic, assign) NSInteger group;
@property (nonatomic, strong) NSString * id;
@property (nonatomic, assign) NSInteger link;
@property (nonatomic, strong) NSString * live_type;
@property (nonatomic, assign) NSInteger multi;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, assign) NSInteger optimal;
@property (nonatomic, assign) NSInteger rotate;
@property (nonatomic, strong) NSString * share_addr;
@property (nonatomic, assign) NSInteger slot;
@property (nonatomic, strong) NSString * stream_addr;
@property (nonatomic, assign) NSInteger version;
@property (nonatomic, assign) NSInteger landscape;
@property (nonatomic, strong) MJKExtra *extra;

/*
 {
 "flow_type": "live",
 "info": {
 "city": "北京市",
 "creator": {
 "gender": 1,
 "id": 62631418,
 "level": 7,
 "nick": "甭管甭问甭操心",
 "portrait": "http://img2.inke.cn/MTQ4MjcyNTE0NDU3MyM5ODUjanBn.jpg"
 },
 "distance": "4.2km",
 "group": 60,
 "id": "1486621951312660",
 "link": 0,
 "live_type": "",
 "multi": 0,
 "name": "",
 "optimal": 0,
 "rotate": 0,
 "share_addr": "http://mlive3.inke.cn/share/live.html?uid=62631418&liveid=1486621951312660&ctime=1486621951",
 "slot": 5,
 "stream_addr": "http://pull4.a8.com/live/1486621951312660.flv?ikHost=ws&ikOp=1&CodecInfo=8192",
 "version": 0
 }
 },
 */

@end
