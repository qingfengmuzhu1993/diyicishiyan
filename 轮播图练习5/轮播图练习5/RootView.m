//
//  RootView.m
//  轮播图练习5
//
//  Created by lanou3g on 15/12/19.
//  Copyright © 2015年 wangzhi. All rights reserved.
//

#import "RootView.h"
#define SWidth CGRectGetWidth([UIScreen mainScreen].bounds)
#define SHeight CGRectGetHeight([UIScreen mainScreen].bounds)
@implementation RootView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
    }
    return self;
}
-(void)setupView{
    self.backgroundColor = [UIColor cyanColor];
    self.scrollView = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.scrollView.contentSize = CGSizeMake(SWidth*10, SHeight);
    self.scrollView.pagingEnabled =YES;
    self.scrollView.bounces = NO;
    self.backgroundColor =[UIColor blueColor];
    [self addSubview:self.scrollView];
    
    self.page =[[UIPageControl alloc] initWithFrame:CGRectMake(0, SHeight-50, SWidth, 50)];
    self.page.numberOfPages = 8;
    [self addSubview:self.page];
    [self addImage:self.scrollView];
    
    self.scrollView.contentOffset = CGPointMake(SWidth, 0);
    self.page.currentPage = 0;
    
    
    
}
-(void)addImage:(UIView *)view{
    for (int i = 0; i < 8; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(SWidth*(i+1), 0, SWidth, SHeight)];
        UIImage *image =[UIImage imageNamed:[NSString stringWithFormat:@"%d.jpeg",i]];
        imageView.image = image;
        [view addSubview:imageView];
    }
    UIImageView *imageView =[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SWidth, SHeight)];
    UIImage *image = [UIImage imageNamed:@"7.jpeg"];
    imageView.image = image;
    [view addSubview:imageView];
    
    UIImageView *imageView2 =[[UIImageView alloc] initWithFrame:CGRectMake(SWidth*9, 0, SWidth, SHeight)];
    UIImage *image2 = [UIImage imageNamed:@"0.jpeg"];
    imageView2.image = image2;
    [view addSubview:imageView2];

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
