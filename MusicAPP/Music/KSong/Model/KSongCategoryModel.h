//
//  KSongCategoryModel.h
//  MusicAPP
//
//  Created by universe on 2016/11/24.
//  Copyright © 2016年 universe. All rights reserved.
//
/*
 "error_code":22000,
 "result"
 
 "query":"area",
 "value":1,
 "desc":"华语金曲"
 */
#import <Foundation/Foundation.h>

@class KSongCategoryDetailModel,KSongCategoryItemModel;
@interface KSongCategoryModel : NSObject

@property (nonatomic, assign) NSInteger error_code;
@property (nonatomic, strong) NSDictionary *result;

@end

@interface KSongCategoryItemModel : NSObject

@property (nonatomic, strong) NSArray<KSongCategoryDetailModel *> *items;

@end

@interface KSongCategoryDetailModel : NSObject

@property (nonatomic, copy) NSString *query;
@property (nonatomic, assign) NSInteger value;
@property (nonatomic, copy) NSString *desc;

@end



