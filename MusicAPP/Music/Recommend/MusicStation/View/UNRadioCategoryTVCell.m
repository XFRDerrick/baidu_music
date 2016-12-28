//
//  UNRadioCategoryTVCell.m
//  MusicAPP
//
//  Created by universe on 2016/11/29.
//  Copyright © 2016年 universe. All rights reserved.
//

#import "UNRadioCategoryTVCell.h"

@implementation UNRadioCategoryTVCell

- (UILabel *)categoryTitle{

    if (!_categoryTitle) {
        _categoryTitle = [[UILabel alloc] init];
        _categoryTitle.textColor = kRGBA_COLOR(130, 130, 130, 1);
        //设置标签高亮颜色
        _categoryTitle.highlightedTextColor = kRGBA_COLOR(24, 190, 255, 1);
        _categoryTitle.font = [UIFont systemFontOfSize:18];
        _categoryTitle.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_categoryTitle];
        [_categoryTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsZero);
        }];
    }
    return _categoryTitle;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
