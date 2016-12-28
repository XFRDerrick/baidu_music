//
//  UNRecommendModel.h
//  MusicAPP
//
//  Created by universe on 2016/11/27.
//  Copyright © 2016年 universe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UNRecommendRecsongFModel.h"

@class UNRecommendHeaderDatadModel,UNRecommendDetailModel,UNRecommendFocusFDetailModel,UNRecommendFocusDetailModel,UNRecommendMixNineModel,UNRecommendMixNineFModel,UNRecommendMixDoubleFModel,UNRecommendEntryModel,UNRecommendEntryFModel,UNRecommendMixFiveFModel,UNRecommendAlbumFModel,UNRecommendRadioFModel,UNRecommendRadioModel,UNRecommendModFModel,UNRecommendDiyFModel,UNRecommendDiyModel;
//推荐页数据模型
/*
 "result":Object{...},
 "error_code":22000,
 "module":Array[15]
 */
@interface UNRecommendModel : NSObject
@property (nonatomic, assign)NSInteger error_code;
//内部各分区模型数组
@property (nonatomic, strong) UNRecommendDetailModel *result;
@property (nonatomic, strong) NSArray<UNRecommendHeaderDatadModel *> *module;


@end
#pragma mark 分区内容模型集合
@interface UNRecommendDetailModel : NSObject
/*
 "mix_9":Object{...},
 "focus":Object{...},
 "mix_22":Object{...},
 "entry":Object{...},
 "scene":Object{...},//场景电台
 "mix_5":Object{...},
 "recsong":Object{...},
 "album":Object{...},
 "radio":Object{...},
 "mod_7":Object{...},
 "diy":Object{...}
 */

@property (nonatomic, strong) UNRecommendFocusFDetailModel *focus;
@property (nonatomic, strong) UNRecommendMixNineFModel *mix_9;
@property (nonatomic, strong) UNRecommendMixNineFModel *mix_22;
@property (nonatomic, strong) UNRecommendEntryFModel *entry;
@property (nonatomic, strong) UNRecommendMixNineFModel *mix_5;
@property (nonatomic, strong) UNRecommendRecsongFModel *recsong;
@property (nonatomic, strong) UNRecommendAlbumFModel *album;

@property (nonatomic, strong) UNRecommendRadioFModel *radio;
@property (nonatomic, strong) UNRecommendModFModel *mod_7;
@property (nonatomic, strong) UNRecommendDiyFModel *diy;

@end
#pragma mark 歌单推荐

@interface UNRecommendDiyFModel : NSObject
@property (nonatomic, assign)NSInteger error_code;
@property (nonatomic, strong) NSArray<UNRecommendDiyModel *> *result;
@end
@interface UNRecommendDiyModel : NSObject
@property (nonatomic, assign) NSInteger position;
@property (nonatomic, copy) NSString *tag;
@property (nonatomic, strong) NSArray *songidlist;
@property (nonatomic, copy) NSString *pic;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) NSInteger *collectnum;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *listid;
@property (nonatomic, assign) NSInteger listenum;
@end

/*
 "diy":{
 "error_code":22000,
 "result":[
 {
 "position":1,
 "tag":"华语,影视原声,经典",
 "songidlist":Array[0],
 "pic":"http://musicugc.cdn.qianqian.com/ugcdiy/pic/015dfb8a33b97e23dd5d6f5d552b2c7b.jpg",
 "title":"好听到欲罢不能的影视主题曲",
 "collectnum":36,
 "type":"gedan",
 "listenum":18383,
 "listid":"363868854"
 },
 */

#pragma mark 专栏mod_7
@interface UNRecommendModFModel : NSObject
@property (nonatomic, assign)NSInteger error_code;
@property (nonatomic, strong) NSArray<UNRecommendMixNineModel *> *result;
@end
//复用mix_9

#pragma mark 乐播节目

@interface UNRecommendRadioFModel : NSObject
@property (nonatomic, assign)NSInteger error_code;
@property (nonatomic, strong) NSArray<UNRecommendRadioModel *> *result;
@end
@interface UNRecommendRadioModel : NSObject

@property (nonatomic, copy) NSString *desc;
@property (nonatomic, copy) NSString *itemid;
@property (nonatomic, copy) NSString *album_id;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *channelid;
@property (nonatomic, copy) NSString *pic;

@end

/*
 "radio":{
 "error_code":22000,
 "result":[
 {
 "desc":"治愈系",
 "itemid":"13362373",
 "title":"妈妈，我想你！-【晨曦微露】",
 "album_id":"12380577",
 "type":"lebo",
 "channelid":"11373553",
 "pic":"http://business.cdn.qianqian.com/qianqian/pic/bos_client_6cc6e11ed23f3e45c82c05d2108a82a5.jpg"
 },
 */

#pragma mark 新碟上架

