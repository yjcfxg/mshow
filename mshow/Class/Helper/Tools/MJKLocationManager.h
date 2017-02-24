//
//  MJKLocationManager.h
//  mshow
//
//  Created by yjcfxg on 2017/2/13.
//  Copyright © 2017年 yjcfxg. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^LocationBlock)(NSString *lat,NSString *lon);
@interface MJKLocationManager : NSObject


@property (nonatomic,copy) NSString *lat;
@property(nonatomic,copy) NSString *lon;
+(instancetype)sharedManager;

- (void)getGps:(LocationBlock)block;

@end
