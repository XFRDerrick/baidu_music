//
//  UNRecommendRecsongFModel.h
//  MusicAPP
//
//  Created by universe on 2016/11/27.
//  Copyright © 2016年 universe. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UNRecommendRecsongModel;
@interface UNRecommendRecsongFModel : NSObject
@property (nonatomic, assign)NSInteger error_code;
@property (nonatomic, strong) NSArray<UNRecommendRecsongModel *> *result;
@end

@interface UNRecommendRecsongModel : NSObject
/*
 "resource_type_ext":"0",
 "learn":"0",
 "del_status":"0",
 "korean_bb_song":"0",
 "versions":"",
 "title":"Every Breath You Take",
 "bitrate_fee":"{"0":"0|0","1":"0|0"}",
 "song_id":"1228205",
 "has_mv_mobile":"1",
 "pic_premium":"http://musicdata.baidu.com/data2/pic/106114466/106114466.jpg",
 "author":"The Police"
 */
@property (nonatomic, copy) NSString *resource_type_ext;
@property (nonatomic, copy) NSString *learn;
@property (nonatomic, copy) NSString *del_status;
@property (nonatomic, copy) NSString *korean_bb_song;
@property (nonatomic, copy) NSString *versions;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *bitrate_fee;
@property (nonatomic, copy) NSString *song_id;
@property (nonatomic, copy) NSString *has_mv_mobile;
@property (nonatomic, copy) NSString *pic_premium;
@property (nonatomic, copy) NSString *author;


@end
