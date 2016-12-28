//
//  UNListTableViewCell.m
//  MusicAPP
//
//  Created by universe on 2016/11/22.
//  Copyright © 2016年 universe. All rights reserved.
//

#import "UNListTableViewCell.h"

@interface UNListTableViewCell ()


@end


@implementation UNListTableViewCell


- (UIImageView *)iconIV{

    if (!_iconIV) {
        _iconIV = [UIImageView new];
        [self.contentView addSubview:_iconIV];
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.left.equalTo(self.contentView).offset(8);
            make.top.equalTo(self.contentView).offset(10);
            make.bottom.equalTo(self.contentView).offset(-10);
            make.width.equalTo(_iconIV.mas_height);
        }];
        _iconIV.image = [UIImage imageNamed:@"icon"];
        _iconIV.userInteractionEnabled = YES;
        
    }
    return _iconIV;
}

- (UIButton *)iconBtn{

    if (!_iconBtn) {
        _iconBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.iconIV addSubview:_iconBtn];
        [_iconBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(33, 33));
            make.right.bottom.equalTo(self.iconIV).offset(-2);
        }];
        
        [_iconBtn setImage:[UIImage imageNamed:@"ic_limg_play_normal"] forState:UIControlStateNormal];
        [_iconBtn setImage:[UIImage imageNamed:@"ic_limg_play_press"] forState:UIControlStateHighlighted];
//        [_iconBtn addTarget:self action:@selector(clickPlayButton:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _iconBtn;
}
//- (void)clickPlayButton:(UIButton *)sender{
//
//    NSLog(@"点击了图片上得播放按钮");
//}

- (UILabel *)titleLb{

    if (!_titleLb) {
        _titleLb = [UILabel new];
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.left.equalTo(self.iconIV.mas_right).offset(8);
            make.top.equalTo(self.iconIV);
//            make.height.mas_equalTo(33);
            
        }];
        _titleLb.font = [UIFont systemFontOfSize:17];
    }
    
    return _titleLb;
}

- (UIImageView *)musicFirstNum{

    if (!_musicFirstNum) {
        _musicFirstNum = [UIImageView new];
        [self.contentView addSubview:_musicFirstNum];
        [_musicFirstNum mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.bottom.equalTo(self.iconIV.mas_centerY);
//            make.top.equalTo(self.titleLb.mas_bottom);
            make.left.equalTo(self.iconIV.mas_right).offset(8);
            make.size.mas_equalTo(CGSizeMake(13, 15));
            
        }];
        _musicFirstNum.image = [UIImage imageNamed:@"img_list_1"];
    }
    return _musicFirstNum;
}

- (UILabel *)musicFirstLb{

    if (!_musicFirstLb) {
        _musicFirstLb = [UILabel new];
        [self.contentView addSubview:_musicFirstLb];
        [_musicFirstLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.musicFirstNum.mas_right).offset(2);
            make.centerY.equalTo(self.musicFirstNum);
        }];
        _musicFirstLb.font = [UIFont systemFontOfSize:12];
        _musicFirstLb.textColor = [UIColor grayColor];
    }
    return _musicFirstLb;
}

- (UIImageView *)musicSecondNum{
    if (!_musicSecondNum) {
        _musicSecondNum = [UIImageView new];
        [self.contentView addSubview:_musicSecondNum];
        [_musicSecondNum mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self.iconIV.mas_centerY).offset(2);
            make.left.equalTo(self.iconIV.mas_right).offset(8);
            make.size.mas_equalTo(CGSizeMake(13, 15));
            
        }];
        _musicSecondNum.image = [UIImage imageNamed:@"img_list_2"];
    }
    return _musicSecondNum;
}

- (UILabel *)musicSecondLb{

    if (!_musicSecondLb) {
        _musicSecondLb = [UILabel new];
        [self.contentView addSubview:_musicSecondLb];
        [_musicSecondLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.musicSecondNum);
            make.left.equalTo(self.musicSecondNum.mas_right).offset(2);
        }];
        _musicSecondLb.font = [UIFont systemFontOfSize:12];
        _musicSecondLb.textColor = [UIColor grayColor];
    }
    return _musicSecondLb;
}



- (UIImageView *)musicThirdNum{
    if (!_musicThirdNum) {
        _musicThirdNum = [UIImageView new];
        [self.contentView addSubview:_musicThirdNum];
        [_musicThirdNum mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self.musicSecondNum.mas_bottom).offset(2);
            make.left.equalTo(self.iconIV.mas_right).offset(8);
            make.size.mas_equalTo(CGSizeMake(13, 15));
            
        }];
        _musicThirdNum.image = [UIImage imageNamed:@"img_list_3"];
    }
    return _musicThirdNum;
    
}
- (UILabel *)musicThirdLb{
    if (!_musicThirdLb) {
        _musicThirdLb = [UILabel new];
        [self.contentView addSubview:_musicThirdLb];
        [_musicThirdLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.musicThirdNum);
            make.left.equalTo(self.musicThirdNum.mas_right).offset(2);
        }];
        _musicThirdLb.font = [UIFont systemFontOfSize:12];
        _musicThirdLb.textColor = [UIColor grayColor];
    }
    return _musicThirdLb;
    
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
