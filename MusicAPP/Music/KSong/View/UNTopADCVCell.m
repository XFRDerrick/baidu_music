//
//  UNTopADCVCell.m
//  MusicAPP
//
//  Created by universe on 2016/11/23.
//  Copyright © 2016年 universe. All rights reserved.
//

#import "UNTopADCVCell.h"

@interface UNTopADCVCell ()
@property (weak, nonatomic) IBOutlet UIImageView *adShowImageView;


@end

@implementation UNTopADCVCell

- (void)setImageName:(NSString *)imageName{

    _imageName = imageName;

    [self.adShowImageView setImageURL:[NSURL URLWithString:imageName]];
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
