//
//  MJKNearCreator.h
//  mshow
//
//  Created by yjcfxg on 2017/2/13.
//  Copyright © 2017年 yjcfxg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MJKNearCreator : NSObject


@property (nonatomic, assign) NSInteger gender;
@property (nonatomic, assign) NSInteger idField;
@property (nonatomic, assign) NSInteger level;
@property (nonatomic, strong) NSString * nick;
@property (nonatomic, strong) NSString * portrait;
/*
"creator": {
    "gender": 1,
    "id": 62631418,
    "level": 7,
    "nick": "甭管甭问甭操心",
    "portrait": "http://img2.inke.cn/MTQ4MjcyNTE0NDU3MyM5ODUjanBn.jpg"
},
 */
@end
