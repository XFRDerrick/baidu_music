//
//  MainBottomVIew.m
//  MusicAPP
//
//  Created by universe on 2016/11/23.
//  Copyright © 2016年 universe. All rights reserved.
//

#import "MainBottomVIew.h"

@implementation MainBottomVIew

- (UIImageView *)iconIV{

    if (!_iconIV) {
        _iconIV = [UIImageView new];
        [self addSubview:_iconIV];
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
        
            make.left.top.bottom.equalTo(self);
            make.width.equalTo(_iconIV.mas_height);
        }];
        _iconIV.image = [UIImage imageNamed:@"mengjia"];
        
    }
    return _iconIV;
}
- (UILabel *)musicName{

    if (!_musicName) {
        _musicName = [UILabel new];
        [self addSubview:_musicName];
        [_musicName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconIV.mas_right).offset(8);
            make.bottom.equalTo(self.mas_centerY);
        }];
        _musicName.font = [UIFont systemFontOfSize:15];
        _musicName.textColor = [UIColor blackColor];
        
        
    }
    return _musicName;
}

- (UILabel *)singer{
    if (!_singer) {
        _singer = [UILabel new];
        [self addSubview:_singer];
        [_singer mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconIV.mas_right).offset(8);
            make.top.equalTo(self.mas_centerY);
        }];
        _singer.font = [UIFont systemFontOfSize:10];
        _singer.textColor = [UIColor grayColor];
    }
    return _singer;
}

- (UIButton *)musicListButton{

    if (!_musicListButton) {
        _musicListButton = [UIButton new];
        [self addSubview:_musicListButton];
        [_musicListButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.right.equalTo(self).offset(-30);
            make.size.mas_equalTo(CGSizeMake(30, 30));
        }];
        [_musicListButton setImage:[UIImage imageNamed:@"btn_list"] forState:UIControlStateNormal];
    }
    return _musicListButton;
}

- (UIButton *)nextButton{
    if (!_nextButton) {
        _nextButton = [UIButton new];
        [self addSubview:_nextButton];
        [_nextButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.right.equalTo(self.musicListButton.mas_left).offset(-20);
            make.size.mas_equalTo(CGSizeMake(30, 30));
        }];
        [_nextButton setImage:[UIImage imageNamed:@"btn_next"] forState:UIControlStateNormal];
    }
    return _nextButton;
    
}
- (UIButton *)playPauseButton{
    if (!_playPauseButton) {
        _playPauseButton = [UIButton new];
        [self addSubview:_playPauseButton];
        [_playPauseButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.right.equalTo(self.nextButton.mas_left).offset(-20);
            make.size.mas_equalTo(CGSizeMake(30, 30));
        }];
        _playPauseButton.selected = NO;
        [_playPauseButton setImage:[UIImage imageNamed:@"btn_bofang"] forState:UIControlStateNormal];
        [_playPauseButton setImage:[UIImage imageNamed:@"btn_zanting"] forState:UIControlStateSelected];
    }
    return _playPauseButton;
    
}

- (UIButton *)coverButton{
    if (!_coverButton) {
        _coverButton = [UIButton new];
        [self addSubview:_coverButton];
        [_coverButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsZero);
        }];
        
        _coverButton.backgroundColor = [UIColor clearColor];
    }
    return _coverButton;
    
}





/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
