//
//  ViewController.m
//  ZYPageControlDemo
//
//  Created by Daniel on 16/3/16.
//  Copyright © 2016年 Daniel. All rights reserved.
//

#import "ViewController.h"
#import "ZYPageControl.h"

@interface ViewController ()<UIScrollViewDelegate>

@end

@implementation ViewController {
    ZYPageControl *pageControl;
    ZYPageControl *pageControl1;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 200, self.view.frame.size.width, 200)];
    [self.view addSubview:scrollView];
    scrollView.delegate = self;
    scrollView.pagingEnabled = YES;
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width*4, 200);
    
    NSArray *colors = @[[UIColor redColor], [UIColor blueColor], [UIColor yellowColor], [UIColor cyanColor]];
    for (int i = 0; i < 4; i++) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.size.width*i, 0, self.view.frame.size.width, 200)];
        [scrollView addSubview:view];
        view.backgroundColor = colors[i];
    }
    
    pageControl = [[ZYPageControl alloc] initWithFrame:CGRectMake(0, 450, self.view.frame.size.width, 30)];
    [self.view addSubview:pageControl];
    pageControl.numberOfPages = 4;
    
    
    pageControl1 = [[ZYPageControl alloc] initWithFrame:CGRectMake(0, 510, self.view.frame.size.width, 50) indicatorWidth:20 indicatorGap:20 indicatorClick:^(NSInteger index) {
        NSLog(@"%ld", index);
        [scrollView scrollRectToVisible:CGRectMake(scrollView.frame.size.width*index, 0, scrollView.frame.size.width, scrollView.frame.size.height) animated:true];
    }];
    [self.view addSubview:pageControl1];
    pageControl1.pageIndicatorBorderColoer = [UIColor orangeColor];
    pageControl1.pageIndicatorTintColor = [UIColor orangeColor];
    pageControl1.currentPageIndicatorTintColor = [UIColor whiteColor];
    pageControl1.currentPageIndicatorBorderColor = [UIColor orangeColor];
    pageControl1.numberOfPages = 4;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    pageControl.currentPage = scrollView.contentOffset.x/self.view.frame.size.width;
    pageControl1.currentPage = pageControl.currentPage;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
