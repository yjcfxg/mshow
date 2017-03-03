//
//  MJKLanuchViewController.m
//  mshow
//
//  Created by yjcfxg on 2017/2/8.
//  Copyright © 2017年 yjcfxg. All rights reserved.
//

#import "MJKLanuchViewController.h"
#import "LFLivePreview.h"

@interface MJKLanuchViewController ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *TextLive;
@property (strong, nonatomic) IBOutlet UIButton *closeBtn;

@end

@implementation MJKLanuchViewController

- (IBAction)LiveEdit:(UITextField *)sender {
    
}
//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
////    //回收键盘
////    [self.TextLive resignFirstResponder];
//    
//}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
//    [self.TextLive endEditing:YES];
}
- (IBAction)closeButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.TextLive.delegate = self;
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)startLive:(id)sender {
  
    UIView *back = [[UIView alloc] initWithFrame:self.view.bounds];
    back.backgroundColor = [UIColor blackColor];
    [self.view addSubview:back];
    
    LFLivePreview *preView = [[LFLivePreview alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:preView];
    preView.VC = self;
    //开启直播
    [preView startLive];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
