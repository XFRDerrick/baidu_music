//
//  UNRecommendCVController.m
//  MusicAPP
//
//  Created by universe on 2016/11/24.
//  Copyright © 2016年 universe. All rights reserved.
//

#import "UNRecommendCVController.h"
#import "recommendADCell.h"
#import "UNRecommendOptionCell.h"
#import "UNRecommendHeaderView.h"

#import "UNRecommendNormalCell.h"
#import "UNTodayRecommendCell.h"

#import "UNSongListCVCell.h"

//电台
#import "UNRadioStationViewController.h"

@interface UNRecommendCVController ()<UICollectionViewDelegateFlowLayout,iCarouselDelegate,iCarouselDataSource>

@property (nonatomic, strong)UIPageControl  *pageControll;
@property (nonatomic, strong) iCarousel *ic;

@property (nonatomic, strong) NSTimer *timer;

//整体数据
@property (nonatomic, strong) UNRecommendModel *recommendModel;
@property (nonatomic, strong) NSMutableArray *adData;
//原创音乐
@property (nonatomic, strong) NSMutableArray *originalData;

//未使用
@property (nonatomic, strong) NSMutableArray *recommendDatas;
@end

@implementation UNRecommendCVController
- (NSMutableArray *)originalData{

    if (!_originalData) {
        _originalData = [NSMutableArray array];
    }
    return _originalData;
}
- (NSMutableArray *)adData{
    if (!_adData) {
        _adData = [NSMutableArray array];
    }
    return _adData;
}

- (NSMutableArray *)recommendDatas{

    if (!_recommendDatas) {
        _recommendDatas = [NSMutableArray array];
    }
    return _recommendDatas;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.alwaysBounceVertical = YES;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.contentInset = UIEdgeInsetsMake(0, 0, 44, 0);
    
    // Register cell classes
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
    [self.collectionView registerClass:[recommendADCell class] forCellWithReuseIdentifier:@"recommendADCell"];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"UNRecommendOptionCell" bundle:nil] forCellWithReuseIdentifier:@"UNRecommendOptionCell"];
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"UICollectionReusableView"];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"UNRecommendHeaderView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"UNRecommendHeaderView"];
    [self.collectionView registerNib:[UINib nibWithNibName:@"UNRecommendNormalCell" bundle:nil] forCellWithReuseIdentifier:@"UNRecommendNormalCell"];
    //今日推荐 歌曲
     [self.collectionView registerNib:[UINib nibWithNibName:@"UNTodayRecommendCell" bundle:nil] forCellWithReuseIdentifier:@"UNTodayRecommendCell"];
    //歌单推荐 复用歌单的cell
    [self.collectionView registerClass:[UNSongListCVCell class] forCellWithReuseIdentifier:@"songCVCell"];

//    UNRecommendNormalCell
    // Do any additional setup after loading the view.
    //数据引入
    self.collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
//        [NetManager getTestModelCompletionHandler:^(UNTestModel *model, NSError *error) {
//           
//            NSLog(@"%ld",model.result.count);
//            
//        }];
//        
        
       [NetManager getRecommendModelCompletionHandler:^(UNRecommendModel *model, NSError *error) {
           [self.collectionView.mj_header endRefreshing];
           [self.timer invalidate];
           if (!error) {
               self.recommendModel = model;
               
               [self.adData removeAllObjects];
               [self.adData addObjectsFromArray:model.result.focus.result];
               [self.ic reloadData];
               //有数据之后添加启动定时器
               NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(changeADPage) userInfo:nil repeats:YES];
               self.timer = timer;
               
               self.pageControll.numberOfPages = self.adData.count;
               //原创音乐
               [self.originalData removeAllObjects];
               [self.originalData addObjectsFromArray:model.result.mix_9.result];
               
               NSLog(@"%ld",self.originalData.count);
               //刷新数据
               [self.collectionView reloadData];
           }
       }];
    }];
    
    [self.collectionView.mj_header beginRefreshing];
    
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

//    NSInteger count = self.recommendModel.;
//    NSLog(@"count - %ld",count);
    
