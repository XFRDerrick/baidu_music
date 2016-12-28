//
//  UNSongListHeaderView.m
//  MusicAPP
//
//  Created by universe on 2016/11/23.
//  Copyright © 2016年 universe. All rights reserved.
//

#import "UNSongListHeaderView.h"

@interface UNSongListHeaderView ()

@property (nonatomic, strong) UIView *lineView;

@end

@implementation UNSongListHeaderView

- (UILabel *)allLable{

    if (!_allLable) {
        _allLable = [UILabel new];
        [self addSubview:_allLable];
        [_allLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(20);
            make.centerY.equalTo(self);
        }];
        _allLable.text = @"全部歌单";
        
    }
    return _allLable;
}
- (UIButton *)selectButton{

    if (!_selectButton) {
        _selectButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_selectButton];
        [_selectButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.allLable.mas_right).offset(5);
            make.centerY.equalTo(self);
            
        }];
        [_selectButton setImage:[UIImage imageNamed:@"bt_playlist_choice_normal"] forState:UIControlStateNormal];
        [_selectButton setImage:[UIImage imageNamed:@"bt_playlist_choice_press"] forState:UIControlStateHighlighted];
    }
    return _selectButton;
}

- (UIButton *)nearSongButton{
    
    if (!_nearSongButton) {
        _nearSongButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_nearSongButton];
        _nearSongButton.titleLabel.text = @"最新";
        [_nearSongButton setTitle:@"最新" forState:UIControlStateNormal];
        [_nearSongButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(-20);
            make.centerY.equalTo(self);
        }];

        [_nearSongButton setTitleColor:[UIColor colorWithRed:88/255.0 green:179/255.0 blue:252/255.0 alpha:1] forState:UIControlStateSelected];
        [_nearSongButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        [_hotButton setTitleColor:kRGBA_COLOR(88, 179, 252, 1) forState:UIControlStateHighlighted;
        
        _nearSongButton.selected = NO;
        
    }
    
    return _nearSongButton;
    
}
//分割线
- (UIView *)lineView{

    if (!_lineView) {
        _lineView = [UIView new];
        _lineView.backgroundColor = [UIColor grayColor];
        [self addSubview:_lineView];
        [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.top.equalTo(self).offset(13);
            make.right.equalTo(self.nearSongButton.mas_left).offset(-8);
            make.width.mas_equalTo(1);
        }];
        
    }
    return _lineView;
}

- (UIButton *)hotButton{
    if (!_hotButton) {
        _hotButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [self addSubview:_hotButton];
        [_hotButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.lineView.mas_left).offset(-8);
            make.centerY.equalTo(self);
        }];
        [_hotButton setTitle:@"最热" forState:UIControlStateNormal];
//        [_hotButton setTitle:@"最热" forState:UIControlStateHighlighted];
        [_hotButton setTitleColor:[UIColor colorWithRed:88/255.0 green:179/255.0 blue:252/255.0 alpha:1] forState:UIControlStateSelected];
        [_hotButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
        _hotButton.selected = !self.nearSongButton.selected;
    }
    return _hotButton;

    
}

- (id)copyWithZone:(NSZone *)zone{

    UNSongListHeaderView *songHeaderView = [[UNSongListHeaderView allocWithZone:zone] init];
    return songHeaderView;

}




@end
