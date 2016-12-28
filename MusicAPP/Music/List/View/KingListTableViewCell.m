//
//  KingListTableViewCell.m
//  MusicAPP
//
//  Created by universe on 2016/11/23.
//  Copyright © 2016年 universe. All rights reserved.
//

#import "KingListTableViewCell.h"

@interface KingListTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconIV;
@property (weak, nonatomic) IBOutlet UILabel *singerLable;
@property (weak, nonatomic) IBOutlet UILabel *songsNameLable;

//热度
@property (weak, nonatomic) IBOutlet UILabel *feverLable;
@property (weak, nonatomic) IBOutlet UIImageView *feverImage;
//打榜按钮
@property (weak, nonatomic) IBOutlet UIButton *fireBurningButton;

@property (weak, nonatomic) IBOutlet UIImageView *levelImageView;
@property (weak, nonatomic) IBOutlet UIImageView *kingIcon;

@end

@implementation KingListTableViewCell

- (void)setModel:(UNListSongListModel *)model{
    _model = model;
    //为VIew赋值
    [self.iconIV setImageURL:[NSURL URLWithString:model.pic_small]];
    self.songsNameLable.text = model.title;
    self.singerLable.text = model.author;
    self.feverLable.text = [NSString stringWithFormat:@"%.ld",model.score];
    
    self.feverImage.image = model.score_change != -1 ? [UIImage imageNamed:@"icon_king_rise"] : [UIImage imageNamed:@"icon_king_drop"];

}

- (void)setIndexPath:(NSIndexPath *)indexPath{
    
    _indexPath = indexPath;
    
    self.kingIcon.hidden = YES;
    UIImage *image = [UIImage imageNamed:@""];
    
    if (indexPath.row == 0) {
        image = [UIImage imageNamed:@"img_king_list_no1"];
    }
    
    if (indexPath.row == 1) {
        image = [UIImage imageNamed:@"img_king_list_no2"];
        self.kingIcon.hidden = NO;
    }
    
    if (indexPath.row == 2) {
        image = [UIImage imageNamed:@"img_king_list_no3"];
    }
    
    self.levelImageView.image = image;
//    self.iconTopLable.text = [NSString stringWithFormat:@"%02ld",(long)indexPath.row + 1];
    
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
