//
//  MJKLiveViewCell.m
//  mshow
//
//  Created by yjcfxg on 16/6/23.
//  Copyright © 2016年 yjcfxg. All rights reserved.
//

#import "MJKLiveViewCell.h"
#import "MJKBottomToolView.h"
#import "MJKLiveAnchorView.h"
#import "MJKCatEarView.h"
#import "MJKLive.h"
#import "MJKNearLive.h"
#import "MJKUser.h"
#import "UIImage+ALinExtension.h"
#import "MJKLiveEndView.h"
#import "NSSafeObject.h"
#import <SDWebImageDownloader.h>
#import <BarrageRenderer.h>
#import "HttpTools.h"
#import "UIViewController+SLExtension.h"
#import "MJKLivePlayerViewController.h"

@interface MJKLiveViewCell()
{
    BarrageRenderer *_renderer;
    NSTimer * _timer;
}
/** 直播播放器 */
@property (nonatomic, strong) IJKFFMoviePlayerController *moviePlayer;
/** 底部的工具栏 */
@property(nonatomic, weak) MJKBottomToolView *toolView;
/** 顶部主播相关视图 */
@property(nonatomic, weak) MJKLiveAnchorView *anchorView;
/** 同类型直播视图 */
@property(nonatomic, weak) MJKCatEarView *catEarView;
/** 同一个工会的主播/相关主播 */
@property(nonatomic, weak) UIImageView *otherView;
/** 直播开始前的占位图片 */
@property(nonatomic, weak) UIImageView *placeHolderView;
/** 粒子动画 */
@property(nonatomic, weak) CAEmitterLayer *emitterLayer;
/** 直播结束的界面 */
@property (nonatomic, weak) MJKLiveEndView *endView;
@property (nonatomic, strong) NSArray *fireworksArray;

@property (nonatomic, weak) CALayer *fireworksL;

@end

@implementation MJKLiveViewCell
- (UIImageView *)placeHolderView
{
    if (!_placeHolderView) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.frame = self.contentView.bounds;
        imageView.image = [UIImage imageNamed:@"profile_user_414x414"];
        [self.contentView addSubview:imageView];
        _placeHolderView = imageView;
        [self.parentVc showGifLoding:nil inView:self.placeHolderView];
        // 强制布局
        [_placeHolderView layoutIfNeeded];
    }
    return _placeHolderView;
}

bool _isSelected = NO;
- (MJKBottomToolView *)toolView
{
    if (!_toolView) {
        MJKBottomToolView *toolView = [[MJKBottomToolView alloc] init];
        [toolView setClickToolBlock:^(LiveToolType type) {
            switch (type) {
                case LiveToolTypePublicTalk:
                    _isSelected = !_isSelected;
                    _isSelected ? [_renderer start] : [_renderer stop];
                    break;
                case LiveToolTypeRank:
                    
                    break;
                case LiveToolTypePrivateTalk:
                    
                    break;
                case LiveToolTypeGift:
                    [self showMyPorsche];
                    break;
                case LiveToolTypeShare:
                    
                    break;
                case LiveToolTypeClose:
                    [self quit];
                    break;
                default:
                    break;
            }
        }];
        [self.contentView insertSubview:toolView aboveSubview:self.placeHolderView];
        [toolView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(@0);
            make.bottom.equalTo(@-10);
            make.height.equalTo(@40);
        }];
        _toolView = toolView;
    }
    return _toolView;
}
- (void)showMyPorsche
{
    CGFloat durTime = 3.0;
    
    UIImageView *porsche = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"porsche"]];
    
    //设置汽车初始位置
    porsche.frame = CGRectMake(0, 0, 0, 0);
    [self addSubview:porsche];
    
    //给汽车添加动画
    [UIView animateWithDuration:durTime animations:^{
        
        porsche.frame = CGRectMake(KSCREEN_WIDTH * 0.5 - 100, kSCREEN_HEIGHT * 0.5 - 100 * 0.5, 240, 120);
    }];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(durTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //
        [UIView animateWithDuration:0.5 animations:^{
            porsche.alpha = 0;
        } completion:^(BOOL finished) {
            [porsche removeFromSuperview];
        }];
    });
    
    //烟花
    CALayer *fireworksL = [CALayer layer];
    fireworksL.frame = CGRectMake((KSCREEN_WIDTH - 250) * 0.5, 100, 250, 50);
    fireworksL.contents = (id)[UIImage imageNamed:@"gift_fireworks_0"].CGImage;
    [self.layer addSublayer:fireworksL];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(durTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:0.5 animations:^{
            //没找到设置透明度的方法，有创意可以自己写
//                        fireworksL.alpha = 0;
            //渐变透明
            [CATransaction begin];
            [CATransaction setAnimationDuration:2.0];
            fireworksL.opacity = 1;
            [CATransaction commit];
            
        } completion:^(BOOL finished) {
            [fireworksL removeFromSuperlayer];
        }];
    });
    _fireworksL = fireworksL;

    NSMutableArray *tempArray = [NSMutableArray array];
    
    for (int i = 1; i < 3; i++) {
        
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"gift_fireworks_%d",i]];
        [tempArray addObject:image];
    }
    _fireworksArray = tempArray;
    
    //加载计时器
    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(update) userInfo:nil repeats:YES];

}
static int _fishIndex = 0;
- (void)update {
    
    _fishIndex++;
    
    if (_fishIndex > 1) {
        _fishIndex = 0;
    }
    UIImage *image = self.fireworksArray[_fishIndex];
    _fireworksL.contents = (id)image.CGImage;
}

