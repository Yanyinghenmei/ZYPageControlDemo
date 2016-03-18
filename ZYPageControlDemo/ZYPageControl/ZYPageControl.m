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
        indicatorWidth = 5;
        indicatorGap = 5;
    }
    return self;
}

- (void)initProperty {
    _pageIndicatorTintColor = [UIColor whiteColor];
    _currentPageIndicatorTintColor = [UIColor blackColor];
    _currentPage = 0;
    indicators = @[].mutableCopy;
}

- (void)setNumberOfPages:(NSInteger)numberOfPages {
    
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    _numberOfPages = numberOfPages;
    
    for (int i = 0; i < numberOfPages; i++) {
        UIView *indicator = [self pagePointWithWidth:indicatorWidth];
        if (i == _currentPage) {
            currentIndicator = indicator;
            indicator.backgroundColor = _currentPageIndicatorTintColor;
        }
        
        double number = (double)(numberOfPages-1.0f);
        CGFloat offset = (i - number/2) * (indicatorWidth+indicatorGap);
        
        indicator.center = CGPointMake(self.center.x + offset, self.center.y);
        [self.superview addSubview:indicator];
        
        [indicators addObject:indicator];
        
        // .使用center 需要这样来写.  A.center = B.center 指的是A和B在父view的中心坐标相同
        // .如果将A或B成为对方的父view, 那么在屏幕上, A和B的中心不重合
        //indicator.center = CGPointMake(self.frame.size.width/2 + offset, self.frame.size.height/2);
        //[self. addSubview:indicator];
    }
}

- (UIView *)pagePointWithWidth:(CGFloat)width {
    UIView *indicator = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, width)];
    indicator.backgroundColor = _pageIndicatorTintColor;
    
    indicator.layer.cornerRadius = width/2;
    indicator.clipsToBounds = YES;
    
    indicator.layer.borderColor = _currentPageIndicatorTintColor.CGColor;
    indicator.layer.borderWidth = width/10;
    return indicator;
}

- (void)setPageIndicatorTintColor:(UIColor *)pageIndicatorTintColor {
    _pageIndicatorTintColor = pageIndicatorTintColor;
    for (UIView *indicator in indicators) {
        indicator.backgroundColor = pageIndicatorTintColor;
    }
}

- (void)setCurrentPageIndicatorTintColor:(UIColor *)currentPageIndicatorTintColor {
    _currentPageIndicatorTintColor = currentPageIndicatorTintColor;
    if (currentIndicator) {
        currentIndicator.backgroundColor = currentPageIndicatorTintColor;
    }
    
    for (UIView *indicator in indicators) {
        indicator.layer.borderColor = _currentPageIndicatorTintColor.CGColor;
    }
}

- (void)setCurrentPage:(NSInteger)currentPage {
    if (currentPage>=indicators.count) {
        currentPage = indicators.count-1;
    }
    _currentPage = currentPage;
    if (currentIndicator) {
        currentIndicator.backgroundColor = _pageIndicatorTintColor;
        currentIndicator = indicators[currentPage];
        currentIndicator.backgroundColor = _currentPageIndicatorTintColor;
    }
}

@end