//    unsigned int propertyCount = 0;
//    //通过运行时获取当前类的属性
//    objc_property_t *propertys = class_copyPropertyList([UNRecommendModel class],&propertyCount);
//    [self recommendModel];
//    NSLog(@"count - %u",propertyCount);

    return 12;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    if (section == 0) {
        [self adData];
        return 1;
    }
    if (section == 1) {
        return self.recommendModel.result.entry.result.count;
    }
    if (section == 7 || section == 8) {
        return self.originalData.count;
    }
    if (section == 9 ) {
        return self.recommendModel.result.mix_5.result.count;
    }
    //3- 数组超6 只显示6组
    if (section == 2 || section == 3 || section == 10 || section == 11) {
        return self.recommendModel.result.radio.result.count;
    }
    if (section == 4) {
        return self.recommendModel.result.mix_22.result.count;
    }
    if (section == 5) {
        return 1;
    }
    //6 _ 4f
    return 4;
}

#pragma mark 单元格
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        recommendADCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"recommendADCell" forIndexPath:indexPath];
        //为广告图设置代理 显示数据
        cell.ic.delegate = self;
        cell.ic.dataSource = self;
        self.ic = cell.ic;
        //在数据加载后设置PageControl的numberoffPage
        self.pageControll = cell.pageControl;
       
        return cell;
    }
    if (indexPath.section == 1 || indexPath.section == 6) {
    
        UNRecommendOptionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UNRecommendOptionCell" forIndexPath:indexPath];
        if (indexPath.section == 1) {
            UNRecommendEntryModel *model = self.recommendModel.result.entry.result[indexPath.row];
            cell.optionLable.text = model.title;
            //设置图片和占位图片
            [cell.optionButton setImageWithURL:[NSURL URLWithString:model.icon] forState:UIControlStateNormal placeholder:[UIImage imageNamed:@"icon"]];
            [cell.optionButton setImageWithURL:[NSURL URLWithString:model.icon] forState:UIControlStateHighlighted placeholder:[UIImage imageNamed:@"icon"]];

        }else{
            NSString *lbStr = nil,*imageName = nil;
            switch (indexPath.row) {
                case 0:
                    lbStr = @"运动";
                    imageName = @"diantai";
                    break;
                case 1:
                    lbStr = @"做家务";
                    imageName = @"diantai";
                    break;
                case 2:
                    lbStr = @"民谣";
                    imageName = @"diantai";
                    break;
                case 3:
                    lbStr = @"更多电台";
                    imageName = @"diantai";
                    break;
                default:
                    break;
            }
            cell.optionLable.font = [UIFont systemFontOfSize:14];
            cell.optionLable.text = lbStr;
            [cell.optionButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
            [cell.optionButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateHighlighted];
        }
                return cell;
    }
    
  
    if (indexPath.section == 2) {
        //复用歌单界面的自定义cell
        UNSongListCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"songCVCell" forIndexPath:indexPath];
        //数据
        UNRecommendDiyModel *model = self.recommendModel.result.diy.result[indexPath.row];
        [cell.posterImageView setImageURL:[NSURL URLWithString:model.pic]];
        cell.titleLable.text = model.title;
        cell.creatorLable.hidden = YES;
        cell.playButton.hidden = YES;
        
        //富文本
        //    cell.listenNumLable.attributedText =
        //创建一个附件，附件内容就是图片
        NSTextAttachment *audio = [NSTextAttachment new];
        audio.image = [UIImage imageNamed:@"ic_recommend_audition"];
        audio.bounds = CGRectMake(0, 0, 10, 10);
        //附件转换类型 NSAttributedString
        NSAttributedString *audioString = [NSAttributedString attributedStringWithAttachment:audio];
        
        //将附件插入到指定的带有属性的字符串的位置上
        NSString *listenNum = [NSString stringWithFormat:@"%d",(int)model.listenum];
        NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] initWithString:listenNum];
        [attString insertAttributedString:audioString atIndex:0];
        //为带有属性的字符串添加属性设置
        [attString addAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],} range:NSMakeRange(0, attString.length)];
        //将带有属性的字符串赋给负责显示的文本标签
        cell.listenNumLable.attributedText = attString;
        return cell;
    }
      UNRecommendNormalCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UNRecommendNormalCell" forIndexPath:indexPath];
    
    if (indexPath.section == 3) {
        UNRecommendMixNineModel *model = self.recommendModel.result.album.result[indexPath.row];
        [cell.iconIV setImageURL:[NSURL URLWithString:model.pic]];
        cell.songNameLable.text = model.title;
        cell.singerLable.hidden = NO;
        cell.singerLable.text = model.author;
    }
    
    if (indexPath.section == 4) {
        
        UNRecommendMixNineModel *model = self.recommendModel.result.mix_22.result[indexPath.row];
        [cell.iconIV setImageURL:[NSURL URLWithString:model.pic]];
        cell.songNameLable.text = model.title;
        cell.singerLable.text = model.author;
        cell.singerLable.hidden = NO;
    }
    if (indexPath.section == 8) {
        UNRecommendMixNineModel *model = self.originalData[indexPath.row];
        [cell.iconIV setImageURL:[NSURL URLWithString:model.pic]];
        cell.songNameLable.text = model.title;
        cell.singerLable.hidden = YES;

    }
    if (indexPath.section == 9) {
        
        UNRecommendMixNineModel *model = self.recommendModel.result.mix_5.result[indexPath.row];
        [cell.iconIV setImageURL:[NSURL URLWithString:model.pic]];
        cell.songNameLable.text = model.title;
        cell.singerLable.text = model.author;
        cell.singerLable.hidden = NO;

    }
    if (indexPath.section == 10) {
        UNRecommendRadioModel *model = self.recommendModel.result.radio.result[indexPath.row];
         [cell.iconIV setImageURL:[NSURL URLWithString:model.pic]];
        cell.songNameLable.text = model.title;
        cell.singerLable.hidden = YES;
    }

    
    
    if (indexPath.section == 5) {
        UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
        cell.backgroundColor = kRGBA_COLOR(203, 139, 110, 1);
        return cell;
    }
    if (indexPath.section == 7||indexPath.section == 11) {
        UNTodayRecommendCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UNTodayRecommendCell" forIndexPath:indexPath];
        if (indexPath.section == 7) {
            UNRecommendRecsongModel *model = self.recommendModel.result.recsong.result[indexPath.row];
            [cell.iconIV setImageURL:[NSURL URLWithString:model.pic_premium]];
            cell.iconIV.clipsToBounds = YES;
            cell.songNameLable.text = model.title;
            cell.singerLable.text = model.author;
        }else{
            UNRecommendMixNineModel *model = self.recommendModel.result.mod_7.result[indexPath.row];
             [cell.iconIV setImageURL:[NSURL URLWithString:model.pic]];
            cell.iconIV.clipsToBounds = NO;
            cell.songNameLable.text = model.title;
            cell.singerLable.text = model.desc;
        }
        return cell;
    }
   
    
