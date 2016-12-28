//
//  UNRadioStationModel.h
//  MusicAPP
//
//  Created by universe on 2016/11/29.
//  Copyright © 2016年 universe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UNRadioStationModel : NSObject

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *image;

+ (NSArray<UNRadioStationModel *> *)demoData;

@end
