//
//  KingHeaderView.h
//  MusicAPP
//
//  Created by universe on 2016/11/22.
//  Copyright © 2016年 universe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KingHeaderView : UIView
//视图View  更新时间未做
@property (nonatomic, strong) UIButton *playButton;
//@property (nonatomic, strong) UILabel *countdownBoardLable;
@property (nonatomic, strong) UILabel *dateLable;

//播放下载条按钮
@property (nonatomic, strong) UIButton *downLoadButton;
@property (nonatomic, strong) UIButton *ruleButton;
@property (nonatomic, strong) UIButton *periodSelectButton;
@property (nonatomic, strong) UILabel *periodShowLable;

@end