//    cell.backgroundColor = [UIColor randomColor:1];
    return cell;
    
    
    
}

#pragma mark 点击单元格

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 1 && indexPath.row == 1) {
        NSLog(@"点击了电台");
        UNRadioStationViewController *station = [[UNRadioStationViewController alloc] init];
        [self.navigationController pushViewController:station animated:YES];
        
    }
    
}


#pragma mark <UICollectionViewDelegateFlowLayout>

#pragma mark 单元格大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CGFloat width =(long)((kScreenSize.width - 20 *2 - 10 * 2) / 3);
    CGFloat height = width + 50;
    
    switch (indexPath.section) {
        case 0:
            return CGSizeMake(kScreenSize.width, 150);
            break;
        case 1:
            return CGSizeMake((kScreenSize.width - 40) / 3, (kScreenSize.width - 40) / 3 + 5);
            break;
        case 2:
            return CGSizeMake(width,height);
        case 3:
            height = width + 60;
            return CGSizeMake(width,height);
            break;
        case 4:
            width =(long)((kScreenSize.width - 20 *2 - 10 * 2) / 3);
            height = width + 60;
            return CGSizeMake(width,height);
            break;
        case 5:
            return CGSizeMake(kScreenSize.width,44);
            break;
        case 6:
            width =(long)((kScreenSize.width - 20 *2 - 30) / 4);
            height = width + 20;
            return CGSizeMake(width,height);
            break;
        case 7:
            width =kScreenSize.width - 40;
            height = 60;
            return CGSizeMake(width,height);
            break;
        case 8:
            width =(long)((kScreenSize.width - 20 *2 - 10 * 2) / 3);
            height = width + 50;
            return CGSizeMake(width,height);
            break;
        case 9:
            width =(long)((kScreenSize.width - 20 *2 - 10 * 2) / 3);
            height = width + 66;
            return CGSizeMake(width,height);
            break;
        case 10:
            width =(long)((kScreenSize.width - 20 *2 - 10 * 2) / 3);
            height = width + 50;
            return CGSizeMake(width,height);
            break;
        case 11:
            width =kScreenSize.width - 40;
            height = 60;
            return CGSizeMake(width,height);
            break;

        default:
            break;
            
    }
    
    return CGSizeMake(100, 100);
    
}

