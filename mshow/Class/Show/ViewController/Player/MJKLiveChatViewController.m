//
//  MJKLiveChatViewController.m
//  mshow
//
//  Created by yjcfxg on 2017/2/12.
//  Copyright © 2017年 yjcfxg. All rights reserved.
//

#import "MJKLiveChatViewController.h"

@interface MJKLiveChatViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UIButton *header;
@property (weak, nonatomic) IBOutlet UILabel *peopleCount;
@property (weak, nonatomic) IBOutlet UIButton *yingPiao;

@end

@implementation MJKLiveChatViewController


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (self.live.creator.portrait) {
        [self.iconView downloadImage:[NSString stringWithFormat:@"%@",self.live.creator.portrait] placeholder:@"placeholder_head"];
    }else{
        [self.iconView downloadImage:[NSString stringWithFormat:@"%@",self.NearLive.info.creator.portrait] placeholder:@"placeholder_head"];
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.header.layer.cornerRadius = 20;
    self.header.layer.masksToBounds = YES;
    self.iconView.layer.cornerRadius = 15;
    self.iconView.layer.masksToBounds = YES;
    
    self.yingPiao.layer.cornerRadius = 14;
    self.yingPiao.layer.masksToBounds = YES;
    
    //YYKit里面的
    [NSTimer scheduledTimerWithTimeInterval:1 block:^(NSTimer * _Nonnull timer) {
        self.peopleCount.text = [NSString stringWithFormat:@"%d", arc4random_uniform(10000)];
    } repeats:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
