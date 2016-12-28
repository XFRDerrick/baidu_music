//
//  Constant.h
//  day16-tarbarBottomView
//
//  Created by universe on 2016/11/21.
//  Copyright © 2016年 universe. All rights reserved.
//

#ifndef Constant_h
#define Constant_h


#define kSCREEN_SIZE [UIScreen mainScreen].bounds.size

#define kRGBA_COLOR(r,g,b,a) [UIColor colorWithRed:r/ 255.0 green:g/ 255.0 blue:b/ 255.0 alpha:a];

//音乐—— 榜单
#define kChartsPath @"http://tingapi.ting.baidu.com/v1/restserver/ting?method=baidu.ting.billboard.billCategory&format=json&from=ios&kflag=2&from=ios&version=5.8.3&cuid=511e7b5ebe3cb83b66008608b586c12220e6b5aa&channel=appstore&operator=0"
// ——榜单——
#define kChartsDetailPath @"http://tingapi.ting.baidu.com/v1/restserver/ting?method=baidu.ting.billboard.billList&type=%ld&format=json&offset=0&size=100&from=ios&fields=title,song_id,author,resource_type,havehigh,is_new,has_mv_mobile,album_title,ting_uid,album_id,charge,all_rate,mv_provider&from=ios&version=5.8.3&cuid=b5e817cd1220f5c8a474ebaa5d6feca6d3173163&channel=appstore&operator=1"

#define kChartsKingPath @"http://tingapi.ting.baidu.com/v1/restserver/ting?method=baidu.ting.billboard.kingDetail&type=100&peroid=&format=json&offset=0&size=50&from=ios&version=5.8.3&cuid=9bf9dd79422f0daff3b71760c8b3ff4711d6c9fb&channel=appstore&operator=0"

#define kChartsSongPath @"http://tingapi.ting.baidu.com/v1/restserver/ting?method=baidu.ting.song.getInfos&ts=1475164135&songid=%ld&nw=2&l2p=395.1&lpb=320000&ext=MP3&format=json&from=ios&usup=1&lebo=0&aac=0&ucf=4&vid=&res=1&e=FuQ105WnGRfnAYDe2H%@2FYvCkKi8tA3QhyC6fmlIiYJHY%@3D&channel=24fc6b080e10ed8522fbb16da65619eafdf1db28&cuid=appstore&from=ios&version=5.9.0"

//歌单
#define kSongBookPath @"http://tingapi.ting.baidu.com/v1/restserver/ting?method=baidu.ting.diy.gedan&page_no=%ld&page_size=30&from=ios&from=ios&version=5.8.3&cuid=511e7b5ebe3cb83b66008608b586c12220e6b5aa&channel=appstore&operator=0"

//推荐 -歌手
#define kSingerPath @"http://tingapi.ting.baidu.com/v1/restserver/ting?method=baidu.ting.artist.getList&format=json&order=1&limit=24&offset=0&area=0&sex=0&abc=&from=ios&from=ios&version=5.8.3&cuid=511e7b5ebe3cb83b66008608b586c12220e6b5aa&channel=appstore&operator=0"

// 推荐- 场景
#define kChannelPath @"http://tingapi.ting.baidu.com/v1/restserver/ting/?method=baidu.ting.scene.getCategoryList&from=ios&version=5.8.3&cuid=511e7b5ebe3cb83b66008608b586c12220e6b5aa&channel=appstore&operator=0"
//推荐 - 歌曲分类
#define kChannelRecommendPath @"http://tingapi.ting.baidu.com/v1/restserver/ting?method=baidu.ting.scene.getSugScene&from=ios&version=5.8.3&cuid=511e7b5ebe3cb83b66008608b586c12220e6b5aa&channel=appstore&operator=0"

//推荐- 电台
#define kChannelDetailPath @"http://tingapi.ting.baidu.com/v1/restserver/ting/?method=baidu.ting.scene.getCategoryScene&category_id=%@&from=ios&version=5.8.3&cuid=9bf9dd79422f0daff3b71760c8b3ff4711d6c9fb&channel=appstore&operator=0"
//、、http://tingapi.ting.baidu.com/v1/restserver/ting?method=baidu.ting.plaza.index&channel=f8583c42f7674a969780640400773388cf967b12&cuid=appstore&from=ios&version=5.9.1
// 推荐- 2以下部分
#define kRecommendPath @"http://tingapi.ting.baidu.com/v1/restserver/ting?method=baidu.ting.plaza.index&from=ios&version=5.8.3&cuid=9bf9dd79422f0daff3b71760c8b3ff4711d6c9fb&channel=appstore&operator=0"

//K —— AD
 #define kKSongOnePath1 @"http://tingapi.ting.baidu.com/v1/restserver/ting?from=android&version=5.9.0.0&channel=xiaomi&operator=1&method=baidu.ting.active.showList"

#define kKSongOnePath @"http://tingapi.ting.baidu.com/v1/restserver/ting?method=baidu.ting.active.showList&from=ios&version=5.8.3&cuid=9bf9dd79422f0daff3b71760c8b3ff4711d6c9fb&channel=appstore&operator=0"

//K —— 分类
#define kKSongTwoPath @"http://tingapi.ting.baidu.com/v1/restserver/ting?method=baidu.ting.learn.category&from=ios&from=ios&version=5.8.3&cuid=9bf9dd79422f0daff3b71760c8b3ff4711d6c9fb&channel=appstore&operator=0"
//K ——musics
#define kKSongThreePath @"http://tingapi.ting.baidu.com/v1/restserver/ting?method=baidu.ting.learn.now&from=ios&from=ios&version=5.8.3&cuid=9bf9dd79422f0daff3b71760c8b3ff4711d6c9fb&channel=appstore&operator=0"


#define TestPath @"http://118.26.223.139/Website/channel/news-list-for-hot-channel?platform=1&last_docid=0F32HVWz&cv=3.7.8&fields=docid&fields=date&fields=image&fields=image_urls&fields=like&fields=source&fields=title&fields=url&fields=comment_count&fields=up&fields=down&cend=30&infinite=true&distribution=app.xiaomi.com&refresh=1&appid=xiaomi&cstart=0&version=020112&net=wifi"

#define KDynamicStatePath @"http://tingapi.ting.baidu.com/v1/restserver/ting?from=android&version=5.9.0.0&channel=1426d&operator=0&method=baidu.ting.ugcfriend.getList&format=json&param=eluR8EsKpyGTqHM6q1LnQ9OVUxv4myeNzjG4puPHWPRrAGhRkLiOOK79C5PaSCRKwPgOp%2B0Fd4438lJwCX5eQw%3D%3D&timestamp=1477726726&sign=de154562a9371b8fa49e925233fc5f12"

#endif /* Constant_h */
