//
//  MJKThirdLogin.h
//  mshow
//
//  Created by yjcfxg on 2017/2/17.
//  Copyright © 2017年 yjcfxg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UMSocialCore/UMSocialCore.h>

typedef void (^FeelThidLoginCompletion)();
@interface MJKThirdLogin : NSObject

+ (void)QQLoginWithVC:(FeelThidLoginCompletion)Completelogin destVC:(UIViewController *)destVC;

+ (void)sinaLoginWithVC:(FeelThidLoginCompletion)Completelogin destVC:(UIViewController *)destVC;
+ (void)WXLoginWithVC:(FeelThidLoginCompletion)Completelogin destVC:(UIViewController *)destVC;

@end
