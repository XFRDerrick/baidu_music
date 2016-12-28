//
//  UNSongListCVCell.m
//  MusicAPP
//
//  Created by universe on 2016/11/23.
//  Copyright © 2016年 universe. All rights reserved.
//

#import "UNSongListCVCell.h"

@implementation UNSongListCVCell

- (UIImageView *)posterImageView{

    if (!_posterImageView) {
        _posterImageView  = [UIImageView new];
        [self.contentView addSubview:_posterImageView];
        [_posterImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.equalTo(self.contentView);
            make.height.equalTo(_posterImageView.mas_width);
        }];
        _posterImageView.userInteractionEnabled = YES;
//        _posterImageView.image = [UIImage imageNamed:@""];
        
    }
    return _posterImageView;
}
- (UIButton *)playButton{

    if (!_playButton) {
        _playButton = [UIButton new];
        [self.posterImageView addSubview:_playButton];
        [_playButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.bottom.equalTo(self.posterImageView).offset(-10);
            make.size.mas_equalTo(22);
        }];
        [_playButton setImage:[UIImage imageNamed:@"ic_limg_play_normal"] forState:UIControlStateNormal];
        [_playButton setImage:[UIImage imageNamed:@"ic_limg_play_press"] forState:UIControlStateHighlighted];
    }
    return _playButton;
}

- (UILabel *)titleLable{

    if (!_titleLable) {
        _titleLable = [UILabel new];
        [self.contentView addSubview:_titleLable];
        [_titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.contentView);
            make.top.equalTo(self.posterImageView.mas_bottom).offset(5);
        }];
        
        _titleLable.font = [UIFont systemFontOfSize:12];
        _titleLable.numberOfLines = 2;
    }
    return _titleLable;
}
- (UILabel *)creatorLable{

    if (!_creatorLable) {
        _creatorLable = [UILabel new];
        [self.contentView addSubview:_creatorLable];
        [_creatorLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.contentView);
            make.top.equalTo(self.titleLable.mas_bottom).offset(2);
        }];
        _creatorLable.font = [UIFont systemFontOfSize:10];
        _creatorLable.textColor = [UIColor lightGrayColor];
    }
    return _creatorLable;
}


- (UILabel *)listenNumLable{

    if (!_listenNumLable) {
        _listenNumLable = [UILabel new];
        [self.posterImageView addSubview:_listenNumLable];
        [_listenNumLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.posterImageView).offset(3);
            make.bottom.equalTo(self.posterImageView).offset(-3);
        }];
        _listenNumLable.font = [UIFont systemFontOfSize:8];
        _listenNumLable.textColor = [UIColor whiteColor];
        
        
    }
    return _listenNumLable;
}
@end
