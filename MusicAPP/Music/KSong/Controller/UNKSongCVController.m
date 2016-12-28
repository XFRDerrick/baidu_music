//
//  UNKSongCVController.m
//  MusicAPP
//
//  Created by universe on 2016/11/23.
//  Copyright © 2016年 universe. All rights reserved.
//

#import "UNKSongCVController.h"

#import "UNKSongMusicCVCell.h"
#import "UNTopADCVCell.h"
#import "UNKSongKindCVCell.h"
#import "UNKSongCategoryCVCell.h"

#import "UNKSongADCell.h"//滚动ad


@interface UNKSongCVController ()<UICollectionViewDelegateFlowLayout,iCarouselDelegate,iCarouselDataSource>

@property (nonatomic, strong) UICollectionViewFlowLayout *layout;
//ksong ad数据数组
@property (nonatomic, strong) NSMutableArray *adDataList;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) iCarousel *ic;
//ksong分类——数组
@property (nonatomic, strong) NSMutableArray *categoryDataList;
@property (nonatomic, strong) NSIndexPath *categoryIndexPath;

//ksong大家都在长数据Array
@property (nonatomic, strong) NSMutableArray *allSingDataList;


@end

@implementation UNKSongCVController

- (NSMutableArray *)allSingDataList{
    if (!_allSingDataList) {
        _allSingDataList = [NSMutableArray array];
    }
    return _allSingDataList;
}

-(NSMutableArray *)adDataList{
 
    if (!_adDataList) {
        _adDataList = [NSMutableArray array];
    }
    return _adDataList;
}
- (NSMutableArray *)categoryDataList{
    if (!_categoryDataList) {
        _categoryDataList = [NSMutableArray array];
    }
    return _categoryDataList;

    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //保证集合视图一定能够滚动
    self.collectionView.alwaysBounceVertical = YES;
    
    // Register cell classes
    //AD
    [self.collectionView registerNib:[UINib nibWithNibName:@"UNTopADCVCell" bundle:nil] forCellWithReuseIdentifier:@"UNTopADCVCell"];
    [self.collectionView registerClass:[UNKSongADCell class] forCellWithReuseIdentifier:@"UNKSongADCell"];
    
    //Main Song
    [self.collectionView registerNib:[UINib nibWithNibName:@"UNKSongKindCVCell" bundle:nil] forCellWithReuseIdentifier:@"UNKSongKindCVCell"];
    //KSong Category
     [self.collectionView registerNib:[UINib nibWithNibName:@"UNKSongCategoryCVCell" bundle:nil] forCellWithReuseIdentifier:@"UNKSongCategoryCVCell"];
    //header
    [self.collectionView registerNib:[UINib nibWithNibName:@"UNKAllSongHeaderView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"UNKAllSongHeaderView"];
    //CELL
    [self.collectionView registerNib:[UINib nibWithNibName:@"UNKSongMusicCVCell" bundle:nil] forCellWithReuseIdentifier:@"UNKSongMusicCVCell"];
    
       // Do any additional setup after loading the view.
    self.collectionView.backgroundColor = [UIColor whiteColor];//kRGBA_COLOR(235, 235, 235, 1);
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerView"];
    
    //加载数据
    self.collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
       
        [NetManager getKSongADModelCompletionHandler:^(KSongADModel *model, NSError *error) {
            [self.collectionView.mj_header endRefreshing];
            if (!error) {
                
                [self.adDataList removeAllObjects];
                [self.adDataList addObjectsFromArray:model.result];
                [self.collectionView reloadData];
                [_ic reloadData];
            }
        }];
        
        [NetManager getKSongCategoryModelCompletionHandler:^(KSongCategoryModel *model, NSError *error) {
           [self.collectionView.mj_header endRefreshing];
            if (!error) {
                //
                NSLog(@"第二区数据加载完成");
                
                KSongCategoryItemModel *itemModel = [KSongCategoryItemModel parse:model.result];
                [_categoryDataList removeAllObjects];
                [_categoryDataList addObjectsFromArray:itemModel.items];

            }
        }];
        
        //先加载一次
        [self refreshingSingMusic];
        //添加一个定时器实时刷新第三部分
        
        [NSTimer scheduledTimerWithTimeInterval:8 target:self selector:@selector(refreshingSingMusic) userInfo:nil repeats:YES];
    }];
    
    [self.collectionView.mj_header beginRefreshing];
    
}
#pragma mark 无限刷新正在唱数据

