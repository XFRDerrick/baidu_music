//
//  UNListDetailTableViewCell.h
//  MusicAPP
//
//  Created by universe on 2016/11/22.
//  Copyright © 2016年 universe. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "UNListDetailModel.h"

@interface UNListDetailTableViewCell : UITableViewCell

//当前行
@property (nonatomic, assign) NSIndexPath *indexPath;
@property (nonatomic, strong) UNListSongListModel *model;

@end
