//
//  MJkMacros.h
//  mshow
//
//  Created by yjcfxg on 2017/2/7.
//  Copyright © 2017年 yjcfxg. All rights reserved.
//

#ifndef MJkMacros_h
#define MJkMacros_h


#define KSCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define kSCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define RGB(x,y,z) [UIColor colorWithRed:x/225.0 green:y/255.0 blue:z/255.0 alpha:1.0]
// 点击了用户
#define kNotifyClickUser @"kNotifyClickUser"

// 首页的选择器的宽度
#define Home_Seleted_Item_W 60
#define DefaultMargin       10

// 颜色相关
#define Color(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define KeyColor Color(216, 41, 116)

#endif /* MJkMacros_h */
