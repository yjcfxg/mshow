//
//  MJKNearLive.h
//  mshow
//
//  Created by yjcfxg on 2017/2/13.
//  Copyright © 2017年 yjcfxg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJKNearLive.h"
#import "MJKInfo.h"

@interface MJKNearLive : NSObject

@property (nonatomic, strong) NSString * flow_type;
@property (nonatomic, strong) MJKInfo * info;

@property(nonatomic,getter=isShow)BOOL show;
@end
