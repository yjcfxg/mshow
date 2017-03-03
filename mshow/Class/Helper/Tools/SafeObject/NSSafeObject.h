//
//  NSSafeObject.h
//  mshow
//
//  Created by yjcfxg on 16/6/16.
//  Copyright © 2016年 yjcfxg. All rights reserved.
//

#import <Foundation/Foundation.h>
/// justForText
@interface NSSafeObject : NSObject

- (instancetype)initWithObject:(id)object;
- (instancetype)initWithObject:(id)object withSelector:(SEL)selector;
- (void)excute;

@end
