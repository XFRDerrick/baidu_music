//
//  UNRadioStationModel.m
//  MusicAPP
//
//  Created by universe on 2016/11/29.
//  Copyright © 2016年 universe. All rights reserved.
//

#import "UNRadioStationModel.h"

@implementation UNRadioStationModel

+ (NSArray<UNRadioStationModel *> *)demoData{

    NSMutableArray *arrModel = [NSMutableArray array];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"scene.plist" ofType:nil];
    NSArray *arr = [NSArray arrayWithContentsOfFile:path];
    
    [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       
        UNRadioStationModel *model = [UNRadioStationModel new];
        model.name = obj[@"name"];
        model.image = obj[@"image"];
        [arrModel addObject:model];
    }];
    
    return arrModel.copy;
}

@end
