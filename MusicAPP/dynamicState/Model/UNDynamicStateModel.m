//
//  UNDynamicStateModel.m
//  MusicAPP
//
//  Created by universe on 2016/12/23.
//  Copyright © 2016年 universe. All rights reserved.
//

#import "UNDynamicStateModel.h"

@implementation UNDynamicStateModel
+ (NSDictionary *)modelContainerPropertyGenericClass{

    return @{@"msg":@"UNDynamicStateMsgModel",@"topics":@"UNDynamicStateTopicsModel"};
}

@end

@implementation UNDynamicStateMsgModel


+ (NSDictionary *)modelContainerPropertyGenericClass{
    
    return @{@"content":@"UNMsgContentModel",@"author":@"UNMsgAuthorModel",@"piclist":@"UNMsgPiclistModel"};
    
}


- (void)setCtime:(NSInteger)ctime{

    _ctime = ctime;
    long weiboTime = ctime;
    long nowTime = [[NSDate new] timeIntervalSince1970];
    long time = nowTime - weiboTime;
    //判断时间
    if (time <= 60) {
        self.needTime = @"刚刚";
    }else if (time > 60 && time <= 3600){
    
        self.needTime = [NSString stringWithFormat:@"%ld分钟之前",time / 60];
    }else if (time > 3600 && time <= 3600 * 24){
        self.needTime = [NSString stringWithFormat:@"%ld小时之前",time / 3600];
    }else{
    
        NSDateFormatter *formatter = [NSDateFormatter new];
        NSDate *data = [NSDate dateWithTimeIntervalSince1970:weiboTime];
        formatter.dateFormat = @"MM-dd";
        self.needTime = [formatter stringFromDate:data];
    }
    
}

- (float)textHeight{
    
    YYTextView *textView = [[YYTextView alloc] initWithFrame:CGRectMake(0, 0, kScreenSize.width - 2 * 15, 0)];
    textView.text = self.msg;
    
    CGFloat height = textView.textLayout.textBoundingSize.height;
    if (height > 150) {
        height = 150;
    }
    return height;
}
- (float)messageHeight{

    float height = 0;
    //得到文本的高度
    height += [self textHeight];
    if (self.piclist.count > 0) {
        height += [self imageHeight] + 5;
    }
   
    return height;
}
- (float)imageHeight{

    float size = (kScreenSize.width - 2 * 15 - 10) / 3;
    if (self.piclist.count == 1) {
        return 2 * size;
    }else if (self.piclist.count > 1 && self.piclist.count <= 3){
        return size;
    }else if (self.piclist.count > 3 && self.piclist.count <=6){
        return 2 * size + 5;
    }else if (self.piclist.count > 6 && self.piclist.count <=9){
        return 3 * size + 2 * 5;
    }
    return 0;
}


@end

@implementation UNMsgContentModel
@end

@implementation UNMsgAuthorModel
@end

@implementation UNMsgPiclistModel
@end




@implementation UNDynamicStateTopicsModel
@end
