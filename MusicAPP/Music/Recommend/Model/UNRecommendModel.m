//
//  UNRecommendModel.m
//  MusicAPP
//
//  Created by universe on 2016/11/27.
//  Copyright © 2016年 universe. All rights reserved.
//

#import "UNRecommendModel.h"
#pragma mark 推荐信息
@implementation UNRecommendModel
+ (NSDictionary *)modelContainerPropertyGenericClass{

    return @{@"result":@"UNRecommendDetailModel",@"module":@"UNRecommendHeaderDatadModel"};
    
}
@end
@implementation UNRecommendDetailModel

+ (NSDictionary *)modelContainerPropertyGenericClass{
    
    return @{@"focus":@"UNRecommendFocusFDetailModel",
             @"mix_9":@"UNRecommendMixNineFModel",
             @"mix_22":@"UNRecommendMixDoubleFModel",
             @"entry":@"UNRecommendEntryFModel",
             @"mix_5":@"UNRecommendMixFiveFModel",
             @"recsong":@"UNRecommendRecsongFModel",
             @"album":@"UNRecommendAlbumFModel",
             @"radio":@"UNRecommendRadioFModel",
             @"mod_7":@"UNRecommendModFModel",
             @"diy":@"UNRecommendDiyFModel"};
}

@end

#pragma mark 歌单推荐

@implementation UNRecommendDiyFModel
+ (NSDictionary *)modelContainerPropertyGenericClass{
    return @{@"result":@"UNRecommendDiyModel"};
    
}
@end

@implementation UNRecommendDiyModel
@end

#pragma mark 乐播节目

@implementation UNRecommendModFModel

+ (NSDictionary *)modelContainerPropertyGenericClass{
    return @{@"result":@"UNRecommendMixNineModel"};
    
}

@end

#pragma mark 乐播节目

@implementation UNRecommendRadioFModel
+ (NSDictionary *)modelContainerPropertyGenericClass{
    return @{@"result":@"UNRecommendRadioModel"};
    
}
@end

@implementation UNRecommendRadioModel
@end

#pragma mark 新碟上架

@implementation UNRecommendAlbumFModel

+ (NSDictionary *)modelContainerPropertyGenericClass{
    return @{@"result":@"UNRecommendMixNineModel"};
    
}

@end

#pragma mark 最热MV推荐

@implementation UNRecommendMixFiveFModel
+ (NSDictionary *)modelContainerPropertyGenericClass{
    return @{@"result":@"UNRecommendMixNineModel"};
}
@end

#pragma mark 第二分区

@implementation UNRecommendEntryFModel
+ (NSDictionary *)modelContainerPropertyGenericClass{
    return @{@"result":@"UNRecommendEntryModel"};
}
@end
@implementation UNRecommendEntryModel
@end

#pragma mark 热销专辑

@implementation UNRecommendMixDoubleFModel
+ (NSDictionary *)modelContainerPropertyGenericClass{
    return @{@"result":@"UNRecommendMixNineModel"};
}
@end

#pragma mark 原创音乐信息

@implementation UNRecommendMixNineFModel
+ (NSDictionary *)modelContainerPropertyGenericClass{

    return @{@"result":@"UNRecommendMixNineModel"};
}
@end
@implementation UNRecommendMixNineModel
@end


#pragma mark 广告分区信息
@implementation UNRecommendFocusFDetailModel
+ (NSDictionary *)modelContainerPropertyGenericClass{
    
    return @{@"result":@"UNRecommendFocusDetailModel"};
}

@end
@implementation UNRecommendFocusDetailModel
@end


@implementation UNRecommendHeaderDatadModel

@end

