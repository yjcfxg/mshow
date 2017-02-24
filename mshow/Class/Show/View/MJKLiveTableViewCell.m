//
//  MJKLiveTableViewCell.m
//  mshow
//
//  Created by yjcfxg on 2017/2/9.
//  Copyright © 2017年 yjcfxg. All rights reserved.
//

#import "MJKLiveTableViewCell.h"
@interface MJKLiveTableViewCell()
@property (strong, nonatomic) IBOutlet UIImageView *headerView;

@property (strong, nonatomic) IBOutlet UILabel *nameLabel;


@property (strong, nonatomic) IBOutlet UIImageView *bigImageView;
@property (strong, nonatomic) IBOutlet UILabel *locationLabel;
@property (strong, nonatomic) IBOutlet UILabel *onLineLabel;

@end
@implementation MJKLiveTableViewCell


- (void)setLive:(MJKLive *)live
{
    _live = live;
    if ([live.creator.portrait isEqualToString:@"focuse"]) {
        self.headerView.image = [UIImage imageNamed:@"focuse"];
        self.bigImageView.image = [UIImage imageNamed:@"focuse"];
    }else{
        [self.headerView downloadImage:[NSString stringWithFormat:@"%@",live.creator.portrait] placeholder:@"placeholder_head"];
        [self.bigImageView downloadImage:[NSString stringWithFormat:@"%@",live.creator.portrait] placeholder:@"placeholder_head"];
    }
    
    self.nameLabel.text = live.creator.nick;
    self.locationLabel.text = live.city;
    //整形转换string
    self.onLineLabel.text = [@(live.onlineUsers) stringValue];
    
    
}


- (void)awakeFromNib {
    [super awakeFromNib];
    self.headerView.layer.cornerRadius = 25;
    self.headerView.layer.masksToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
