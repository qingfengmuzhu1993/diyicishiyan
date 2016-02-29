//
//  RootViewController.m
//  轮播图练习5
//
//  Created by lanou3g on 15/12/19.
//  Copyright © 2015年 wangzhi. All rights reserved.
//

#import "RootViewController.h"
#define SWidth CGRectGetWidth([UIScreen mainScreen].bounds)
#define SHeight CGRectGetHeight([UIScreen mainScreen].bounds)
@interface RootViewController ()<UIScrollViewDelegate>

@end

@implementation RootViewController
-(void)loadView{
    [super loadView];
    self.vc = [[RootView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view = self.vc;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.vc.scrollView.delegate = self;
    [self.vc.page addTarget:self action:@selector(pageAction) forControlEvents:UIControlEventValueChanged];
    // Do any additional setup after loading the view.
}
-(void)pageAction{
    self.vc.scrollView.contentOffset = CGPointMake(SWidth*self.vc.page.currentPage, 0);

}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    int a = self.vc.scrollView.contentOffset.x/SWidth;
    if (a<=8) {
        self.vc.page.currentPage = a -1;
    }
    if (a==8) {
        self.vc.scrollView.contentOffset = CGPointMake(0, 0);
    }
    if (a==0) {
         self.vc.page.currentPage = 7;
        self.vc.scrollView.contentOffset =CGPointMake(SWidth*8, 0);
    }


    
  
    
    
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
