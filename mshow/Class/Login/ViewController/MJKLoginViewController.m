//
//  MJKLoginViewController.m
//  mshow
//
//  Created by yjcfxg on 2017/2/10.
//  Copyright © 2017年 yjcfxg. All rights reserved.
//

#import "MJKLoginViewController.h"

#import "MJKThirdLoginView.h"
#import "MJKTabBarViewController.h"
//#import <UMSocialCore/UMSocialCore.h>
#import "MJKUserHelper.h"

@interface MJKLoginViewController ()


/** player */
@property (nonatomic, strong) IJKFFMoviePlayerController *player;


/** 第三方登录 */
@property (nonatomic, weak) MJKThirdLoginView *thirdView;
/** 快速通道 */
@property (nonatomic, weak) UIButton *quickBtn;
/** 封面图片 */
@property (nonatomic, weak) UIImageView *coverView;

@end

@implementation MJKLoginViewController



#pragma mark - 懒加载

- (IJKFFMoviePlayerController *)player
{
    if (!_player) {
        // 随机播放一组视频
        NSString *path = arc4random_uniform(10) % 2 ? @"login_video" : @"loginmovie";
        IJKFFMoviePlayerController *player = [[IJKFFMoviePlayerController alloc] initWithContentURLString:[[NSBundle mainBundle] pathForResource:path ofType:@"mp4"] withOptions:[IJKFFOptions optionsByDefault]];
        // 设计player
        player.view.frame = self.view.bounds;
        // 填充fill
        player.scalingMode = IJKMPMovieScalingModeAspectFill;
        [self.view addSubview:player.view];
        // 设置自动播放
        player.shouldAutoplay = NO;
        // 准备播放
        [player prepareToPlay];
        
        _player = player;
    }
    return _player;
}

- (MJKThirdLoginView *)thirdView
{
    if (!_thirdView) {
        MJKThirdLoginView *third = [[MJKThirdLoginView alloc] initWithFrame:CGRectMake(0, 0, 400, 200)];
        [third setClickLogin:^(LoginType type) {
            [self loginType:type];
        }];
        third.hidden = YES;
        [self.view addSubview:third];
        _thirdView = third;
    }
    return _thirdView;
}

- (UIButton *)quickBtn
{
    if (!_quickBtn) {
        UIButton *btn = [[UIButton alloc] init];
        btn.backgroundColor = [UIColor clearColor];
        btn.layer.borderWidth = 1;
        btn.layer.borderColor = [UIColor yellowColor].CGColor;
        [btn setTitle:@"快速通道" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor yellowColor]  forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(loginSuccess) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        btn.hidden = YES;
        _quickBtn = btn;
    }
    return _quickBtn;
}


