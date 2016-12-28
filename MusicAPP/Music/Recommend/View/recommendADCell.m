//
//  recommendADCell.m
//  MusicAPP
//
//  Created by universe on 2016/11/24.
//  Copyright © 2016年 universe. All rights reserved.
//

#import "recommendADCell.h"

@implementation recommendADCell

- (iCarousel *)ic{

    if (!_ic) {
        
        _ic = [[iCarousel alloc] init];
        [self.contentView addSubview:_ic];
        [_ic mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsZero);
        }];
        //设置滚动样式
        _ic.type = iCarouselTypeLinear;
        //设置滚动速度
        _ic.scrollSpeed = 0;
        
    }
    
    return _ic;
}

- (UIPageControl *)pageControl{

    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc] init];
        [self.ic addSubview:_pageControl];
        [_pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(self.ic);
            make.height.mas_equalTo(20);
        }];
        _pageControl.pageIndicatorTintColor = [UIColor whiteColor];
        _pageControl.currentPageIndicatorTintColor = kRGBA_COLOR(24, 190, 254, 1);
        
    }
    return _pageControl;
}

@end
