//
//  KSongAllSingModel.h
//  MusicAPP
//
//  Created by universe on 2016/11/25.
//  Copyright © 2016年 universe. All rights reserved.
//

#import <Foundation/Foundation.h>

@class KSongAllSingitemsDetailModel;

@interface KSongAllSingModel : NSObject
@property (nonatomic, assign) NSInteger error_code;
@property (nonatomic, strong) NSDictionary *result;

@end

@interface KSongAllSingitemModel : NSObject

@property (nonatomic, strong) NSArray<KSongAllSingitemsDetailModel *> *items;

@end

@interface KSongAllSingitemsDetailModel : NSObject

@property (nonatomic, copy) NSString *song_id;

@property (nonatomic, copy) NSString *song_title;
@property (nonatomic, copy) NSString *artist_name;
@property (nonatomic, copy) NSString *play_num;

@property (nonatomic, copy) NSString *album_title;
@property (nonatomic, copy) NSString *picture_300_300;

/*
 "song_id":"1329239",
 "song_title":"小酒窝",
 "album_title":"JJ陆",
 "artist_name":"林俊杰,蔡卓妍",
 "picture_300_300":"http://musicdata.baidu.com/data2/pic/ac025a6eaa45ac4764808c64ebaa6447/246708026/246708026.jpg",
 "play_num":"3720910"
 */
@end


