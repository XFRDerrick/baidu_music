//
//  UNKSongMusicCVCell.m
//  MusicAPP
//
//  Created by universe on 2016/11/23.
//  Copyright © 2016年 universe. All rights reserved.
//

#import "UNKSongMusicCVCell.h"

@interface UNKSongMusicCVCell ()
@property (weak, nonatomic) IBOutlet UIImageView *singerIcon;
@property (weak, nonatomic) IBOutlet UILabel *songDetailLable;
@property (weak, nonatomic) IBOutlet UILabel *kSongCount;



@end

@implementation UNKSongMusicCVCell


- (void)setSingerImageName:(NSString *)singerImageName{
    _singerImageName = singerImageName;
    [self.singerIcon setImageURL:[NSURL URLWithString:singerImageName]];//= [UIImage imageNamed:singerImageName];
}
- (void)setSongDetail:(NSString *)songDetail{
    _songDetail = songDetail;
    self.songDetailLable.text = songDetail;
}
- (void)setKSongCt:(NSString *)kSongCt{
    _kSongCt = kSongCt;
    self.kSongCount.text = [NSString stringWithFormat:@"%@人唱过",kSongCt];
}

- (IBAction)clickKSongButton:(UIButton *)sender {
    
    NSLog(@"点击了点唱按钮");
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
