//
//  UNListDetailViewController.h
//  MusicAPP
//
//  Created by universe on 2016/11/22.
//  Copyright © 2016年 universe. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "UNListModel.h"

typedef enum{

    UNViewHeaderNORMAL = 0,
    UNViewHeaderKing = 1,
    
}HeaderType;

typedef enum{
    
    UNTableViewCellNORMAL = 0,
    UNTableViewCellKing = 1,
    
}TableCellType;


@interface UNListDetailViewController : UIViewController

//根据listModel的type属性请求数据
@property (nonatomic, strong) UNListCategoryModel *listModel;

- (instancetype)initWithHeaderViewType:(HeaderType)headerType tableViewCellType:(TableCellType)cellType;
@property (nonatomic, assign) HeaderType headerType;
@property (nonatomic, assign) TableCellType cellType;

@end
