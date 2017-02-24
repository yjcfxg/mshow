//
//  MJKNearLiveCollectionViewCell.m
//  mshow
//
//  Created by yjcfxg on 2017/2/13.
//  Copyright © 2017年 yjcfxg. All rights reserved.
//

#import "MJKNearLiveCollectionViewCell.h"
@interface MJKNearLiveCollectionViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *headView;
@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;

@end
@implementation MJKNearLiveCollectionViewCell

- (void)setLive:(MJKNearLive *)live

{
    _live = live;
    
    [self.headView downloadImage:[NSString stringWithFormat:@"%@",self.live.info.creator.portrait] placeholder:@"placeholder_head"];
    self.distanceLabel.text = self.live.info.distance;
}

- (void)showAnimation
{
    if (self.live.show) {
        return;
    }
    self.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1);
    [UIView animateWithDuration:0.5 animations:^{
        self.layer.transform = CATransform3DMakeTranslation(1, 1, 1);
        self.live.show = YES;
    }];
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