- (void)loginType:(LoginType)type
{
    /*
    if (type == LoginTypeSina) {
     
        [[UMSocialManager defaultManager] getUserInfoWithPlatform:UMSocialPlatformType_Sina currentViewController:nil completion:^(id result, NSError *error) {
            if (error) {
                
            } else {
                
                UMSocialUserInfoResponse *resp = result;
                [MJKUserHelper shareUser].nickName = resp.name;
                [MJKUserHelper shareUser].imgUrl = resp.iconurl;
                [MJKUserHelper saveUser];
                self.view.window.rootViewController = [[MJKTabBarViewController alloc] init];
                // 授权信息
                NSLog(@"Sina uid: %@", resp.uid);
                NSLog(@"Sina accessToken: %@", resp.accessToken);
                NSLog(@"Sina refreshToken: %@", resp.refreshToken);
                NSLog(@"Sina expiration: %@", resp.expiration);
                
                // 用户信息
                NSLog(@"Sina name: %@", resp.name);
                NSLog(@"Sina iconurl: %@", resp.iconurl);
                NSLog(@"Sina gender: %@", resp.gender);
                
                // 第三方平台SDK源数据
                NSLog(@"Sina originalResponse: %@", resp.originalResponse);
            }
        }];
     
    }else if (type == LoginTypeQQ){
        
        [[UMSocialManager defaultManager] getUserInfoWithPlatform:UMSocialPlatformType_QQ currentViewController:nil completion:^(id result, NSError *error) {
            if (error) {
                
            } else {
                UMSocialUserInfoResponse *resp = result;
                
                [MJKUserHelper shareUser].nickName = resp.name;
                [MJKUserHelper shareUser].imgUrl = resp.iconurl;
                [MJKUserHelper saveUser];
                self.view.window.rootViewController = [[MJKTabBarViewController alloc] init];
                // 授权信息
                NSLog(@"QQ uid: %@", resp.uid);
                NSLog(@"QQ openid: %@", resp.openid);
                NSLog(@"QQ accessToken: %@", resp.accessToken);
                NSLog(@"QQ expiration: %@", resp.expiration);
                
                // 用户信息
                NSLog(@"QQ name: %@", resp.name);
                NSLog(@"QQ iconurl: %@", resp.iconurl);
                NSLog(@"QQ gender: %@", resp.gender);
                
                // 第三方平台SDK源数据
                NSLog(@"QQ originalResponse: %@", resp.originalResponse);
            }
        }];
     
    }else{
    [[UMSocialManager defaultManager] getUserInfoWithPlatform:UMSocialPlatformType_WechatSession currentViewController:nil completion:^(id result, NSError *error) {
        if (error) {
            
        } else {
            UMSocialUserInfoResponse *resp = result;
            
            // 授权信息
            NSLog(@"Wechat uid: %@", resp.uid);
            NSLog(@"Wechat openid: %@", resp.openid);
            NSLog(@"Wechat accessToken: %@", resp.accessToken);
            NSLog(@"Wechat refreshToken: %@", resp.refreshToken);
            NSLog(@"Wechat expiration: %@", resp.expiration);
            
            // 用户信息
            NSLog(@"Wechat name: %@", resp.name);
            NSLog(@"Wechat iconurl: %@", resp.iconurl);
            NSLog(@"Wechat gender: %@", resp.gender);
            
            // 第三方平台SDK源数据
            NSLog(@"Wechat originalResponse: %@", resp.originalResponse);
        }
    }];

    }
*/
    [self loginSuccess];
}
- (UIImageView *)coverView
{
    if (!_coverView) {
        UIImageView *cover = [[UIImageView alloc] initWithFrame:self.view.bounds];
        cover.image = [UIImage imageNamed:@"LaunchImage"];
        [self.player.view addSubview:cover];
        _coverView = cover;
    }
    return _coverView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setup];
}


- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self.player shutdown];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    [self.player.view removeFromSuperview];
    self.player = nil;
    
}


- (void)setup
{
    [self initObserver];
    
    self.coverView.hidden = NO;
    
    [self.quickBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@40);
        make.right.equalTo(@-40);
        make.bottom.equalTo(@-60);
        make.height.equalTo(@40);
    }];
    
    [self.thirdView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(@0);
        make.height.equalTo(@60);
        make.bottom.equalTo(self.quickBtn.mas_top).offset(-40);
    }];
    
}


#pragma mark - private method

- (void)initObserver
{
    // 监听视频是否播放完成
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didFinish) name:IJKMPMoviePlayerPlaybackDidFinishNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(stateDidChange) name:IJKMPMoviePlayerLoadStateDidChangeNotification object:nil];
}


- (void)stateDidChange
{
    if ((self.player.loadState & IJKMPMovieLoadStatePlaythroughOK) != 0) {
        if (!self.player.isPlaying) {
            self.coverView.frame = self.view.bounds;
            [self.view insertSubview:self.coverView atIndex:0];
            [self.player play];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                self.thirdView.hidden = NO;
                self.quickBtn.hidden = NO;
            });
        }
    }
}

- (void)didFinish
{
    // 播放完之后, 继续重播
    [self.player play];
}

// 登录成功
- (void)loginSuccess
{
    [self showHint:@"登录成功"];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self presentViewController:[[MJKTabBarViewController alloc] init] animated:NO completion:^{
            [self.player stop];
            [self.player.view removeFromSuperview];
            self.player = nil;
        }];
    });
}


- (void)showHint:(NSString *)hint
{
        //显示提示信息
        UIView *view = [[UIApplication sharedApplication].delegate window];
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
        hud.userInteractionEnabled = NO;
        hud.mode = MBProgressHUDModeText;
        hud.label.text = hint;
        hud.margin = 10.f;
        hud.removeFromSuperViewOnHide = YES;
        [hud hideAnimated:YES afterDelay:0.3];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
