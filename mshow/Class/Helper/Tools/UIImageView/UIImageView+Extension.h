//
//  UIImageView+ALinGif.h
//  mShow
//
//  Created by yjcfxg on 16/6/16.
//  Copyright © 2016年 yjcfxg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (ALinGif)
// 播放GIF
- (void)playGifAnim:(NSArray *)images;
// 停止动画
- (void)stopGifAnim;
@end
