//
//  NormalListHeaderView.h
//  MusicAPP
//
//  Created by universe on 2016/11/22.
//  Copyright © 2016年 universe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NormalListHeaderView : UIView

//表头视图
@property (nonatomic, strong) UILabel *headerLable;
//播放视图_子视图

@property (nonatomic, strong) UIButton *playButton;

@property (nonatomic, strong) UIButton *loadButton;
@property (nonatomic, strong) UILabel *songsCountLb;


@end
