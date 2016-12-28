//
//  UNTestModel.h
//  MusicAPP
//
//  Created by universe on 2016/11/28.
//  Copyright © 2016年 universe. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UNTestResultModel;

@interface UNTestModel : NSObject

/*
 "status":"success",
 "code":0,
 "result":Array[21],
 "fresh_count":10
 */

@property (nonatomic, copy) NSString *status;
@property (nonatomic, assign) NSInteger code;
@property (nonatomic, strong) NSArray<UNTestResultModel *> *result;
@property (nonatomic, assign) NSInteger fresh_count;

@end

@interface UNTestResultModel : NSObject

@property (nonatomic, copy) NSString *ctype;

/*
 "ctype":"news",
 "impid":"7827698_1480305932369_1803",
 "pageid":"Hot",
 "meta":"7827698_1480305932369_1803",
 "dtype":5,
 "title":"专题|江西丰城发电厂事故9名责任人员被刑拘",
 "date":"2016-11-28 12:05:32",
 "docid":"0F1Vg8GO",
 "tags":Array[1],
 "itemid":"0F1Vg8GO",
 "tag_icon":"t3.png",
 "url":"http://www.yidianzixun.com/topics/myxfdy9RMvoD3qm2WLgQRCwu1g",
 "source":"一点资讯",
 "image_urls":Array[1],
 "image":"http://si1.go2yd.com/get-image/08tnXOESyAa",
 "update_title_time":"1480304808742",
 "like":3883,
 "comment_count":1960,
 "up":7078,
 "content_type":"news",
 "b_political":false,
 "auth":true,
 "is_gov":false
 */
@end
