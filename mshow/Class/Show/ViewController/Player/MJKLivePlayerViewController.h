//
//  MJKLivePlayerViewController.h
//  mshow
//
//  Created by yjcfxg on 2017/2/24.
//  Copyright © 2017年 yjcfxg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MJKLivePlayerViewController : UICollectionViewController

/** 直播 */
@property (nonatomic, strong) NSArray *lives;
/** 当前的index */
@property (nonatomic, assign) NSUInteger currentIndex;



@end