- (UIImageView *)otherView
{
    if (!_otherView) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"private_icon_70x7"]];
        imageView.userInteractionEnabled = YES;
        [imageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickOther)]];
        [self.moviePlayer.view addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.catEarView);
            make.bottom.equalTo(self.catEarView.mas_top).offset(-40);
        }];
        _otherView = imageView;
    }
    return _otherView;
}

- (MJKLiveAnchorView *)anchorView
{
    if (!_anchorView) {
        MJKLiveAnchorView *anchorView = [MJKLiveAnchorView liveAnchorView];

        [anchorView setClickDeviceShow:^(bool isSelected) {
            if (_moviePlayer) {
                _moviePlayer.shouldShowHudView = !isSelected;
            }
        }];
        [self.contentView insertSubview:anchorView aboveSubview:self.placeHolderView];
        [anchorView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(@0);
            make.height.equalTo(@120);
            make.top.equalTo(@0);
        }];
        _anchorView = anchorView;
    }
    return _anchorView;
}

- (MJKCatEarView *)catEarView
{
    if (!_catEarView) {
        MJKCatEarView *catEarView = [MJKCatEarView catEarView];
        [self.moviePlayer.view addSubview:catEarView];
        [catEarView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickCatEar)]];
        [catEarView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(@-30);
            make.centerY.equalTo(self.moviePlayer.view);
            make.width.height.equalTo(@98);
        }];
        _catEarView = catEarView;
    }
    return _catEarView;
}

- (CAEmitterLayer *)emitterLayer
{
    if (!_emitterLayer) {
        CAEmitterLayer *emitterLayer = [CAEmitterLayer layer];
        // 发射器在xy平面的中心位置
        emitterLayer.emitterPosition = CGPointMake(self.moviePlayer.view.frame.size.width-50,self.moviePlayer.view.frame.size.height-50);
        // 发射器的尺寸大小
        emitterLayer.emitterSize = CGSizeMake(20, 20);
        // 渲染模式
        emitterLayer.renderMode = kCAEmitterLayerUnordered;
        // 开启三维效果
        //    _emitterLayer.preservesDepth = YES;
        NSMutableArray *array = [NSMutableArray array];
        // 创建粒子
        for (int i = 0; i<10; i++) {
            // 发射单元
            CAEmitterCell *stepCell = [CAEmitterCell emitterCell];
            // 粒子的创建速率，默认为1/s
            stepCell.birthRate = 1;
            // 粒子存活时间
            stepCell.lifetime = arc4random_uniform(4) + 1;
            // 粒子的生存时间容差
            stepCell.lifetimeRange = 1.5;
            // 颜色
            // fire.color=[[UIColor colorWithRed:0.8 green:0.4 blue:0.2 alpha:0.1]CGColor];
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"good%d_30x30", i]];
            // 粒子显示的内容
            stepCell.contents = (id)[image CGImage];
            // 粒子的名字
            //            [fire setName:@"step%d", i];
            // 粒子的运动速度
            stepCell.velocity = arc4random_uniform(100) + 100;
            // 粒子速度的容差
            stepCell.velocityRange = 80;
            // 粒子在xy平面的发射角度
            stepCell.emissionLongitude = M_PI+M_PI_2;;
            // 粒子发射角度的容差
            stepCell.emissionRange = M_PI_2/6;
            // 缩放比例
            stepCell.scale = 0.3;
            [array addObject:stepCell];
        }
        
        emitterLayer.emitterCells = array;
        [self.moviePlayer.view.layer insertSublayer:emitterLayer below:self.catEarView.layer];
        _emitterLayer = emitterLayer;
    }
    return _emitterLayer;
}

