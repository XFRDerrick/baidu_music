//
//  UNListTableViewCell.h
//  MusicAPP
//
//  Created by universe on 2016/11/22.
//  Copyright © 2016年 universe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UNListTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView *iconIV;
@property (nonatomic, strong) UIButton *iconBtn;

@property (nonatomic, strong) UILabel *titleLb;

@property (nonatomic, strong) UILabel *musicFirstLb;
@property (nonatomic, strong) UILabel *musicSecondLb;
@property (nonatomic, strong) UILabel *musicThirdLb;


@property (nonatomic, strong) UIImageView *musicFirstNum;
@property (nonatomic, strong) UIImageView *musicSecondNum;
@property (nonatomic, strong) UIImageView *musicThirdNum;

@end
