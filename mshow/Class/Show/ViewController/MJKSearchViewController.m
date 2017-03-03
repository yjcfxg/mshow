//
//  MJKSearchViewController.m
//  mshow
//
//  Created by yjcfxg on 2017/3/2.
//  Copyright © 2017年 yjcfxg. All rights reserved.
//

#import "MJKSearchViewController.h"

@interface MJKSearchViewController ()<UISearchBarDelegate,UINavigationBarDelegate>

@end

@implementation MJKSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //设置左侧搜索框
    [self setupLeftsearchBar];
    
    //设置右侧Item
    [self setupRightItem];
}

-(void)setupLeftsearchBar
{
    self.view.backgroundColor =[UIColor whiteColor];
    
    CGFloat W=KSCREEN_WIDTH-65;
    UISearchBar *searBar =[[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, W, 28)];
    
    searBar.placeholder =@"输入映客号或者昵称";
    searBar.delegate =self;
    searBar.tintColor =[UIColor grayColor];
    [searBar becomeFirstResponder];
    
    UIBarButtonItem *searchButton = [[UIBarButtonItem alloc]initWithCustomView:searBar];
    
    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObject:searchButton];
}

-(void)setupRightItem
{
    //Right
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancel)];
    //字体颜色
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSForegroundColorAttributeName] = [UIColor whiteColor];
    [rightBtn setTitleTextAttributes:dict forState:UIControlStateNormal];
    
    
    self.navigationItem.rightBarButtonItem = rightBtn;
    
}

- (void)cancel {
    [self.navigationController popViewControllerAnimated:YES];
}

//在这个方法中写搜索方法
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSLog(@"开始搜索");
}


@end
