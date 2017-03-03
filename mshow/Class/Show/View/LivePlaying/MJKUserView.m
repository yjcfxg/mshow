//
//  MJKUserView.m
//  mshow
//
//  Created by yjcfxg on 16/6/28.
//  Copyright © 2016年 yjcfxg. All rights reserved.
//

#import "MJKUserView.h"
#import "MJKUsers.h"
#import "UIImage+ALinExtension.h"
#import <SDWebImageDownloader.h>

@interface MJKUserView()
@property (weak, nonatomic) IBOutlet UIImageView *coverView;
@property (weak, nonatomic) IBOutlet UILabel *nickNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *careNumLabel;
@property (weak, nonatomic) IBOutlet UILabel *fansNumLabel;
@property (weak, nonatomic) IBOutlet UIView *userView;

@end
@implementation MJKUserView

+ (instancetype)userView
{
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil].lastObject;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.careNumLabel.text = [NSString stringWithFormat:@"%d", arc4random_uniform(5000) + 500];
    self.fansNumLabel.text = [NSString stringWithFormat:@"%d", arc4random_uniform(30000) + 500];
    self.userView.layer.cornerRadius = 10;
    self.userView.layer.masksToBounds = YES;
}

- (void)setUser:(MJKUsers *)user
{
    _user = user;
    self.nickNameLabel.text = user.nickname ;
    [[SDWebImageDownloader sharedDownloader] downloadImageWithURL:[NSURL URLWithString:user.photo] options:SDWebImageDownloaderUseNSURLCache progress:nil completed:^(UIImage *image, NSData *data, NSError *error, BOOL finished) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.coverView.image = [UIImage circleImage:image borderColor:[UIColor whiteColor] borderWidth:1];
        });
    }];
}

- (IBAction)care:(UIButton *)sender {
}

- (IBAction)tipoffs {
    [self showInfo:@"举报成功"];
}

- (void)showInfo:(NSString *)info
{
    if ([self isKindOfClass:[UIViewController class]] || [self isKindOfClass:[UIView class]]) {
        [[[UIAlertView alloc] initWithTitle:@"直播" message:info delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil, nil] show];
    }
}

- (IBAction)close {
    if (self.closeBlock) {
        self.closeBlock();
    }
}

@end
