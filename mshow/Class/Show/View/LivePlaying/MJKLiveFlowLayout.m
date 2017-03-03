//
//  MJKLiveFlowLayout.m
//  mshow
//
//  Created by yjcfxg on 16/6/23.
//  Copyright © 2016年 yjcfxg. All rights reserved.
//

#import "MJKLiveFlowLayout.h"

@implementation MJKLiveFlowLayout
- (void)prepareLayout
{
    [super prepareLayout];
    self.scrollDirection = UICollectionViewScrollDirectionVertical;
    self.itemSize = self.collectionView.bounds.size;
    self.minimumLineSpacing = 0;
    self.minimumInteritemSpacing = 0;
    
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
}
@end
