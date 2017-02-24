//
//  MJKLocationManager.m
//  mshow
//
//  Created by yjcfxg on 2017/2/13.
//  Copyright © 2017年 yjcfxg. All rights reserved.
//

#import "MJKLocationManager.h"
#import <CoreLocation/CoreLocation.h>

static MJKLocationManager *manager;
@interface MJKLocationManager()<CLLocationManagerDelegate>
@property(nonatomic,strong) CLLocationManager *locManager;
@property (nonatomic,copy) LocationBlock block;

@end

@implementation MJKLocationManager

#pragma single
+(instancetype)sharedManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[MJKLocationManager alloc] init];
    });
    return manager;
}
#pragma 初始化方法
- (instancetype)init
{
    self = [super init];
    if (self) {
        _locManager = [[CLLocationManager alloc] init];
        [_locManager setDesiredAccuracy:kCLLocationAccuracyBest];
        _locManager.distanceFilter =100;//100 米范围内
        _locManager.delegate = self;
        
        if (![CLLocationManager locationServicesEnabled]) {
            NSLog(@"kaiqifuwu");
        }else{
            //定位状态
            CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
            if (status == kCLAuthorizationStatusNotDetermined) {
                [_locManager requestWhenInUseAuthorization];
               
            }
        }
    }
    return self;
}


#pragma cllocationDelegate

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(nonnull CLLocation *)newLocation fromLocation:(nonnull CLLocation *)oldLocation{
    CLLocationCoordinate2D coor = newLocation.coordinate;
    NSString *lat = [NSString stringWithFormat:@"%@",@(coor.latitude)];
    NSString *lon = [NSString stringWithFormat:@"%@",@(coor.longitude)];
    [MJKLocationManager sharedManager].lat = lat;
    [MJKLocationManager sharedManager].lon = lon;
    self.block(lat,lon);
    [self.locManager stopUpdatingLocation];
}

- (void)getGps:(LocationBlock)block
{
    self.block= block;
    [self.locManager startUpdatingLocation];
}
@end
