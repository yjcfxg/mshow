//
//  UIImageView+SDWebImage.m
//  mshow
//
//  Created by yjcfxg on 2017/2/8.
//  Copyright © 2017年 yjcfxg. All rights reserved.
//

#import "UIImageView+SDWebImage.h"
#import "UIImageView+WebCache.h"


@implementation UIImageView (SDWebImage)



- (void)downloadImage:(NSString *)url placeholder:(NSString *)imageName
{
 
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:imageName] options:SDWebImageRetryFailed|SDWebImageLowPriority];
}

- (void)downloadImage:(NSString *)url placeholder:(NSString *)imageName suceess:(DownloadImageSuccessBlock)success failure:(DownloadImageFailureBlock)failure progress:(DownloadImageProgressBlock)progress
{
  [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:imageName] options:SDWebImageRetryFailed|SDWebImageLowPriority progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
      progress(receivedSize *1.0 /expectedSize);
  } completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
      if (error) {
          failure(error);
      }else{
          self.image = image;
          success(image);
      }
  }];
}

@end
