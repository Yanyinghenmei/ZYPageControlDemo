//
//  ZYPageControl.h
//  Lizard
//
//  Created by Daniel on 16/3/16.
//  Copyright © 2016年 Daniel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZYPageControl : UIView

// 设置页数
@property (nonatomic, assign)NSInteger numberOfPages;

// 当前选中页数
@property (nonatomic, assign)NSInteger currentPage;

// 小点颜色设置
@property (nonatomic, strong)UIColor *pageIndicatorTintColor;
@property (nonatomic, strong)UIColor *pageIndicatorBorderColoer;

@property (nonatomic, strong)UIColor *currentPageIndicatorTintColor;
@property (nonatomic, strong)UIColor *currentPageIndicatorBorderColor;

- (instancetype)initWithFrame:(CGRect)frame indicatorWidth:(CGFloat)width indicatorGap:(CGFloat)gap;

@end
