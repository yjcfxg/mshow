//
//  MJKMainTopView.m
//  mshow
//
//  Created by yjcfxg on 2017/2/8.
//  Copyright © 2017年 yjcfxg. All rights reserved.
//

#import "MJKMainTopView.h"

@interface MJKMainTopView ()

@property (nonatomic,strong) UIView *lineView;
@property(nonatomic,strong) NSMutableArray *buttonArray;
@end

@implementation MJKMainTopView


- (NSMutableArray *)buttonArray
{
    if (!_buttonArray) {
        _buttonArray = [NSMutableArray array];
    }
    return _buttonArray;
}

- (instancetype)initWithFrame:(CGRect)frame titleNames:(NSArray *)titles
{
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat width = self.width / titles.count;
        CGFloat height = self.height;
        for (NSUInteger i =0; i< [titles count]; i++) {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            NSString *name = titles[i];
            btn.tag = i;
            [self.buttonArray addObject:btn];
            [btn setTitle:name forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            btn.titleLabel.font = [UIFont systemFontOfSize:18];
            //
            btn.frame = CGRectMake(i * width, 0, width, height);
            [btn addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:btn];
            
            if (i== 1) {
                CGFloat h = 1;
                CGFloat y =38;
                [btn.titleLabel sizeToFit];
                
                self.lineView = [[UIView alloc] init];
                self.lineView.backgroundColor = [UIColor whiteColor];
                self.lineView.height = h;
                self.lineView.width = btn.titleLabel.width;
                self.lineView.top = y;
                self.lineView.centerX = btn.centerX;
                [self addSubview:self.lineView];
                
            }
        }
        
    }
    return self;
}
//点击事件
- (void)titleClick:(UIButton *)btn
{
    self.mainBlock(btn.tag);
    [UIView animateWithDuration:0.3 animations:^{
        self.lineView.centerX = btn.centerX;
    }];
}
//mainVC滚动式调用
- (void)scrolling:(NSUInteger)tag
{
    UIButton *btn = self.buttonArray[tag];
    [UIView animateWithDuration:0.3 animations:^{
        self.lineView.centerX = btn.centerX;
    }];

}
@end
