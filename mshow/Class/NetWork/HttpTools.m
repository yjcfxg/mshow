//
//  HttpTools.m
//  mshow
//
//  Created by yjcfxg on 2017/2/8.
//  Copyright © 2017年 yjcfxg. All rights reserved.
//

#import "HttpTools.h"
#import "AFNetworking/AFNetworking.h"
static NSString *KBaseUrl = SERVER_HOST;

@interface AFHttpClient : AFHTTPSessionManager
+(instancetype)sharedClient;

@end
@implementation AFHttpClient

+(instancetype)sharedClient
{
    static AFHttpClient *client= nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        client = [[AFHttpClient alloc] initWithBaseURL:[NSURL URLWithString:KBaseUrl] sessionConfiguration:configuration];
        //接收参数类型
        client.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/html",@"text/json",@"text/javascript",@"text/plain",@"image/git", nil];
        //设置超时时间
        client.requestSerializer.timeoutInterval =15;
        //安全策略
        client.securityPolicy = [AFSecurityPolicy defaultPolicy];
        
    });
    return client;
}
@end

@implementation HttpTools


// 判断网络类型
+ (NetworkStates)getNetworkStates
    {
        NSArray *subviews = [[[[UIApplication sharedApplication] valueForKeyPath:@"statusBar"] valueForKeyPath:@"foregroundView"] subviews];
        // 保存网络状态
        NetworkStates states = NetworkStatesNone;
        for (id child in subviews) {
            if ([child isKindOfClass:NSClassFromString(@"UIStatusBarDataNetworkItemView")]) {
                //获取到状态栏码
                int networkType = [[child valueForKeyPath:@"dataNetworkType"] intValue];
                switch (networkType) {
                    case 0:
                        states = NetworkStatesNone;
                        //无网模式
                        break;
                    case 1:
                        states = NetworkStates2G;
                        break;
                    case 2:
                        states = NetworkStates3G;
                        break;
                    case 3:
                        states = NetworkStates4G;
                        break;
                    case 5:
                    {
                        states = NetworkStatesWIFI;
                    }
                        break;
                    default:
                        break;
                }
            }
        }
        //根据状态选择
        return states;

}
+ (void)getWithPath:(NSString *)path params:(NSDictionary *)params success:(HttpSuccessBlock)success failure:(HttpFailureBlock)failure
{
    //获取完整的url路径
    NSString *url = [KBaseUrl stringByAppendingString:path];
    [[AFHttpClient sharedClient] GET:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
    
}


+(void)getWithFullPath:(NSString *)path
                params:(NSDictionary *)params
               success:(HttpSuccessBlock)success
               failure:(HttpFailureBlock)failure
{
    [[AFHttpClient sharedClient] GET:path parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
    
}
+ (void)postWithPath:(NSString *)path params:(NSDictionary *)params success:(HttpSuccessBlock)success failure:(HttpFailureBlock)failure
{
    //获取完整的url路径
    NSString *url = [KBaseUrl stringByAppendingString:path];
    [[AFHttpClient sharedClient] POST:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}

+(void)downloadWithPath:(NSString *)path success:(HttpSuccessBlock)success failure:(HttpFailureBlock)failure progress:(HttpDownLoadProgressBlock)progress
{
    //获取完整的url路径
    NSString *urlStr = [KBaseUrl stringByAppendingString:path];
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLSessionDownloadTask *downLoadTask = [[AFHttpClient sharedClient] downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        progress(downloadProgress.fractionCompleted);
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        //获取沙盒cache路径
        NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSCachesDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
        return [documentsDirectoryURL URLByAppendingPathComponent:[response suggestedFilename]];
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        if (error) {
            failure(error);
        }
    }];
    [downLoadTask resume];
    
}

+(void)uploadImageWithPath:(NSString *)path params:(NSDictionary *)params thumbName:(NSString *)imageKey image:(UIImage *)image success:(HttpSuccessBlock)success failure:(HttpFailureBlock)failure progress:(HttpUpLoadProgressBlock)progress
{
    //获取完整的url路径
    NSString *urlStr = [KBaseUrl stringByAppendingString:path];
    NSData *data = UIImagePNGRepresentation(image);
    [[AFHttpClient sharedClient] POST:urlStr parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        [formData appendPartWithFileData:data name:imageKey fileName:@"01.png" mimeType:@"image/png"];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        progress(uploadProgress.fractionCompleted);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}
@end

