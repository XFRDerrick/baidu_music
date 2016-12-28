//
//  BaseNetManager.h
//  MusicAPP
//
//  Created by universe on 2016/11/23.
//  Copyright © 2016年 universe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseNetManager : NSObject

+ (id)Get:(NSString *)path parameters:(NSDictionary *)parameters completionHandler:(void(^)(id responseObj,NSError *error))completionHandler;

+ (id)POST:(NSString *)path parameters:(NSDictionary *)parameters completionHandler:(void(^)(id responseObj,NSError *error))completionHandler;

@end
