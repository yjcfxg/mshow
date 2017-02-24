//
//  HttpTools.h
//  mshow
//
//  Created by yjcfxg on 2017/2/8.
//  Copyright © 2017年 yjcfxg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, NetworkStates) {
    NetworkStatesNone, // 没有网络
    NetworkStates2G, // 2G
    NetworkStates3G, // 3G
    NetworkStates4G, // 4G
    NetworkStatesWIFI // WIFI
};

typedef void (^HttpSuccessBlock)(id json);
typedef void (^HttpFailureBlock)(NSError *error);
typedef void (^HttpDownLoadProgressBlock)(CGFloat progress);
typedef void (^HttpUpLoadProgressBlock)(CGFloat progress);

@interface HttpTools : NSObject


// 判断网络类型
+ (NetworkStates)getNetworkStates;



/*
 *get请求
 *
 *@param path   url地址
 *@param params url参数  NSDictionary 类型
 *@param success 请求成功  返回NSDictionary或者NSArray
 *@param failure 请求失败  返回NSError
 *
 *
 *
 
 */

+(void)getWithPath:(NSString *)path
            params:(NSDictionary *)params
           success:(HttpSuccessBlock)success
           failure:(HttpFailureBlock)failure;



/*
 *get请求
 *
 *@param path   url地址
 *@param params url参数  NSDictionary 类型
 *@param success 请求成功  返回NSDictionary或者NSArray
 *@param failure 请求失败  返回NSError
 *
 *
 *
 
 */

+(void)getWithFullPath:(NSString *)path
            params:(NSDictionary *)params
           success:(HttpSuccessBlock)success
           failure:(HttpFailureBlock)failure;


/*
 *post请求
 *
 *@param path   url地址
 *@param params url参数  NSDictionary 类型
 *@param success 请求成功  返回NSDictionary或者NSArray
 *@param failure 请求失败  返回NSError
 *
 *
 *
 
 */

+(void)postWithPath:(NSString *)path
            params:(NSDictionary *)params
           success:(HttpSuccessBlock)success
           failure:(HttpFailureBlock)failure;


/*
 *下载文件
 *
 *@param path   url路径
 *@param success 请求成功
 *@param failure 请求失败
 *@param progress 下载进度
 *
 *
 */
+(void)downloadWithPath:(NSString *)path
            success:(HttpSuccessBlock)success
            failure:(HttpFailureBlock)failure
           progress:(HttpDownLoadProgressBlock)progress;

/*
 *上传图片
 *
 *@param path   url地址
 *@param image  UIImage对象
 *@param thumbName imagekey
 *@param params 上传参数
 *@param success 上传成功
 *@param failure 上传失败
 *@param progress 上传进度
 *
 *
 */
+(void)uploadImageWithPath:(NSString *)path
                    params:(NSDictionary *)params
                 thumbName:(NSString *)imageKey
                     image:(UIImage *)image
            success:(HttpSuccessBlock)success
            failure:(HttpFailureBlock)failure
           progress:(HttpUpLoadProgressBlock)progress;



@end