- (MJKLiveEndView *)endView
{
    if (!_endView) {
        MJKLiveEndView *endView = [MJKLiveEndView liveEndView];
        [self.contentView addSubview:endView];
        [endView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(@0);
        }];
        [endView setQuitBlock:^{
            [self quit];
        }];
        [endView setLookOtherBlock:^{
            [self clickCatEar];
        }];
        _endView = endView;
    }
    return _endView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.toolView.hidden = NO;
        
        _renderer = [[BarrageRenderer alloc] init];
        _renderer.canvasMargin = UIEdgeInsetsMake(KSCREEN_WIDTH * 0.3, 10, 10, 10);
        [self.contentView addSubview:_renderer.view];
        
        NSSafeObject * safeObj = [[NSSafeObject alloc]initWithObject:self withSelector:@selector(autoSendBarrage)];
        _timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:safeObj selector:@selector(excute) userInfo:nil repeats:YES];
    }
    return self;
}

- (void)setLive:(MJKLive *)live
{
    _live = live;
    self.anchorView.live = live;
    [self plarFLV:live.streamAddr placeHolderUrl:live.creator.portrait];
}

- (void)setRelateLive:(MJKLive *)relateLive
{
    _relateLive = relateLive;
    // 设置相关主播
    if (relateLive) {
        self.catEarView.live = relateLive;
    }else{
        self.catEarView.hidden = YES;
    }
}
- (void)setRelateNearLive:(MJKNearLive *)relateNearLive
{
    _relateNearLive = relateNearLive;
    // 设置相关主播
    if (relateNearLive) {
        self.catEarView.nearLive = relateNearLive;
    }else{
        self.catEarView.hidden = YES;
    }
}

- (void)setNearLive:(MJKNearLive *)NearLive
{
    _NearLive = NearLive;
    self.anchorView.nearLive = NearLive;
    [self plarFLV:NearLive.info.stream_addr placeHolderUrl:NearLive.info.creator.portrait];
}

#pragma mark - private method

- (void)plarFLV:(NSString *)flv placeHolderUrl:(NSString *)placeHolderUrl
{
    if (_moviePlayer) {
        if (_moviePlayer) {
            [self.contentView insertSubview:self.placeHolderView aboveSubview:_moviePlayer.view];
        }
        if (_catEarView) {
            [_catEarView removeFromSuperview];
            _catEarView = nil;
        }
        [_moviePlayer shutdown];
        [_moviePlayer.view removeFromSuperview];
        _moviePlayer = nil;
        [[NSNotificationCenter defaultCenter] removeObserver:self];
    }
    
    // 如果切换主播, 取消之前的动画
    if (_emitterLayer) {
        [_emitterLayer removeFromSuperlayer];
        _emitterLayer = nil;
    }
    
    [[SDWebImageDownloader sharedDownloader] downloadImageWithURL:[NSURL URLWithString:placeHolderUrl] options:SDWebImageDownloaderUseNSURLCache progress:nil completed:^(UIImage *image, NSData *data, NSError *error, BOOL finished) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.parentVc showGifLoding:nil inView:self.placeHolderView];
            self.placeHolderView.image = [UIImage blurImage:image blur:0.8];
        });
    }];
    
    IJKFFOptions *options = [IJKFFOptions optionsByDefault];
    [options setPlayerOptionIntValue:1  forKey:@"videotoolbox"];
    
    // 帧速率(fps) （可以改，确认非标准桢率会导致音画不同步，所以只能设定为15或者29.97）
    [options setPlayerOptionIntValue:29.97 forKey:@"r"];
    // -vol——设置音量大小，256为标准音量。（要设置成两倍音量时则输入512，依此类推
    [options setPlayerOptionIntValue:512 forKey:@"vol"];
    IJKFFMoviePlayerController *moviePlayer = [[IJKFFMoviePlayerController alloc] initWithContentURLString:flv withOptions:options];
    moviePlayer.view.frame = self.contentView.bounds;
    // 填充fill
    moviePlayer.scalingMode = IJKMPMovieScalingModeAspectFill;
    // 设置自动播放(必须设置为NO, 防止自动播放, 才能更好的控制直播的状态)
    moviePlayer.shouldAutoplay = NO;
    // 默认不显示
    moviePlayer.shouldShowHudView = NO;
    
    [self.contentView insertSubview:moviePlayer.view atIndex:0];
    
    [moviePlayer prepareToPlay];
    
    self.moviePlayer = moviePlayer;
    
    // 设置监听
    [self initObserver];
    
    // 显示工会其他主播和类似主播
    [moviePlayer.view bringSubviewToFront:self.otherView];
    
    // 开始来访动画
    [self.emitterLayer setHidden:NO];
}


