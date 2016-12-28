//
//  UNDynamicStateModel.h
//  MusicAPP
//
//  Created by universe on 2016/12/23.
//  Copyright © 2016年 universe. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UNDynamicStateTopicsModel,UNDynamicStateMsgModel,UNMsgContentModel,UNMsgAuthorModel,UNMsgPiclistModel;

@interface UNDynamicStateModel : NSObject

@property (nonatomic, assign) NSInteger new_msg_num;
@property (nonatomic, copy) NSString *last_timestamp;
@property (nonatomic, assign) NSInteger is_guide;
@property (nonatomic, assign) NSInteger error_code;

@property (nonatomic, copy) NSString *last_msg_id;

@property (nonatomic, strong) NSArray<UNDynamicStateMsgModel *> *msg;
@property (nonatomic, strong) NSArray<UNDynamicStateTopicsModel *> *topics;
@end



@interface UNDynamicStateMsgModel : NSObject

@property (nonatomic, copy) NSString *msg_parent_id;
@property (nonatomic, copy) NSString *msg;
@property (nonatomic, assign) NSInteger rtime;
@property (nonatomic, assign) NSInteger share_num;
@property (nonatomic, assign) NSInteger ctime;
//转化时间
@property (nonatomic, copy) NSString *needTime;

@property (nonatomic, strong) NSDictionary *topic;
@property (nonatomic, assign) NSInteger comment_num;
@property (nonatomic, assign) NSInteger zan_num;
@property (nonatomic, assign) NSInteger isAuthor;

@property (nonatomic, assign) NSInteger msgtype;

//音乐 作者模型
@property (nonatomic, strong) UNMsgContentModel *content;
//作者头部部分
@property (nonatomic, strong) UNMsgAuthorModel *author;
//ImageView多张图片的数组
@property (nonatomic, strong) NSArray<UNMsgPiclistModel *> *piclist;

@property (nonatomic, strong) NSArray *msg_users;
@property (nonatomic, copy) NSString *msgid;

//计算高度方法
- (float)messageHeight;
- (float)textHeight;
- (float)imageHeight;


@end

@interface UNMsgContentModel : NSObject

@property (nonatomic, assign) NSInteger content_id;
@property (nonatomic, assign) NSInteger tinguid;
@property (nonatomic, assign) NSInteger content_type;

@property (nonatomic, copy) NSString *artist_name;
@property (nonatomic, assign) NSInteger status;

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *pic;
@property (nonatomic, copy) NSString *artist_id;
@end

@interface UNMsgAuthorModel : NSObject
/*
 "userpic":"http://himg.bdimg.com/sys/portrait/item/d5f662616964756d7573696338d4a0.jpg",
 "flag":"001",
 "userpic_small":"http://himg.bdimg.com/sys/portrait/item/d5f662616964756d7573696338d4a0.jpg",
 "userid":"2698311381",
 "username":"话唠主播"
 */

@property (nonatomic, copy) NSString *userpic;
@property (nonatomic, copy) NSString *flag;
@property (nonatomic, copy) NSString *userpic_small;
@property (nonatomic, copy) NSString *userid;
@property (nonatomic, copy) NSString *username;

@end

@interface UNMsgPiclistModel : NSObject

@property (nonatomic, copy) NSString *pic_large;
@property (nonatomic, copy) NSString *master;
@property (nonatomic, copy) NSString *pic_middle;
@property (nonatomic, copy) NSString *pic_small;
@property (nonatomic, copy) NSString *pic_360;
@property (nonatomic, copy) NSString *thumbnail;

@end



@interface UNDynamicStateTopicsModel : NSObject


@property (nonatomic, copy) NSString *pic_750x215;
@property (nonatomic, copy) NSString *pic_50x50;
@property (nonatomic, copy) NSString *pic_350x170;
@property (nonatomic, copy) NSString *editor;

@property (nonatomic, copy) NSString *pic_980x280;
@property (nonatomic, copy) NSString *pic_min;


@property (nonatomic, copy) NSString *attr;
@property (nonatomic, copy) NSString *topic_title;

@property (nonatomic, assign) NSInteger ctime;
@property (nonatomic, assign) NSInteger is_recommend;

@property (nonatomic, copy) NSString *topic_id;


@property (nonatomic, copy) NSString *desc;

@property (nonatomic, copy) NSString *pic;

@property (nonatomic, copy) NSString *pic_700x340;

@property (nonatomic, copy) NSString *min_pic;
@property (nonatomic, assign) NSInteger usertype;

@property (nonatomic, copy) NSString *pic_180x88;
@property (nonatomic, assign) NSInteger nums;
@property (nonatomic, assign) NSInteger status;

/*

 "attr":"a:6:{s:11:"topic_title";s:30:"你最喜欢的一句歌词？";s:4:"desc";s:165:"写歌的人假正经，听歌的人却动情。一句歌词，一种心情。说出你最喜欢的那句歌词，和大家一起分享你珍藏的那段心情吧。";s:8:"userlist";s:0:"";s:6:"editor";s:6:"houyue";s:3:"pic";s:98:"http://bj.bcebos.com/relay/ugcdiy/pic/bos_ugcclient_1480673433d6f8bca0f7598298f2a62844327da6ae.jpg";s:7:"min_pic";s:98:"http://bj.bcebos.com/relay/ugcdiy/pic/bos_ugcclient_1480673373fd52edbbc4652de9b87acfc9420210da.jpg";}",
 
 */

@end


