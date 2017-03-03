//
//  MJKUser.h
//  mshow
//
//  Created by yjcfxg on 2017/2/24.
//  Copyright © 2017年 yjcfxg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MJKUser : NSObject

@property (nonatomic, strong) NSString * birth;
@property (nonatomic, strong) NSString * description;
@property (nonatomic, strong) NSString * emotion;
@property (nonatomic, assign) NSInteger gender;
@property (nonatomic, assign) NSInteger gmutex;
@property (nonatomic, strong) NSString * hometown;
@property (nonatomic, assign) NSInteger id;
@property (nonatomic, assign) NSInteger inke_verify;
@property (nonatomic, assign) NSInteger level;
@property (nonatomic, strong) NSString * location;
@property (nonatomic, strong) NSString * nick;
@property (nonatomic, strong) NSString * portrait;
@property (nonatomic, strong) NSString * profession;
@property (nonatomic, assign) NSInteger rank_veri;
@property (nonatomic, assign) NSInteger sex;
@property (nonatomic, strong) NSString * third_platform;
@property (nonatomic, strong) NSString * veri_info;
@property (nonatomic, assign) NSInteger verified;
@property (nonatomic, strong) NSString * verified_reason;



@end
