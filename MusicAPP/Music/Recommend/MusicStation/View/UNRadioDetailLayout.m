//
//  UNRadioDetailLayout.m
//  MusicAPP
//
//  Created by universe on 2016/11/29.
//  Copyright © 2016年 universe. All rights reserved.
//

#import "UNRadioDetailLayout.h"

@implementation UNRadioDetailLayout

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.sectionInset = UIEdgeInsetsMake(10, 20, 10, 20);
        self.minimumInteritemSpacing = 20;
        self.minimumLineSpacing = 20;
        
        CGFloat width = (long)(kScreenSize.width * 3 / 4 - 20 * 2 - 20 * 2) / 3;//(long)((self.collectionView.bounds.size.width - 5 * 2 - 20 * 2) / 3);
        CGFloat height = width * 2 - 60;
        self.itemSize = CGSizeMake(width, height);
        
    }
    return self;
}

@end