#pragma mark section ——inset

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    if (section == 0) {
        return UIEdgeInsetsZero;
    }
    if (section == 1) {
        return UIEdgeInsetsMake(0, 10, 0, 10);
    }

    // 2 3 4 6 8 9 10 11默认
    
    if (section == 5) {
        UIEdgeInsetsMake(0, 0, 0, 0);
    }
    return UIEdgeInsetsMake(0, 20, 0, 20);
}

#pragma mark section ——minimumLineSpacing
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{

    if (section == 1 || section == 6 ||section == 7|| section == 11) {
        return 0;
    }
    return 10;
}
#pragma mark section ——minimumInteritemSpacing
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    
    if (section == 1|| section == 6 ||section == 7 || section == 11 ) {
        return 0;
    }
    return 10;
}
#pragma mark header和Footer设置
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 0) {
        return nil;
    }
    
    if (indexPath.section == 2 || indexPath.section == 3 || indexPath.section == 4 || indexPath.section == 7 ||indexPath.section == 8 || indexPath.section == 9 ||indexPath.section == 10 ||indexPath.section == 11) {
        
        if (kind == UICollectionElementKindSectionHeader) {
            UNRecommendHeaderView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"UNRecommendHeaderView" forIndexPath:indexPath];
            
               NSArray *modelArr = self.recommendModel.module;
            //数组模型
            UNRecommendHeaderDatadModel *model = nil;
            if (indexPath.section == 2) {
                model = modelArr[3];
            }
            if (indexPath.section == 3) {
                model = modelArr[5];
            }
            if (indexPath.section == 4) {
                model = modelArr[6];
            }
            if (indexPath.section == 7) {
                 model = modelArr[9];
            }
            if (indexPath.section == 8) {
                model = modelArr[10];
            }
            if (indexPath.section == 9) {
                model = modelArr[11];
            }
            if (indexPath.section == 10) {
                model = modelArr[12];
            }
            if (indexPath.section == 11) {
                model = modelArr[13];
            }

            header.moreButton.hidden = model.title_more.length > 0 ? NO:YES;//NO;
            header.titleLable.text = model.title;//@"歌单推荐";
            [header.titleIcon setImageWithURL:[NSURL URLWithString:model.picurl] forState:UIControlStateNormal placeholder:nil];//[UIImage imageNamed:@"wk_scenario_color3_select"]];
            return header;
        }
    }
    
    UICollectionReusableView *foot = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"UICollectionReusableView" forIndexPath:indexPath];
    foot.backgroundColor = kRGBA_COLOR(235, 235, 235, 1);
    
    return foot;
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{

    if (section == 0) {
        return CGSizeZero;
    }
    return CGSizeMake(0, 5);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
   
    if (section == 2 || section == 3 || section == 4 || section == 7 || section == 8 || section == 9 || section == 10 || section == 11) {
        return CGSizeMake(0, 44);
    }
    return CGSizeZero;
}




#pragma mark iCarouselDataSource
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{

    return self.adData.count;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(nullable UIView *)view{
    //查看是否获取到了view nil 自己创建
    if (!view) {
        view = [[UIView alloc] initWithFrame:carousel.bounds];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:carousel.bounds];
        [view addSubview:imageView];
        imageView.tag = 210;//标记 赋值
    }
    //给数据
    UIImageView *imageView = (UIImageView *)[view viewWithTag:210];
//    NSString *imageName = [NSString stringWithFormat:@"ad%ld",index + 1];
//    imageView.image =[UIImage imageNamed:imageName];
    
    UNRecommendFocusDetailModel *model = self.adData[index];
    [imageView setImageURL:[NSURL URLWithString:model.randpic_iphone6]];

    return view;
}

//捆绑PageControll
- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel{
    self.pageControll.currentPage = carousel.currentItemIndex;
}

//设置连续滚动模式
- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value{
    //根据Option的值确定 设置返回的Value 确定样式
    if (option == iCarouselOptionWrap) {
        value = YES ;
    }
    return value;
}
#pragma mark 定时器执行任务
- (void)changeADPage{
    [self.ic scrollToItemAtIndex:self.ic.currentItemIndex + 1 animated:YES];
    
}


@end
