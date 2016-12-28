//
//  NetManager.m
//  MusicAPP
//
//  Created by universe on 2016/11/23.
//  Copyright © 2016年 universe. All rights reserved.
//

#import "NetManager.h"

@implementation NetManager

+ (id)getChartsListModelCompletionHandler:(void (^)(UNListModel *, NSError *))completionHandler{

    NSString *path = kChartsPath;
    return [self Get:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        !completionHandler ?:completionHandler([UNListModel parse:responseObj],error);
    }];
}

+ (id)getChartsListDetailModelWithType:(NSInteger)type CompletionHandler:(void (^)(UNListDetailModel *, NSError *))completionHandler{

    
    NSString *path = kChartsDetailPath;
    if (type == 100) {
        path = kChartsKingPath;
    }
    
    path = [NSString stringWithFormat:path,type];
    
    return [self Get:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        !completionHandler ?:completionHandler([UNListDetailModel parse:responseObj],error);
    }];

}

+ (id)getKSongADModelCompletionHandler:(void (^)(KSongADModel *model, NSError *))completionHandler{

    NSString *path = kKSongOnePath;
    return [self Get:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        !completionHandler ?:completionHandler([KSongADModel parse:responseObj],error);
    }];
}

+ (id)getKSongCategoryModelCompletionHandler:(void (^)(KSongCategoryModel *, NSError *))completionHandler{
    NSString *path = kKSongTwoPath;
    return [self Get:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        !completionHandler ?:completionHandler([KSongCategoryModel parse:responseObj],error);
    }];
    
}
+ (id)getKSongAllSingModelCompletionHandler:(void (^)(KSongAllSingModel *, NSError *))completionHandler{
    NSString *path = kKSongThreePath;
    return [self Get:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        !completionHandler ?:completionHandler([KSongAllSingModel parse:responseObj],error);
    }];
    
}

+ (id)getKSongBookModelCompletionHandler:(void (^)(UNKSongBookModel *, NSError *))completionHandler{

    NSString *path = kSongBookPath;
    
    //解决AFNetworking请求错误问题
    NSString *str1 = [path stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    return [self Get:str1 parameters:nil completionHandler:^(id responseObj, NSError *error) {
        !completionHandler ?: completionHandler([UNKSongBookModel parse:responseObj],error);
    }];
}

+ (id)getRecommendModelCompletionHandler:(void (^)(UNRecommendModel *, NSError *))completionHandler{

    NSString *path = kRecommendPath;
    
    return [self Get:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        !completionHandler ?: completionHandler([UNRecommendModel parse:responseObj], error);
    }];
}

+ (id)getTestModelCompletionHandler:(void (^)(UNTestModel *, NSError *))completionHandler{
    
    NSString *path = TestPath;
    
    //解决AFNetworking请求错误问题
    NSString *str1 = [path stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    return [self Get:str1 parameters:nil completionHandler:^(id responseObj, NSError *error) {
        !completionHandler ?: completionHandler([UNTestModel parse:responseObj],error);
    }];
    
}

+ (id)getDynamicStateModelCompletionHandler:(void(^)(UNDynamicStateModel *model,NSError *error))completionHandler{

    NSString *path = KDynamicStatePath;
    
    return [self Get:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        !completionHandler ?: completionHandler([UNDynamicStateModel parse:responseObj],error);
    }];
}


@end
