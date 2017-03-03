//
//  AppDelegate.m
//  mshow
//
//  Created by yjcfxg on 2017/2/7.
//  Copyright © 2017年 yjcfxg. All rights reserved.
//

#import "AppDelegate.h"
#import "MJKTabBarViewController.h"
#import "MJKLoginViewController.h"
#import "MJKLocationManager.h"
#import "MJKAdvertiseView.h"
#import "AppDelegate+MJKUMeung.h"
//#import <UMSocialCore/UMSocialCore.h>
#import "MJKUserHelper.h"
#import "MJKLoginViewController.h"
#import "HttpTools.h"

@interface AppDelegate ()
{
    Reachability *_reacha;
    NetworkStates _preStatus;
}
@end


@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    
    [self checkNetworkStates];
    //初始化友盟控件
    [self setupUMeung];
    UIViewController *mainVC;
    if ([MJKUserHelper isAutoLogin]) {
                mainVC = [[MJKTabBarViewController alloc] init];
    }else{
                mainVC = [[MJKLoginViewController alloc] init];
    }
    //获取经纬度
    [[MJKLocationManager sharedManager] getGps:^(NSString *lat, NSString *lon) {
    }];
    self.window.rootViewController = mainVC;
    //设置window可见
    [self.window makeKeyAndVisible];
    //引导页加载到window
    MJKAdvertiseView *adview = [MJKAdvertiseView loadAdvertiseView];
    [self.window addSubview:adview];
    return YES;
}


// 实时监控网络状态
- (void)checkNetworkStates
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(networkChange) name:kReachabilityChangedNotification object:nil];
    _reacha = [Reachability reachabilityWithHostName:@"http://www.baidu.com"];
    [_reacha startNotifier];
}
#pragma 检测网络状态
- (void)networkChange
{
    NSString *tips;
    NetworkStates currentStates = [HttpTools getNetworkStates];
    if (currentStates == _preStatus) {
        return;
    }
    _preStatus = currentStates;
    switch (currentStates) {
        case NetworkStatesNone:
            tips = @"当前无网络, 请检查您的网络状态";
            break;
        case NetworkStates2G:
            tips = @"切换到了2G网络";
            break;
        case NetworkStates3G:
            tips = @"切换到了3G网络";
            break;
        case NetworkStates4G:
            tips = @"切换到了4G网络";
            break;
        case NetworkStatesWIFI:
            tips = nil;
            break;
        default:
            break;
    }
    
    if (tips.length) {
    
        [[[UIAlertView alloc] initWithTitle:@"直播" message:tips delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil, nil] show];
    }
}


/*
//#define __IPHONE_10_0    100000
#if __IPHONE_OS_VERSION_MAX_ALLOWED > 100000
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options
{
    
    BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url];
    if (!result) {
        // 其他如支付等SDK的回调
    }
    return result;
     
}

#endif

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url];
    if (!result) {
        // 其他如支付等SDK的回调
    }
    return result;
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url];
    if (!result) {
        // 其他如支付等SDK的回调
    }
    return result;
}

 */

@end
