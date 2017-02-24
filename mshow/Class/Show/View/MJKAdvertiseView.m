//
//  MJKAdvertise.m
//  mshow
//
//  Created by yjcfxg on 2017/2/15.
//  Copyright © 2017年 yjcfxg. All rights reserved.
//

#import "MJKAdvertiseView.h"
#import "MJKLiveHandle.h"
#import "MJKAdvertise.h"
#import "MJKCacheHeper.h"
@interface MJKAdvertiseView()
@property (weak, nonatomic) IBOutlet UIImageView *backView;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) dispatch_source_t timer;
@end

static NSInteger showtime = 3;
@implementation MJKAdvertiseView

+ (instancetype)loadAdvertiseView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"MJKAdvertiseView" owner:self options:nil] lastObject];
}

#pragma 广告初始化方法
- (void)awakeFromNib{
    [super awakeFromNib];
    self.frame = [UIScreen mainScreen].bounds;
    //展示广告
    [self showAd];
    //下载广告
    [self downAd];
    //倒计时
    [self startTimer];
}

- (void)showAd{
    NSString *fileName = [MJKCacheHeper getAdVersite];
    NSString *filePath = [NSString stringWithFormat:@"%@%@",IMAGE_HOST,fileName];
    UIImage *lastCacheimage = [[SDWebImageManager sharedManager].imageCache imageFromDiskCacheForKey:filePath];
//    [[SDWebImageManager sharedManager].imageCache imageFromCacheForKey:filePath];
    if (lastCacheimage) {
        self.backView.image = lastCacheimage;
    }else{
        self.hidden = YES;
    }
}
- (void)downAd{
    //http://img2.inke.cn/MTQ4NzA4NTMyNDgwOSM0NjQjanBn.jpg
    [MJKLiveHandle execteGetAdvertiseTaskWithSuccess:^(id obj) {
        MJKAdvertise *ad= obj;
        //写死广告url
//        ad.image = @"MTQ4NzA4NTMyNDgwOSM0NjQjanBn.jpg";
        
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",IMAGE_HOST,ad.image]];
        
        //SDWebImageAvoidAutoSetImage下载完不给imageView赋值
        [[SDWebImageManager sharedManager] loadImageWithURL:url options:    SDWebImageAvoidAutoSetImage progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
            NSLog(@"图片下载成功！");
            //缓存本地内存
            [MJKCacheHeper setAdvertise:ad.image];
        } completed:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error, SDImageCacheType cacheType, BOOL finished, NSURL * _Nullable imageURL) {
            
        }];
        
    } failed:^(id obj) {
        
    }];

}
-(void)startTimer{
   __block NSUInteger timeout = showtime + 1;
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_global_queue(0, 0));
    self.timer = timer;
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(timer, ^{
        if (timeout <= 0) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self dismiss];
            });
            
        }else{
            dispatch_async(dispatch_get_main_queue(), ^{
                self.timeLabel.text = [NSString stringWithFormat:@"跳过 %zd",timeout];

            });
            timeout--;

        }
    });
    dispatch_resume(timer);
}
- (void)dismiss{
    [UIView animateWithDuration:0.5 animations:^{
        self.alpha = 0.0;

    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}
@end