- (void)refreshingSingMusic{
    
    [NetManager getKSongAllSingModelCompletionHandler:^(KSongAllSingModel *model, NSError *error) {
        if (!error) {
            //
            NSLog(@"第三区数据加载完成");
            KSongAllSingitemModel *itemModel = [KSongAllSingitemModel parse:model.result];
            [_allSingDataList removeAllObjects];
            [_allSingDataList addObjectsFromArray:itemModel.items];
            [self.collectionView reloadData];
        }
        
    }];
    
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 4;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    switch (section) {
        case 0:
          return 1;
            break;
        case 1:
            return 1;
            break;
        case 2:
            return self.categoryDataList.count;
            break;
        case 3:
            return self.allSingDataList.count / 2;
            break;
            
        default:
            break;
    }
    return 1;
}

#pragma mark cell的显示样式
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
  
    if (indexPath.section == 0) {
        UNKSongADCell *adcell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UNKSongADCell" forIndexPath:indexPath];
        
        adcell.ic.delegate = self;
        adcell.ic.dataSource = self;
        adcell.pageControl.numberOfPages = self.adDataList.count;
        self.pageControl = adcell.pageControl;
        self.ic = adcell.ic;
        
        return adcell;
    }
    if (indexPath.section == 1) {
        UNKSongKindCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UNKSongKindCVCell" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor whiteColor];
        return cell;
    }

    if (indexPath.section == 2) {
        self.categoryIndexPath = indexPath;
        UNKSongCategoryCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UNKSongCategoryCVCell" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor whiteColor];
        cell.imageName = [NSString stringWithFormat:@"img_k_%ld",indexPath.row];
        //获取数据赋值
        KSongCategoryDetailModel *model = self.categoryDataList[indexPath.row];
        cell.categoryNa = model.desc;
        
        return cell;
    }
    if (indexPath.section == 3) {
        UNKSongMusicCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UNKSongMusicCVCell" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor whiteColor];
        KSongAllSingitemsDetailModel *model = self.allSingDataList[indexPath.row];
        cell.singerImageName = model.picture_300_300;
        cell.songDetail = [NSString stringWithFormat:@"%@-%@",model.song_title,model.artist_name];
        cell.kSongCt = model.play_num;
//        cell.singerImageName = [NSString stringWithFormat:@"singnow%ld",indexPath.row % 2 + 1];
        return cell;
    }
    return nil;
}


#pragma mark <UICollectionViewDelegateFlowLayout>

#pragma mark headerView设置
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 3) {
        UICollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"UNKAllSongHeaderView" forIndexPath:indexPath];

        return view;
    }else{
        
        UICollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerView" forIndexPath:indexPath];
        view.backgroundColor =  kRGBA_COLOR(235, 235, 235, 1);
        return view;
    }
    
    
}

#pragma mark header大小设置
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
    switch (section) {
        case 0:
            return CGSizeZero;
            break;
        case 1:
            return CGSizeMake(0, 6);
            break;
        case 2:
            return CGSizeMake(0, 6);
            break;
        case 3:
            return CGSizeMake(0, 60);
            break;
        default:
            break;
    }

    return CGSizeZero;
}
#pragma mark item设置
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 0) {
        return CGSizeMake(kSCREEN_SIZE.width, kSCREEN_SIZE.width / 2);
    }
    if (indexPath.section == 1) {
        return CGSizeMake(kSCREEN_SIZE.width, kSCREEN_SIZE.width / 6);
    }
    if (indexPath.section == 2) {
        CGFloat width = (long)((kSCREEN_SIZE.width - 20 * 2)/3);
        CGFloat height = width + 38;
        return CGSizeMake(width, height);
    }
    if (indexPath.section == 3) {
        CGFloat width = kSCREEN_SIZE.width;
        CGFloat height = 80;
        return CGSizeMake(width, height);
    }
    return CGSizeMake(0, 0);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout :(NSInteger)section{

    if (section == 2) {
        return UIEdgeInsetsMake(0, 20, 0, 20);
    }
    return UIEdgeInsetsZero;
}
#pragma mark iCarouselDataSource

- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{

    return self.adDataList.count;
    
}
- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(nullable UIView *)view{
    //查看是否获取到了view nil 自己创建
    if (!view) {
        view = [[UIImageView alloc] initWithFrame:carousel.bounds];
    }
    //给数据
     KSongADDetailModel *model = self.adDataList[index];
    NSLog(@"picture_iphone6-----%@",model.picture_iphone6);
    [((UIImageView *)view) setImageURL:[NSURL URLWithString:model.picture_iphone6]];
    return view;
}

//捆绑PageControll
- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel{
    self.pageControl.currentPage = carousel.currentItemIndex;
}

//设置连续滚动模式
- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value{
    //根据Option的值确定 设置返回的Value 确定样式
    if (option == iCarouselOptionWrap) {
        value = YES;
    }
    return value;
}


@end