@interface UNRecommendAlbumFModel : NSObject
@property (nonatomic, assign)NSInteger error_code;
@property (nonatomic, strong) NSArray<UNRecommendMixNineModel *> *result;
@end
//复用mix_9
#pragma mark 最热MV推荐

@interface UNRecommendMixFiveFModel : NSObject
@property (nonatomic, assign)NSInteger error_code;
@property (nonatomic, strong) NSArray<UNRecommendMixNineModel *> *result;
@end
//复用mix_9

#pragma mark 第二分区

@interface UNRecommendEntryFModel : NSObject
@property (nonatomic, assign)NSInteger error_code;
@property (nonatomic, strong) NSArray<UNRecommendEntryModel *> *result;

@end
@interface UNRecommendEntryModel : NSObject
@property (nonatomic, copy) NSString *day;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *jump;
@end
/*
 "error_code":22000,
 "result":[
 {
 "day":"",
 "title":"歌手",
 "icon":"http://business.cdn.qianqian.com/qianqian/pic/bos_client_1473481741f98ba11546240fa2e83a408520941529.jpg",
 "jump":"2"
 },
 */
#pragma mark 热销专辑
@interface UNRecommendMixDoubleFModel : NSObject
@property (nonatomic, assign)NSInteger error_code;
@property (nonatomic, strong) NSArray<UNRecommendMixNineModel *> *result;
@end
//复用原创音乐的模型
/*
 "mix_22":{
 "error_code":22000,
 "result":[
 {
 "desc":"杨丞琳",
 "pic":"http://business.cdn.qianqian.com/qianqian/pic/bos_client_1478668466138089a97a6fbfaa2b14688457034c9a.jpg",
 "type_id":"276603225",
 "type":2,
 "title":"年轮说",
 "tip_type":0,
 "author":"杨丞琳"
 },
 */

#pragma mark 原创音乐信息
@interface UNRecommendMixNineFModel : NSObject
@property (nonatomic, assign)NSInteger error_code;
@property (nonatomic, strong) NSArray<UNRecommendMixNineModel *> *result;

@end
@interface UNRecommendMixNineModel : NSObject
@property (nonatomic, copy) NSString *desc;
@property (nonatomic, copy) NSString *pic;
@property (nonatomic, copy) NSString *type_id;
@property (nonatomic, assign) NSInteger *type;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) NSInteger *tip_type;
@property (nonatomic, copy) NSString *author;
/*
 "desc":"",
 "pic":"http://business.cdn.qianqian.com/qianqian/pic/bos_client_1479708471fc7c5665d549a6267fea39a81a1721f9.jpg",
 "type_id":"354346510",
 "type":0,
 "title":"歌予岁月流年",
 "tip_type":0,
 "author":""
 */
@end


#pragma mark 广告分区信息
@interface UNRecommendFocusFDetailModel : NSObject
@property (nonatomic, assign)NSInteger error_code;
@property (nonatomic, strong) NSArray<UNRecommendFocusDetailModel *> *result;
@end
@interface UNRecommendFocusDetailModel : NSObject
/*
 "error_code":22000,
 "result":[
 {
 "randpic":"http://business.cdn.qianqian.com/qianqian/pic/bos_client_148004685204f2dfd67b73b9eddf1fc3ab923a024f.jpg",
 "code":"277851202",
 "mo_type":"2",
 "type":2,
 "is_publish":"111101",
 "randpic_iphone6":"http://business.cdn.qianqian.com/qianqian/pic/bos_client_148004685204f2dfd67b73b9eddf1fc3ab923a024f.jpg",
 "randpic_desc":"Baby,До свидания(达尼亚)"
 },
 */
@property (nonatomic, copy) NSString *randpic;
@property (nonatomic, assign) NSInteger type;
@property (nonatomic, copy) NSString *code;
@property (nonatomic, copy) NSString *mo_type;
@property (nonatomic, copy) NSString *is_publish;
@property (nonatomic, copy) NSString *randpic_iphone6;
@property (nonatomic, copy) NSString *randpic_desc;

@end


#pragma mark 分区头视图信息
@interface UNRecommendHeaderDatadModel : NSObject
@property (nonatomic, copy) NSString *jump;
@property (nonatomic, assign) NSInteger pos;

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *key;
@property (nonatomic, copy) NSString *picurl;
@property (nonatomic, copy) NSString *title_more;
@property (nonatomic, assign) NSInteger style;
@property (nonatomic, copy) NSString *link_url;
/*
 "jump":"0",
 "pos":2,
 "title":"音乐导航",
 "key":"entry",
 "picurl":"http://business.cdn.qianqian.com/qianqian/pic/bos_client_1463974498ee916568af45b9417191fe7bcce01619.jpg",
 "title_more":"更多",
 "style":13,
 "link_url":""
 */
@end
