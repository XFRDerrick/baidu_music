//
//  UNListDetailTableViewCell.m
//  MusicAPP
//
//  Created by universe on 2016/11/22.
//  Copyright © 2016年 universe. All rights reserved.
//

#import "UNListDetailTableViewCell.h"

@interface UNListDetailTableViewCell ()

#pragma mark 约束设置
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *singerLableLayoutConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *kingIVLayoutConstraint;

#pragma mark 子视图
@property (weak, nonatomic) IBOutlet UIImageView *iconIV;
@property (weak, nonatomic) IBOutlet UILabel *MusicNameLable;
@property (weak, nonatomic) IBOutlet UIImageView *mtvIV;
@property (weak, nonatomic) IBOutlet UIImageView *kingIV;

@property (weak, nonatomic) IBOutlet UIImageView *sqIV;
@property (weak, nonatomic) IBOutlet UILabel *singerLable;
//自定义按钮
@property (weak, nonatomic) IBOutlet UIButton *accessaryBtn;
@property (weak, nonatomic) IBOutlet UIButton *playlistOKBtn;

//icon 覆盖视图
@property (weak, nonatomic) IBOutlet UIImageView *iconTopIV;
@property (weak, nonatomic) IBOutlet UILabel *iconTopLable;


@end

@implementation UNListDetailTableViewCell

- (void)setModel:(UNListSongListModel *)model{
    _model = model;
    //为VIew赋值
    [self.iconIV setImageURL:[NSURL URLWithString:model.pic_small]];
    self.MusicNameLable.text = model.title;
    self.singerLable.text = model.author;
    
}

//设置固定的覆盖视图
- (void)setIndexPath:(NSIndexPath *)indexPath{

    _indexPath = indexPath;
    
    UIImage *image = [UIImage imageNamed:@"img_king_mask1"];
 
    if (indexPath.row == 0) {
        image = [UIImage imageNamed:@"img_king_mask01"];
    }
    
    if (indexPath.row == 1) {
        image = [UIImage imageNamed:@"img_king_mask02"];
    }
    
    if (indexPath.row == 2) {
         image = [UIImage imageNamed:@"img_king_mask03"];
    }
    
    self.iconTopIV.image = image;
    self.iconTopLable.text = [NSString stringWithFormat:@"%02ld",(long)indexPath.row + 1];
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
