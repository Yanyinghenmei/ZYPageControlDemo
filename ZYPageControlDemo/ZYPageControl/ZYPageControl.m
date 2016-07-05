//
//  ZYPageControl.m
//  Lizard
//
//  Created by Daniel on 16/3/16.
//  Copyright © 2016年 Daniel. All rights reserved.
//

#import "ZYPageControl.h"

@implementation ZYPageControl {
    UIView *currentIndicator;
    NSMutableArray *indicators;
    
    CGFloat indicatorWidth;
    CGFloat indicatorGap;
}

- (instancetype)initWithFrame:(CGRect)frame indicatorWidth:(CGFloat)width indicatorGap:(CGFloat)gap {
    if (self = [super initWithFrame:frame]) {
        indicatorWidth = width;
        indicatorGap = gap;
        [self initProperty];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initProperty];
        
        // 默认的小点宽度和间距
        indicatorWidth = 5;
        indicatorGap = 5;
    }
    return self;
}

// 初始化默认数据
- (void)initProperty {
    _pageIndicatorTintColor = [UIColor whiteColor];
    _pageIndicatorBorderColoer = [UIColor blackColor];
    
    _currentPageIndicatorTintColor = [UIColor blackColor];
    _currentPageIndicatorBorderColor = [UIColor blackColor];
    _currentPage = 0;
    indicators = @[].mutableCopy;
}

- (void)setNumberOfPages:(NSInteger)numberOfPages {
    
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    _numberOfPages = numberOfPages;
    indicators = @[].mutableCopy;
    
    for (int i = 0; i < numberOfPages; i++) {
        UIView *indicator = [self pagePointWithWidth:indicatorWidth];
        if (i == _currentPage) {
            currentIndicator = indicator;
            indicator.backgroundColor = _currentPageIndicatorTintColor;
            indicator.layer.borderColor = _currentPageIndicatorBorderColor.CGColor;
        }
        
        double number = (double)(numberOfPages-1.0f);
        CGFloat offset = (i - number/2) * (indicatorWidth+indicatorGap);
        
        indicator.center = CGPointMake(self.frame.size.width/2 + offset, self.frame.size.height/2);
        [self addSubview:indicator];
        
        [indicators addObject:indicator];
        
        // .使用center A.center = B.center 指的是A和B在父view的中心坐标相同
        // .如果将A或B成为对方的父view, 那么在屏幕上, A和B的中心不重合
        //indicator.center = CGPointMake(self.frame.size.width/2 + offset, self.frame.size.height/2);
        //[self. addSubview:indicator];
    }
}

// 定制指示器
- (UIView *)pagePointWithWidth:(CGFloat)width {
    UIView *indicator = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, width)];
    indicator.backgroundColor = _pageIndicatorTintColor;
    
    indicator.layer.cornerRadius = width/2;
    indicator.clipsToBounds = YES;
    
    indicator.layer.borderColor = _pageIndicatorBorderColoer.CGColor;
    indicator.layer.borderWidth = width/10;
    return indicator;
}

// 修改未选中背景颜色
- (void)setPageIndicatorTintColor:(UIColor *)pageIndicatorTintColor {
    _pageIndicatorTintColor = pageIndicatorTintColor;
    for (UIView *indicator in indicators) {
        indicator.backgroundColor = pageIndicatorTintColor;
    }
}

// 修改未选中边框颜色
- (void)setPageIndicatorBorderColoer:(UIColor *)pageIndicatorBorderColoer {
    _pageIndicatorBorderColoer = pageIndicatorBorderColoer;
    for (UIView *indicator in indicators) {
        indicator.layer.borderColor = pageIndicatorBorderColoer.CGColor;
    }
}

// 设置选中背景色
- (void)setCurrentPageIndicatorTintColor:(UIColor *)currentPageIndicatorTintColor {
    _currentPageIndicatorTintColor = currentPageIndicatorTintColor;
    if (currentIndicator) {
        currentIndicator.backgroundColor = currentPageIndicatorTintColor;
    }
}

// ...选中边框颜色
- (void)setCurrentPageIndicatorBorderColor:(UIColor *)currentPageIndicatorBorderColor {
    _currentPageIndicatorBorderColor = currentPageIndicatorBorderColor;
    if (currentIndicator) {
        currentIndicator.layer.borderColor = currentPageIndicatorBorderColor.CGColor;
    }
}

// 选中状态修改
- (void)setCurrentPage:(NSInteger)currentPage {
    if (currentPage>=indicators.count) {
        currentPage = indicators.count-1;
    }
    _currentPage = currentPage;
    if (currentIndicator) {
        currentIndicator.backgroundColor = _pageIndicatorTintColor;
        currentIndicator.layer.borderColor = _pageIndicatorBorderColoer.CGColor;
        
        currentIndicator = indicators[currentPage];
        currentIndicator.backgroundColor = _currentPageIndicatorTintColor;
        currentIndicator.layer.borderColor = _currentPageIndicatorBorderColor.CGColor;
    }
}

@end
