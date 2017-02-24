//
//  MJKTabBar.m
//  mshow
//
//  Created by yjcfxg on 2017/2/7.
//  Copyright © 2017年 yjcfxg. All rights reserved.
//

#import "MJKTabBar.h"

@interface MJKTabBar ()

@property(nonatomic,strong) UIImageView *tabbgView;
@property(nonatomic ,strong) NSArray *datalist;
@property(nonatomic,strong) UIButton *lastButton;
@property(nonatomic,strong) UIButton *cameraButton;
@end

@implementation MJKTabBar



- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //装载背景
        [self addSubview:self.tabbgView];
        for (NSUInteger i = 0; i < self.datalist.count; i++) {
            UIButton *btn= [UIButton buttonWithType:UIButtonTypeCustom];
            //不让图片在高粱下改变
            btn.adjustsImageWhenDisabled = NO;
            [btn setImage:[UIImage imageNamed:self.datalist[i] ] forState:UIControlStateNormal];
            [btn setImage:[UIImage imageNamed:[self.datalist[i] stringByAppendingString:@"_sel"] ]  forState:UIControlStateSelected];
            [btn addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
            btn.tag = MJKItemTypeLive +i;
            if (i==0) {
                btn.selected = YES;
                self.lastButton = btn;
            }
            [self addSubview:btn];
        }
        //添加直播按钮
        [self addSubview:self.cameraButton];
        
    }
    return self;
}
- (UIButton *)cameraButton
{
    if (!_cameraButton) {
        _cameraButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_cameraButton setImage:[UIImage imageNamed:@"toolbar_live"] forState:UIControlStateNormal];
        [_cameraButton sizeToFit];
        _cameraButton.tag = MJKItemTypeLanuch;
        [_cameraButton addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cameraButton;
}
- (NSArray *)datalist
{
    if (!_datalist) {
        _datalist =@[@"toolbar_home",@"toolbar_me"];
    }
    return _datalist;
}
- (UIImageView *)tabbgView{
    if (!_tabbgView) {
        _tabbgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@""]];
        _tabbgView.backgroundColor = [UIColor whiteColor];
    }
    return _tabbgView;
}
//自定义控件frame
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.tabbgView.frame = self.bounds;
    CGFloat width = self.bounds.size.width / self.datalist.count;
    for (NSUInteger i = 0; i< [self subviews].count; i++) {
        UIView *btn = [self subviews][i];
        if ([btn isKindOfClass:[UIButton class]]) {
            btn.frame = CGRectMake((btn.tag - MJKItemTypeLive)*width, 0, width, self.frame.size.height);
        }
    }
    [self.cameraButton sizeToFit];
    self.cameraButton.center = CGPointMake(self.bounds.size.width/2, self.bounds.size.height - 30);
}
//三种方法传值
- (void)clickItem:(UIButton *)btn
{
    if ([self.delegate respondsToSelector:@selector(tabbar:clickButton:)]) {
        [self.delegate tabbar:self clickButton:btn.tag];
    }
//    !self.block?:self.block(self,btn.tag);
    if (self.block) {
        self.block(self,btn.tag);
    }
    
    if (btn.tag == MJKItemTypeLanuch) {
        return;
    }
    self.lastButton.selected = NO;
    btn.selected = YES;
    self.lastButton = btn;
    
    //动画
    [UIView animateWithDuration:0.2 animations:^{
        btn.transform = CGAffineTransformMakeScale( 1.2, 1.2);

    } completion:^(BOOL finished) {
        //恢复原始状态
        btn.transform = CGAffineTransformIdentity;
    }];
    
}

@end
