//
//  NetManager.h
//  MusicAPP
//
//  Created by universe on 2016/11/23.
//  Copyright © 2016年 universe. All rights reserved.
//

#import "BaseNetManager.h"
#import "UNListModel.h"
#import "KSongADModel.h"
#import "KSongCategoryModel.h"
#import "KSongAllSingModel.h"

#import "UNKSongBookModel.h"
#import "UNRecommendModel.h"

#import "UNTestModel.h"
#import "UNListDetailModel.h"
#import "UNDynamicStateModel.h"


@interface NetManager : BaseNetManager

+ (id)getChartsListModelCompletionHandler:(void(^)(UNListModel *model,NSError *error))completionHandler;

+ (id)getChartsListDetailModelWithType:(NSInteger)type CompletionHandler:(void(^)(UNListDetailModel *model,NSError *error))completionHandler;



//KSong
+ (id)getKSongADModelCompletionHandler:(void(^)(KSongADModel *model,NSError *error))completionHandler;

//KSong——CategoryModel
+ (id)getKSongCategoryModelCompletionHandler:(void(^)(KSongCategoryModel *model,NSError *error))completionHandler;
//KSong allsing
+ (id)getKSongAllSingModelCompletionHandler:(void(^)(KSongAllSingModel *model,NSError *error))completionHandler;

//KSong book
+ (id)getKSongBookModelCompletionHandler:(void(^)(UNKSongBookModel *model,NSError *error))completionHandler;

//KSong 推荐
+ (id)getRecommendModelCompletionHandler:(void(^)(UNRecommendModel *model,NSError *error))completionHandler;


+ (id)getTestModelCompletionHandler:(void(^)(UNTestModel *model,NSError *error))completionHandler;

//获取动态数据
+ (id)getDynamicStateModelCompletionHandler:(void(^)(UNDynamicStateModel *model,NSError *error))completionHandler;


@end
