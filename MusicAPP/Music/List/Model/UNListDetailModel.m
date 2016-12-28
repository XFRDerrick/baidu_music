//
//  UNListDetailModel.m
//  MusicAPP
//
//  Created by universe on 2016/11/29.
//  Copyright © 2016年 universe. All rights reserved.
//

#import "UNListDetailModel.h"

@implementation UNListDetailModel

+ (NSDictionary *)modelContainerPropertyGenericClass{

    return @{@"song_list":@"UNListSongListModel",@"billboard":@"UNListBillBoardModel"};
}

@end

@implementation UNListBillBoardModel

//针对king榜使用的属性 
+ (NSDictionary *)modelCustomPropertyMapper{
    
    return @{@"web_url":@"rule_url"};
}

@end

@implementation UNListSongListModel

+ (NSDictionary *)modelCustomPropertyMapper{
    
    return @{@"type":@"copy_type"};
}

@end
