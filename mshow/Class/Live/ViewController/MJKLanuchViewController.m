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

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [textField endEditing:YES];
}
- (IBAction)closeButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
