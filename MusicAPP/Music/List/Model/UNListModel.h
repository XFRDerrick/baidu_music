//
//  UNListModel.h
//  MusicAPP
//
//  Created by universe on 2016/11/22.
//  Copyright © 2016年 universe. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UNListMusicModel,UNListCategoryModel;

@interface UNListModel : NSObject
/*
 "name":"新歌榜",
 "type":1,
 "count":4,
 "comment":"该榜单是根据百度音乐平台歌曲每日播放量自动生成的数据榜单，统计范围为近期发行的歌曲，每日更新一次",
 "web_url":"",
 "pic_s192":"http://b.hiphotos.baidu.com/ting/pic/item/9922720e0cf3d7caf39ebc10f11fbe096b63a968.jpg",
 "pic_s444":"http://d.hiphotos.baidu.com/ting/pic/item/78310a55b319ebc4845c84eb8026cffc1e17169f.jpg",
 "pic_s260":"http://b.hiphotos.baidu.com/ting/pic/item/e850352ac65c1038cb0f3cb0b0119313b07e894b.jpg",
 "pic_s210":"http://business.cdn.qianqian.com/qianqian/pic/bos_client_c49310115801d43d42a98fdc357f6057.jpg",
 "content":[]
 */
@property (nonatomic, strong) NSArray<UNListCategoryModel *> *content;
@property (nonatomic, assign) NSInteger *error_code;


@end

@interface UNListCategoryModel : NSObject

@property (nonatomic, copy) NSString *pic_s210;//图片URL
@property (nonatomic, copy) NSString *name;//title

@property (nonatomic, assign) NSInteger type;//1—— n
@property (nonatomic, assign) NSInteger count;
@property (nonatomic, copy) NSString *comment;
@property (nonatomic, copy) NSString *web_url;
@property (nonatomic, copy) NSString *pic_s192;
@property (nonatomic, copy) NSString *pic_s444;
@property (nonatomic, copy) NSString *pic_s260;


@property (nonatomic, strong) NSArray<UNListMusicModel *> *content;

@end

@interface UNListMusicModel : NSObject
/*
 "title":"July",
 "author":"吴亦凡",
 "song_id":"275614069",
 "album_id":"275614071",
 "album_title":"July",
 "rank_change":"0",
 "all_rate":"64,128,256,320,flac"
 */

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *author;
//
@property (nonatomic, copy) NSString *song_id;
@property (nonatomic, copy) NSString *album_id;
@property (nonatomic, copy) NSString *album_title;
@property (nonatomic, copy) NSString *rank_change;
@property (nonatomic, copy) NSString *all_rate;



@end
