//
//  UNKSongCategoryCVCell.m
//  MusicAPP
//
//  Created by universe on 2016/11/23.
//  Copyright © 2016年 universe. All rights reserved.
//

#import "UNKSongCategoryCVCell.h"

@interface UNKSongCategoryCVCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (weak, nonatomic) IBOutlet UILabel *categoryName;



@end

@implementation UNKSongCategoryCVCell

- (void)setImageName:(NSString *)imageName{

    _imageName = imageName;
    self.iconImage.image = [UIImage imageNamed:imageName];
}
- (void)setCategoryNa:(NSString *)categoryNa{
    _categoryNa = categoryNa;
    self.categoryName.text = categoryNa;
}

@end
