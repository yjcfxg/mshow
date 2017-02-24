//
//  MJKNearLiveCollectionViewCell.h
//  mshow
//
//  Created by yjcfxg on 2017/2/13.
//  Copyright © 2017年 yjcfxg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MJKNearLive.h"

@interface MJKNearLiveCollectionViewCell : UICollectionViewCell
@property(nonatomic,strong) MJKNearLive *live;

- (void)showAnimation;

@end
