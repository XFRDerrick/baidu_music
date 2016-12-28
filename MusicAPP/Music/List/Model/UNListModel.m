//
//  UNListModel.m
//  MusicAPP
//
//  Created by universe on 2016/11/22.
//  Copyright © 2016年 universe. All rights reserved.
//

//+ (NSDictionary *)modelCustomPropertyMapper;
//+ (NSDictionary *)modelContainerPropertyGenericClass;
//+ (Class)modelCustomClassForDictionary:(NSDictionary*)dictionary;
#import "UNListModel.h"



@implementation UNListModel

+ (NSDictionary *)modelContainerPropertyGenericClass{
    
    return @{@"content":@"UNListCategoryModel"};
    
}


@end

@implementation UNListCategoryModel

+ (NSDictionary *)modelContainerPropertyGenericClass{
    
    return @{@"content":@"UNListMusicModel"};
    
}


@end

@implementation UNListMusicModel


@end
