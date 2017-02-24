//
//  MJKTabBarViewController.m
//  mshow
//
//  Created by yjcfxg on 2017/2/7.
//  Copyright © 2017年 yjcfxg. All rights reserved.
//

#import "MJKTabBarViewController.h"
#import "MJKTabBar.h"
#import "MJKBaseNavViewController.h"
#import "MJKLanuchViewController.h"
#import "AppDelegate.h"
#import "UIDevice+SLExtension.h"
#import <AVFoundation/AVFoundation.h>

@interface MJKTabBarViewController ()<MJKTabBarDelegate>

@property(nonatomic ,strong) MJKTabBar *tabbar;

@end

@implementation MJKTabBarViewController



- (MJKTabBar *)tabbar
{
    if (!_tabbar) {
        _tabbar = [[MJKTabBar alloc] initWithFrame:CGRectMake(0, 0, KSCREEN_WIDTH, 49)];
        _tabbar.delegate = self;
    }
    return _tabbar;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //加载控制器
    [self configViewController];
    //加载tabbar
    [self.tabBar addSubview:self.tabbar];
    //删除tabbar的阴影线
    [[UITabBar appearance] setShadowImage:[UIImage new]];
    [[UITabBar appearance] setBackgroundImage:[UIImage new]];
}

- (void)configViewController
{
    NSMutableArray *array = [NSMutableArray arrayWithArray:@[@"MJKMainViewController",@"MJKMeTableViewController"]];
    for (NSUInteger i = 0; i < [array count]; i++) {
        NSString *vcName = array[i];
        UIViewController *vc = [[NSClassFromString(vcName) alloc] init];
        MJKBaseNavViewController *nav = [[MJKBaseNavViewController alloc] initWithRootViewController:vc];
        [array replaceObjectAtIndex:i withObject:nav];
    }
    self.viewControllers = array;
}

- (void)tabbar:(MJKTabBar *)tabbar clickButton:(NSUInteger)index
{
    if (index!=MJKItemTypeLanuch) {
        self.selectedIndex = index - MJKItemTypeLive;
        return;
    }
    //直播页面跳转其他
    if ([[UIDevice deviceVersion] isEqualToString:@"iPhone Simulator"]) {
        [self showInfo:@"请用真机进行测试, 此模块不支持模拟器测试"];
        
    }
    /*
    // 判断是否有摄像头
    if(![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        [self showInfo:@"您的设备没有摄像头或者相关的驱动, 不能进行直播"];
    }
    
    // 判断是否有摄像头权限
    AVAuthorizationStatus  authorizationStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if (authorizationStatus == AVAuthorizationStatusRestricted|| authorizationStatus == AVAuthorizationStatusDenied) {
        [self showInfo:@"app需要访问您的摄像头。\n请启用摄像头-设置/隐私/摄像头"];
    }
    
    // 开启麦克风权限
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    if ([audioSession respondsToSelector:@selector(requestRecordPermission:)]) {
        [audioSession performSelector:@selector(requestRecordPermission:) withObject:^(BOOL granted) {
            if (granted) {
                
            }else {
                [self showInfo:@"app需要访问您的麦克风。\n请启用麦克风-设置/隐私/麦克风"];
            }
        }];
    }
    */
    MJKLanuchViewController *lanuch = [[MJKLanuchViewController alloc] init];
    [self presentViewController:lanuch animated:YES completion:nil];
    
}


- (void)showInfo:(NSString *)hint
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