- (void)initObserver
{
    // 监听视频是否播放完成
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didFinish) name:IJKMPMoviePlayerPlaybackDidFinishNotification object:self.moviePlayer];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(stateDidChange) name:IJKMPMoviePlayerLoadStateDidChangeNotification object:self.moviePlayer];
}

- (void)clickOther
{
    NSLog(@"相关的主播");
}

- (void)clickCatEar
{
    if (self.clickRelatedLive) {
        self.clickRelatedLive();
    }
}

#pragma mark - notify method

- (void)stateDidChange
{
    if ((self.moviePlayer.loadState & IJKMPMovieLoadStatePlaythroughOK) != 0) {
        if (!self.moviePlayer.isPlaying) {
            [self.moviePlayer play];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                if (_placeHolderView) {
                    [_placeHolderView removeFromSuperview];
                    _placeHolderView = nil;
                    [self.moviePlayer.view addSubview:_renderer.view];
                }
                [self.parentVc hideGufLoding];
            });
        }else{
            // 如果是网络状态不好, 断开后恢复, 也需要去掉加载
            if (self.parentVc.gifView.isAnimating) {
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [self.parentVc hideGufLoding];
                });
                
            }
        }
    }else if (self.moviePlayer.loadState & IJKMPMovieLoadStateStalled){ // 网速不佳, 自动暂停状态
        [self.parentVc showGifLoding:nil inView:self.moviePlayer.view];
    }
}

- (void)didFinish
{
    NSLog(@"加载状态...%ld %ld %s", self.moviePlayer.loadState, self.moviePlayer.playbackState, __func__);
    // 因为网速或者其他原因导致直播stop了, 也要显示GIF
    if (self.moviePlayer.loadState & IJKMPMovieLoadStateStalled && !self.parentVc.gifView) {
        [self.parentVc showGifLoding:nil inView:self.moviePlayer.view];
        return;
    }
//    方法：
//      1、重新获取直播地址，服务端控制是否有地址返回。
//      2、用户http请求该地址，若请求成功表示直播未结束，否则结束
    __weak typeof(self)weakSelf = self;
    [HttpTools getWithFullPath:self.live.streamAddr params:nil success:^(id json) {
        NSLog(@"请求成功%@, 等待继续播放", json);
    } failure:^(NSError *error) {
        NSLog(@"请求失败, 加载失败界面, 关闭播放器%@", error);
        [weakSelf.moviePlayer shutdown];
        [weakSelf.moviePlayer.view removeFromSuperview];
        weakSelf.moviePlayer = nil;
        weakSelf.endView.hidden = NO;
    }];
    /*
    [[MJKNetworkTool shareTool] GET:self.live.flv parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"请求成功%@, 等待继续播放", responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"请求失败, 加载失败界面, 关闭播放器%@", error);
        [weakSelf.moviePlayer shutdown];
        [weakSelf.moviePlayer.view removeFromSuperview];
        weakSelf.moviePlayer = nil;
        weakSelf.endView.hidden = NO;
    }];
     */
}

- (void)quit
{
    if (_catEarView) {
        [_catEarView removeFromSuperview];
        _catEarView = nil;
    }
    
    if (_moviePlayer) {
        [self.moviePlayer shutdown];
        [[NSNotificationCenter defaultCenter] removeObserver:self];
    }
    [_renderer stop];
    [_renderer.view removeFromSuperview];
    _renderer = nil;
    [self.parentVc dismissViewControllerAnimated:YES completion:nil];
}

- (void)autoSendBarrage
{
    NSInteger spriteNumber = [_renderer spritesNumberWithName:nil];
    if (spriteNumber <= 50) { // 限制屏幕上的弹幕量
        [_renderer receive:[self walkTextSpriteDescriptorWithDirection:BarrageWalkDirectionR2L]];
    }
}

#pragma mark - 弹幕描述符生产方法

long _index = 0;
/// 生成精灵描述 - 过场文字弹幕
- (BarrageDescriptor *)walkTextSpriteDescriptorWithDirection:(NSInteger)direction
{
    BarrageDescriptor * descriptor = [[BarrageDescriptor alloc]init];
    descriptor.spriteName = NSStringFromClass([BarrageWalkTextSprite class]);
    descriptor.params[@"text"] = self.danMuText[arc4random_uniform((uint32_t)self.danMuText.count)];
    descriptor.params[@"textColor"] = Color(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256));
    descriptor.params[@"speed"] = @(100 * (double)random()/RAND_MAX+50);
    descriptor.params[@"direction"] = @(direction);
    descriptor.params[@"clickAction"] = ^{
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"弹幕被点击" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil];
        [alertView show];
    };
    return descriptor;
}

- (NSArray *)danMuText
{
    return [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"danmu.plist" ofType:nil]];
}
@end
