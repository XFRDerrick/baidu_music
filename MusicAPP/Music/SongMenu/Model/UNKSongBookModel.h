//
//  UNKSongBookModel.h
//  MusicAPP
//
//  Created by universe on 2016/11/25.
//  Copyright © 2016年 universe. All rights reserved.
//

/*
 "error_code":22000,
 "total":7588,
 "havemore":1,
 "content":Array
 */
#import <Foundation/Foundation.h>

@class UNKSongBookContentModel;

@interface UNKSongBookModel : NSObject

@property (nonatomic, assign) NSInteger error_code;
@property (nonatomic, assign) NSInteger total;
@property (nonatomic, assign) BOOL havemore;
@property (nonatomic, strong) NSArray<UNKSongBookContentModel *> *content;

@end

@interface UNKSongBookContentModel : NSObject

@property (nonatomic, strong) NSString *listid;
@property (nonatomic, strong) NSString *listenum;//
@property (nonatomic, strong) NSString *collectnum;
@property (nonatomic, strong) NSString *title;//
@property (nonatomic, strong) NSString *pic_300;
@property (nonatomic, strong) NSString *tag;//
@property (nonatomic, strong) NSString *desc;
@property (nonatomic, strong) NSString *pic_w300;
@property (nonatomic, strong) NSString *width;
@property (nonatomic, strong) NSString *height;

@property (nonatomic, strong) NSArray *songIds;
@end

/*
 "listid":"363861748",
 "listenum":"879",
 "collectnum":"5",
 "title":"开车就要油门刹车一起踩",
 "pic_300":"http://musicugc.cdn.qianqian.com/ugcdiy/pic/c0b5815e8b51dc0ada77997e3a1874be.jpg",
 "tag":"欧美,电子,驾驶",
 "desc":"开车最好别听，我怕你出事。",
 "pic_w300":"http://musicugc.cdn.qianqian.com/ugcdiy/pic/c0b5815e8b51dc0ada77997e3a1874be.jpg",
 "width":"300",
 "height":"300",
 "songIds":Array[10]
 */
