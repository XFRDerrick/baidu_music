//
//  UNRadioDetailCVCell.m
//  MusicAPP
//
//  Created by universe on 2016/11/29.
//  Copyright © 2016年 universe. All rights reserved.
//

#import "UNRadioDetailCVCell.h"

@implementation UNRadioDetailCVCell

- (UIImageView *)iconImageView{

    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_iconImageView];
        [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(self.contentView).offset(20);
            make.right.equalTo(self.contentView).offset(-20);
            make.height.equalTo(_iconImageView.mas_width);
        }];
        //设置图片的渲染色
        _iconImageView.tintColor = kRGBA_COLOR(24, 190, 255, 1);
    }
    return _iconImageView;
}
- (UILabel *)iconTitleLable{

    if (!_iconTitleLable) {
        
        _iconTitleLable = [[UILabel alloc] init];
        _iconTitleLable.textAlignment = NSTextAlignmentCenter;
        _iconTitleLable.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:_iconTitleLable];
        [_iconTitleLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.iconImageView.mas_bottom).offset(10);
            make.left.right.equalTo(self.contentView);
        }];
        _iconTitleLable.textColor = kRGBA_COLOR(24, 190, 255, 1);
        
    }
    return _iconTitleLable;
}


@end
