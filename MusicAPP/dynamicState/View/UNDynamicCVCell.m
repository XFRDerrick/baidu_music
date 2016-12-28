//
//  UNDynamicCVCell.m
//  MusicAPP
//
//  Created by universe on 2016/12/23.
//  Copyright © 2016年 universe. All rights reserved.
//

#import "UNDynamicCVCell.h"

@interface UNDynamicCVCell ()

@property (nonatomic, strong) YYTextView *textView;



@end

@implementation UNDynamicCVCell




- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.authorImage.layer.cornerRadius = self.authorImage.bounds.size.width * 0.5;
    self.authorImage.layer.masksToBounds = YES;
    
}

- (void)setMsgModel:(UNDynamicStateMsgModel *)msgModel{

    _msgModel = msgModel;
    [self.authorImage setImageURL:[NSURL URLWithString:msgModel.author.userpic_small]];
    self.authorName.text = msgModel.author.username;
    self.timeLable.text = msgModel.needTime;
    
    //评论 转发 点赞 设置
    if (msgModel.share_num > 0) {
        [self.repostBtn setTitle:[NSString stringWithFormat:@"%ld",msgModel.share_num] forState:UIControlStateNormal];
    }
    if (msgModel.comment_num > 0) {
        [self.commentBtn setTitle:[NSString stringWithFormat:@"%ld",msgModel.comment_num] forState:UIControlStateNormal];
    }
    
    if (msgModel.zan_num > 0) {
        [self.countBtn setTitle:[NSString stringWithFormat:@"%ld",msgModel.zan_num] forState:UIControlStateNormal];
    }
    
    //歌曲部分
    [self.songImage setImageURL:[NSURL URLWithString:msgModel.content.pic]];
    self.songAuthor.text = msgModel.content.artist_name;
    self.songName.text = msgModel.content.title;
    
    //
    [self.mediaView removeAllSubviews];
    [self textView];
    if (msgModel.piclist.count > 0) {
          [self addImageView:msgModel.piclist];
    }
  
}


- (YYTextView *)textView{

        _textView = [[YYTextView alloc] init];
        _textView.text = self.msgModel.msg;
        [self.mediaView addSubview:_textView];
        [_textView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mediaView).offset(15);
            make.right.equalTo(self.mediaView).offset(-15);
            make.top.equalTo(self.mediaView);
            make.height.mas_equalTo([self.msgModel textHeight]);
        }];
    
    return _textView;
}



- (void)addImageView:(NSArray<UNMsgPiclistModel *> *)piclists{

    //fram
    for (UIView *iv in self.mediaView.subviews) {
        if ([iv isKindOfClass:[UIImageView class]]) {
            [iv removeFromSuperview];
        }
    }
    
    for (int i =0; i< piclists.count; i ++) {
     
        
        CGFloat size = (kScreenSize.width - 2 * 15 - 10) / 3;
        CGFloat w = 0;
        CGFloat h = 0;
        CGFloat x = 0;
        CGFloat y = 0;
        if (piclists.count  == 1) {
            w = kScreenSize.width - 2 * 15;
            h = 2 * size;
            x = 15;
            y = [self.msgModel textHeight];
        }else if(piclists.count == 2 || piclists.count == 4){
            w = (kScreenSize.width - 2* 15 - 5) / 2;
            h = size;
            x = i % 2 * (w + 5) + 15;
            y = [self.msgModel textHeight] + (i / 2) * (h + 5);
        }else {
            w = size;
            h = size;
            x = i % 3 *(w + 5) + 15;
            y = i / 3 * (h + 5) + [self.msgModel textHeight];
        }
        
        UIImageView *imageIV = [[UIImageView alloc] init];
        [_mediaView addSubview:imageIV];
        imageIV.frame = CGRectMake(x  , y, w, h);
        
        [imageIV setImageURL:[NSURL URLWithString:self.msgModel.piclist[i].thumbnail]];
        
    }
    
}



@end
