//
//  UIImageView+SDWebImage.h
//  mshow
//
//  Created by yjcfxg on 2017/2/8.
//  Copyright © 2017年 yjcfxg. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^DownloadImageSuccessBlock)(UIImage *image);
typedef void (^DownloadImageFailureBlock)(NSError *error);
typedef void (^DownloadImageProgressBlock)(CGFloat progress);

@interface UIImageView (SDWebImage)

/*
 *  异步加载图片
 *
 *
 *  @param   url    图片地址
 *  @param   imageName 占位图片名
 *
 *
 */


- (void)downloadImage:(NSString *)url placeholder:(NSString *)imageName;



/*
 *  异步加载图片  可以监听下载进度，成功或者失败
 *
 *
 *  @param   url    图片地址
 *  @param   imageName 占位图片名
 *  @param   success  下载成功
 *  @param   failure 下载失败
 *
 *
 *
 */


- (void)downloadImage:(NSString *)url placeholder:(NSString *)imageName suceess:(DownloadImageSuccessBlock)success failure:(DownloadImageFailureBlock)failure progress:(DownloadImageProgressBlock)progress;






@end
