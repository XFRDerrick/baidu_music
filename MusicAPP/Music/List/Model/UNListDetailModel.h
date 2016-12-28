//
//  UNListDetailModel.h
//  MusicAPP
//
//  Created by universe on 2016/11/29.
//  Copyright © 2016年 universe. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UNListSongListModel,UNListBillBoardModel;

@interface UNListDetailModel : NSObject
/*
 "song_list":Array[100],
 "billboard":Object{...},
 "error_code":22000
 */
@property (nonatomic, strong) NSArray<UNListSongListModel *> *song_list;
@property (nonatomic, strong) UNListBillBoardModel *billboard;
@property (nonatomic, assign) NSInteger error_code;

@end

/*
 "artist_id":"5064",
 "language":"国语",
 "pic_big":"http://musicdata.baidu.com/data2/pic/0dadd18a0cf164363491c304b63c9755/275349800/275349800.jpg",
 "pic_small":"http://musicdata.baidu.com/data2/pic/4189a879755f329a43b323ee546dc984/275349806/275349806.jpg",
 "country":"内地",
 "area":"0",
 "publishtime":"2016-11-01",
 "album_no":"1",
 "lrclink":"http://musicdata.baidu.com/data2/lrc/a33ec5bbaefd29ba94529b3dd2413a27/275350657/275350657.lrc",
 "copy_type":"1",
 "hot":"562281",
 "all_artist_ting_uid":"1968",
 "resource_type":"0",
 "is_new":"1",
 "rank_change":"0",
 "rank":"1",
 "all_artist_id":"5064",
 "style":"流行",
 "del_status":"0",
 "relate_status":"0",
 "toneid":"0",
 "all_rate":"64,128,256,320,flac",
 "sound_effect":"0",
 "file_duration":257,
 "has_mv_mobile":0,
 "versions":"",
 "bitrate_fee":"{"0":"129|-1","1":"-1|-1"}",
 "title":"天若有情",
 "song_id":"275350656",
 "author":"A-Lin",
 "havehigh":2,
 "album_title":"天若有情",
 "ting_uid":"1968",
 "album_id":"275350731",
 "charge":0,
 "mv_provider":"0000000000",
 "is_first_publish":0,
 "has_mv":0,
 "learn":1,
 "song_source":"web",
 "piao_id":"0",
 "korean_bb_song":"0",
 "resource_type_ext":"0",
 "artist_name":"A-Lin"
 */
@interface UNListSongListModel : NSObject

@property (nonatomic, copy) NSString *artist_id;
@property (nonatomic, copy) NSString *language;
@property (nonatomic, copy) NSString *pic_big;
@property (nonatomic, copy) NSString *pic_small;
@property (nonatomic, copy) NSString *country;

@property (nonatomic, copy) NSString *area;
@property (nonatomic, copy) NSString *publishtime;
@property (nonatomic, copy) NSString *album_no;
@property (nonatomic, copy) NSString *lrclink;
@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *all_artist_ting_uid;
@property (nonatomic, copy) NSString *resource_type;
@property (nonatomic, copy) NSString *hot;
@property (nonatomic, copy) NSString *is_new;
@property (nonatomic, copy) NSString *rank_change;

@property (nonatomic, copy) NSString *rank;
@property (nonatomic, copy) NSString *all_artist_id;
@property (nonatomic, copy) NSString *style;
@property (nonatomic, copy) NSString *del_status;
@property (nonatomic, copy) NSString *relate_status;

@property (nonatomic, copy) NSString *toneid;
@property (nonatomic, copy) NSString *all_rate;
@property (nonatomic, copy) NSString *sound_effect;
@property (nonatomic, assign) NSInteger file_duration;
@property (nonatomic, assign) NSInteger has_mv_mobile;
@property (nonatomic, copy) NSString *versions;

@property (nonatomic, copy) NSString *bitrate_fee;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *song_id;
@property (nonatomic, copy) NSString *author;
@property (nonatomic, assign) NSInteger havehigh;
@property (nonatomic, copy) NSString *album_title;

@property (nonatomic, copy) NSString *ting_uid;
@property (nonatomic, copy) NSString *album_id;
@property (nonatomic, copy) NSString *mv_provider;
@property (nonatomic, assign) NSInteger has_mv;
@property (nonatomic, assign) NSInteger charge;
@property (nonatomic, copy) NSString *song_source;

@property (nonatomic, assign) NSInteger learn;

@property (nonatomic, copy) NSString *piao_id;
@property (nonatomic, copy) NSString *korean_bb_song;
@property (nonatomic, copy) NSString *resource_type_ext;
@property (nonatomic, copy) NSString *artist_name;
@property (nonatomic, assign) NSInteger is_first_publish;

//king 榜
//"score":100,
//"score_change":1,
@property (nonatomic, assign) NSInteger score;
@property (nonatomic, assign) NSInteger score_change;



@end

/*
 "billboard_type":"1",
 "billboard_no":"2028",
 "update_date":"2016-11-29",
 "billboard_songnum":"196",
 "havemore":0,
 "name":"新歌榜",
 "comment":"该榜单是根据百度音乐平台歌曲每日播放量自动生成的数据榜单，统计范围为近期发行的歌曲，每日更新一次",
 "pic_s640":"http://c.hiphotos.baidu.com/ting/pic/item/f7246b600c33874495c4d089530fd9f9d62aa0c6.jpg",
 "pic_s444":"http://d.hiphotos.baidu.com/ting/pic/item/78310a55b319ebc4845c84eb8026cffc1e17169f.jpg",
 "pic_s260":"http://b.hiphotos.baidu.com/ting/pic/item/e850352ac65c1038cb0f3cb0b0119313b07e894b.jpg",
 "pic_s210":"http://business.cdn.qianqian.com/qianqian/pic/bos_client_c49310115801d43d42a98fdc357f6057.jpg",
 "web_url":"http://music.baidu.com/top/new"
 */

@interface UNListBillBoardModel : NSObject

//king榜
//"peroid":201648,"start_date":"1128",
//"end_date":"1204",
//"rule_url":"http://music.baidu.com/cms/nativeapp/king_rule.html",
@property (nonatomic, assign) NSInteger peroid;
@property (nonatomic, copy) NSString *start_date;
@property (nonatomic, copy) NSString *end_date;

//

@property (nonatomic, copy) NSString *billboard_type;
@property (nonatomic, copy) NSString *billboard_no;
@property (nonatomic, copy) NSString *update_date;
@property (nonatomic, copy) NSString *billboard_songnum;
@property (nonatomic, assign) NSInteger havemore;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *comment;
@property (nonatomic, copy) NSString *pic_s640;
@property (nonatomic, copy) NSString *pic_s444;
@property (nonatomic, assign) NSInteger pic_s260;
@property (nonatomic, copy) NSString *pic_s210;

@property (nonatomic, copy) NSString *web_url;

@end
