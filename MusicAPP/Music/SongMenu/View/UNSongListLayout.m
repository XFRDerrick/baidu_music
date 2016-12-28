//
//  UNSongListLayout.m
//  MusicAPP
//
//  Created by universe on 2016/11/23.
//  Copyright © 2016年 universe. All rights reserved.
//

#import "UNSongListLayout.h"

@implementation UNSongListLayout

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.sectionInset = UIEdgeInsetsMake(10, 20, 10, 20);
        self.minimumInteritemSpacing = 10;
        self.minimumLineSpacing = 10;
        
        CGFloat width = (long)((kSCREEN_SIZE.width - 20 * 2 - 10 * 2) / 3);
        CGFloat height = width + 65;
        
        self.itemSize = CGSizeMake(width, height);
        
        self.scrollDirection = UICollectionViewScrollDirectionVertical;
        
        //设置分区头
        self.headerReferenceSize = CGSizeMake(0, 44);
        
    }
    return self;
}

@end
