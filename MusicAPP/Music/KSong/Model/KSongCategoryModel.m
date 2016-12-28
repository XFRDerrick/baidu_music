//
//  KSongCategoryModel.m
//  MusicAPP
//
//  Created by universe on 2016/11/24.
//  Copyright © 2016年 universe. All rights reserved.
//

//+ (NSDictionary *)modelCustomPropertyMapper;
//+ (NSDictionary *)modelContainerPropertyGenericClass;
//+ (Class)modelCustomClassForDictionary:(NSDictionary*)dictionary;
#import "KSongCategoryModel.h"

@implementation KSongCategoryModel

//+ (NSDictionary *)modelContainerPropertyGenericClass{
//    
//    return @{@"result":@"KSongCategoryItemModel"};
//}


@end

@implementation KSongCategoryItemModel



+ (NSDictionary *)modelContainerPropertyGenericClass{
    
    return @{@"items":@"KSongCategoryDetailModel"};
}


@end

@implementation KSongCategoryDetailModel


@end
