//
//  KingHeaderView.m
//  MusicAPP
//
//  Created by universe on 2016/11/22.
//  Copyright © 2016年 universe. All rights reserved.
//

#import "KingHeaderView.h"

@interface KingHeaderView ()

@property (nonatomic, strong) UIView *headerSelectLoadView;
@end

@implementation KingHeaderView

#pragma mark 懒加载视图
- (UIView *)headerSelectLoadView{

    if (!_headerSelectLoadView) {
        _headerSelectLoadView = [UIView new];
        [self addSubview:_headerSelectLoadView];
        [_headerSelectLoadView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(self);
            make.height.mas_equalTo(44);
        }];
        _headerSelectLoadView.backgroundColor = [UIColor whiteColor];
        //添加灰线视图
        UIImageView *lineView = [UIImageView new];
        lineView.image = [UIImage imageNamed:@"tableView_section_bg"];
        [_headerSelectLoadView addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.right.equalTo(_headerSelectLoadView);
            make.height.mas_equalTo(2);
        }];
    }
    return _headerSelectLoadView;
}
- (UILabel *)periodShowLable{

    if (!_periodShowLable) {
        _periodShowLable = [UILabel new];
        [self.headerSelectLoadView addSubview:_periodShowLable];
        [_periodShowLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.headerSelectLoadView);
            make.left.equalTo(self.headerSelectLoadView).offset(20);
        }];
        _periodShowLable.font = [UIFont systemFontOfSize:17];
        _periodShowLable.text = @"2016年第47期";
    }
    return _periodShowLable;
    
}
- (UIButton *)periodSelectButton{

    if (!_periodSelectButton) {
        
        _periodSelectButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.headerSelectLoadView addSubview:_periodSelectButton];
        [_periodSelectButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.periodShowLable);
            make.left.equalTo(self.periodShowLable.mas_right).offset(2);
        }];
        [_periodSelectButton setImage:[UIImage imageNamed:@"bt_playlist_choice_normal"] forState:UIControlStateNormal];
        [_periodSelectButton setImage:[UIImage imageNamed:@"bt_playlist_choice_press"] forState:UIControlStateHighlighted];
        
    }
    return _periodSelectButton;

    
}
- (UIButton *)downLoadButton{

    if (!_downLoadButton) {
        
        _downLoadButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.headerSelectLoadView addSubview:_downLoadButton];
        [_downLoadButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.headerSelectLoadView);
            make.right.equalTo(self.headerSelectLoadView).offset(-20);
        }];
        [_downLoadButton setImage:[UIImage imageNamed:@"bt_playlist_download_normal"] forState:UIControlStateNormal];
        [_downLoadButton setImage:[UIImage imageNamed:@"bt_playlist_download_press"] forState:UIControlStateHighlighted];
        
    }
    return _downLoadButton;
}

- (UIButton *)ruleButton{

    if (!_ruleButton) {
        
        _ruleButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.headerSelectLoadView addSubview:_ruleButton];
        [_ruleButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.headerSelectLoadView);
            make.right.equalTo(self.downLoadButton.mas_left).offset(-20);
        }];
        [_ruleButton setImage:[UIImage imageNamed:@"bt_playlist_king_normal"] forState:UIControlStateNormal];
        [_ruleButton setImage:[UIImage imageNamed:@"bt_playlist_king_pressl"] forState:UIControlStateHighlighted];
        
    }
    return _ruleButton;
}

// 上部视图
- (UILabel *)dateLable{

    if (!_dateLable) {
        _dateLable = [UILabel new];
        [self addSubview:_dateLable];
        _dateLable.backgroundColor = [UIColor clearColor];
        _dateLable.textColor = [UIColor whiteColor];
        _dateLable.font = [UIFont systemFontOfSize:14];
        [_dateLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(20);
            make.bottom.equalTo(self.headerSelectLoadView.mas_top).offset(-8);
        }];
        _dateLable.text = @"11.21-11.27";
        
    }
    return _dateLable;
}

- (UIButton *)playButton{

    if (!_playButton) {
        _playButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_playButton];
        [_playButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(-25);
            make.bottom.equalTo(self.headerSelectLoadView.mas_top).offset(-25);
            make.size.mas_equalTo(CGSizeMake(44, 44));
        }];
        [_playButton setImage:[UIImage imageNamed:@"bt_playlist_play_normal"] forState:UIControlStateNormal];
        [_playButton setImage:[UIImage imageNamed:@"bt_playlist_play_press"] forState:UIControlStateHighlighted];
    }
    return _playButton;
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self periodSelectButton];
        [self ruleButton];
        
        [self dateLable];
        [self playButton];
        
    }
    return self;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
