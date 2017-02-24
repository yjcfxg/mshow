//
//  MJKLive.m
//  mshow
//
//  Created by yjcfxg on 2017/2/9.
//  Copyright © 2017年 yjcfxg. All rights reserved.
//

#import "MJKLive.h"

@implementation MJKLive

/*
 用containsObject判断是否存在的问题
 
 在NSArray或NSMutableArray中想使用containsObject方法来判断是否存在的，可是发现总是不存在，原因是创建了两个 NSObject ，虽然Object里面的值完全相同，但分配在不同的内存空间，所以返回结果是不存在的。
 
 解决办法：在你对应的NSObject中，重载 - (BOOL)isEqual:(id)anObject ，就可以了！
 
 */
- (BOOL)isEqual:(id)object
{
    if (self == object) {
        return YES;
    }
    
    if (![object isKindOfClass:[MJKLive class]]) {
        return NO;
    }
    
    MJKLive *tekubaEntity = (MJKLive *)object;
    if (tekubaEntity.creator.id== self.creator.id) {
        return YES;
    } else {
        return NO;
    }
}


@end
