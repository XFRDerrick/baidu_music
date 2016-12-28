//
//  UNDynamicCVCell.h
//  MusicAPP
//
//  Created by universe on 2016/12/23.
//  Copyright © 2016年 universe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UNDynamicStateModel.h"

@interface UNDynamicCVCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *authorImage;
@property (weak, nonatomic) IBOutlet UILabel *authorName;
@property (weak, nonatomic) IBOutlet UILabel *timeLable;


@property (weak, nonatomic) IBOutlet UIView *songBottomView;
@property (weak, nonatomic) IBOutlet UIImageView *songImage;
@property (weak, nonatomic) IBOutlet UILabel *songName;
@property (weak, nonatomic) IBOutlet UILabel *songAuthor;

@property (weak, nonatomic) IBOutlet UIButton *repostBtn;
@property (weak, nonatomic) IBOutlet UIButton *commentBtn;
@property (weak, nonatomic) IBOutlet UIButton *countBtn;

@property (nonatomic, strong) UNDynamicStateMsgModel *msgModel;

@property (weak, nonatomic) IBOutlet UIView *mediaView;

@end
