//
//  MJKMeView.m
//  mshow
//
//  Created by yjcfxg on 2017/2/17.
//  Copyright © 2017年 yjcfxg. All rights reserved.
//

#import "MJKMeView.h"

@implementation MJKMeView

+(instancetype)loadMeView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"MJKMeView" owner:self options:nil] lastObject];
}

@end
