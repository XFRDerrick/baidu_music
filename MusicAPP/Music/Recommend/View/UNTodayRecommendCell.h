//
//  UNTodayRecommendCell.h
//  MusicAPP
//
//  Created by universe on 2016/11/24.
//  Copyright © 2016年 universe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UNTodayRecommendCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iconIV;
@property (weak, nonatomic) IBOutlet UIButton *detailButton;
@property (weak, nonatomic) IBOutlet UILabel *songNameLable;
@property (weak, nonatomic) IBOutlet UILabel *singerLable;

@end
