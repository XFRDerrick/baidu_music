//
//  KSongADModel.h
//  MusicAPP
//
//  Created by universe on 2016/11/24.
//  Copyright © 2016年 universe. All rights reserved.
//
/*
 
 "error_code":22000,
 "result"
 
"type":"learn",
"picture":"http://business.cdn.qianqian.com/qianqian/pic/bos_client_6c6235323f1108945f544184294b27a1.jpg",
"picture_iphone6":"http://business.cdn.qianqian.com/qianqian/pic/bos_client_18367beb80404223e53ef2510d355f13.jpg",
"web_url":"http://music.baidu.com/cms/webview/ktv_activity/20161123/"
 */


#import <Foundation/Foundation.h>
@class KSongADDetailModel;
@interface KSongADModel : NSObject

@property (nonatomic, assign) NSInteger *error_code;
@property (nonatomic, strong) NSArray<KSongADDetailModel *> *result;

@end

@interface KSongADDetailModel : NSObject

@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *picture;
@property (nonatomic, copy) NSString *picture_iphone6;
@property (nonatomic, copy) NSString *web_url;

@end
