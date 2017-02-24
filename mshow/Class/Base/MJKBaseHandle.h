//
//  MJKBaseHandle.h
//  mshow
//
//  Created by yjcfxg on 2017/2/9.
//  Copyright © 2017年 yjcfxg. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
  处理完成事件
 */
typedef void (^Complete)();

/*
   处理事件成功
   @param  obj 返回数据
 
 */
typedef void (^SuccessBlock)(id obj);

/*
 处理事件失败
 @param  obj 错误信息
 
 */
typedef void (^FailedBlock)(id obj);

@interface MJKBaseHandle : NSObject



@end
