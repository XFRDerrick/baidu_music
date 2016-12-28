//
//  UNSongListHeaderView.h
//  MusicAPP
//
//  Created by universe on 2016/11/23.
//  Copyright © 2016年 universe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UNSongListHeaderView : UIView<NSCopying>

@property (nonatomic, strong) UILabel *allLable;
@property (nonatomic, strong) UIButton *selectButton;

@property (nonatomic, strong) UIButton *hotButton;
@property (nonatomic, strong) UIButton *nearSongButton;

@end
