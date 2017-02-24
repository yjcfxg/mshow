//
//  MJKMainTopView.h
//  mshow
//
//  Created by yjcfxg on 2017/2/8.
//  Copyright © 2017年 yjcfxg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MJKMainTopView : UIView
typedef void (^MainTopBlock) (NSUInteger tag);

- (instancetype)initWithFrame:(CGRect)frame titleNames:(NSArray *)titles;

@property(nonatomic ,copy) MainTopBlock mainBlock;

- (void)scrolling:(NSUInteger )tag;

@end
