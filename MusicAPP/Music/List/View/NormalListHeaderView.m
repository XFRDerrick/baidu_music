//
//  NormalListHeaderView.m
//  MusicAPP
//
//  Created by universe on 2016/11/22.
//  Copyright © 2016年 universe. All rights reserved.
//

#import "NormalListHeaderView.h"

@interface NormalListHeaderView ()

@property (nonatomic, strong) UIView *headerPlayLoadView;
@property (nonatomic, strong) UILabel *playLable;

@end

@implementation NormalListHeaderView



#pragma mark 播放headerPlayLoadView

- (UIView *)headerPlayLoadView{
    
    if (!_headerPlayLoadView) {
        _headerPlayLoadView = [UIView new];
        _headerPlayLoadView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_headerPlayLoadView];
        [_headerPlayLoadView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.right.equalTo(self);
            make.height.mas_equalTo(44);
        }];
        //添加灰线视图
        UIImageView *lineView = [UIImageView new];
        lineView.image = [UIImage imageNamed:@"tableView_section_bg"];
        [_headerPlayLoadView addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.right.equalTo(_headerPlayLoadView);
            make.height.mas_equalTo(2);
        }];
    }
    return _headerPlayLoadView;
}
- (UIButton *)playButton{
    
    if (!_playButton) {
        _playButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.headerPlayLoadView addSubview:_playButton];
        [_playButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.headerPlayLoadView).offset(15);
            make.centerY.equalTo(self.headerPlayLoadView);
            make.size.mas_equalTo(CGSizeMake(21, 21));
        }];
        [_playButton setImage:[UIImage imageNamed:@"icon_bofang"] forState:UIControlStateNormal];
    }
    return _playButton;
}
- (UILabel *)playLable{
    
    if (!_playLable) {
        _playLable = [UILabel new];
        [_headerPlayLoadView addSubview:_playLable];
        [_playLable mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerY.equalTo(self.playButton);
            make.left.equalTo(self.playButton.mas_right).offset(2);
        }];
        _playLable.font = [UIFont systemFontOfSize:17];
        _playLable.text = @"播放全部";
    }
    return _playLable;
}
- (UILabel *)songsCountLb{
    if (!_songsCountLb) {
        _songsCountLb = [UILabel new];
        [self.headerPlayLoadView addSubview:_songsCountLb];
        [_songsCountLb mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.bottom.equalTo(self.playButton);
            make.left.equalTo(self.playLable.mas_right);
        }];
        _songsCountLb.font = [UIFont systemFontOfSize:14];
        _songsCountLb.textColor = [UIColor grayColor];
        _songsCountLb.text = @"/100首歌";
    }
    return _songsCountLb;
    
}
- (UIButton *)loadButton{
    if (!_loadButton) {
        _loadButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.headerPlayLoadView addSubview:_loadButton];
        [_loadButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.headerPlayLoadView).offset(-20);
            make.centerY.equalTo(self.headerPlayLoadView);
            make.size.mas_equalTo(CGSizeMake(46, 32));
        }];
        [_loadButton setImage:[UIImage imageNamed:@"bt_playlist_download_normal"] forState:UIControlStateNormal];
        [_loadButton setImage:[UIImage imageNamed:@"bt_playlist_download_press"] forState:UIControlStateHighlighted];
    }
    return _loadButton;
    
}

- (UILabel *)headerLable{

    if (!_headerLable) {
        _headerLable = [UILabel new];
        [self addSubview:_headerLable];
        [_headerLable mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.bottom.equalTo(self.headerPlayLoadView.mas_top).offset(-10);
            make.left.equalTo(self).offset(20);
        }];
        self.headerLable.text = @"更新时间：2016.11.22";
        self.headerLable.textColor = [UIColor whiteColor];
    }
    return _headerLable;
}

//- (instancetype)init
//{
//    self = [super init];
//    if (self) {
//        [self songsCountLb];
//        [self loadButton];
//        
//        [self headerLable];
//    }
//    return self;
//}

- (instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        [self songsCountLb];
        [self loadButton];
        [self headerLable];
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
