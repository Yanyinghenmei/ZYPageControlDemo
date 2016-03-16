//
//  ZYPageControl.h
//  Lizard
//
//  Created by Daniel on 16/3/16.
//  Copyright © 2016年 Daniel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZYPageControl : UIView
@property (nonatomic, assign)NSInteger numberOfPages;
@property (nonatomic, assign)NSInteger currentPage;

@property (nonatomic, strong)UIColor *pageIndicatorTintColor;
@property (nonatomic, strong)UIColor *currentPageIndicatorTintColor;

- (instancetype)initWithFrame:(CGRect)frame indicatorWidth:(CGFloat)width indicatorGap:(CGFloat)gap;

@end
