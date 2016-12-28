//
//  UNSongListCVCell.h
//  MusicAPP
//
//  Created by universe on 2016/11/23.
//  Copyright © 2016年 universe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UNSongListCVCell : UICollectionViewCell

@property (nonatomic, strong) UIImageView *posterImageView;

@property (nonatomic, strong) UILabel *titleLable;
@property (nonatomic, strong) UILabel *creatorLable;
//图片上
@property (nonatomic, strong) UIButton *playButton;
@property (nonatomic, strong) UILabel *listenNumLable;


@end
