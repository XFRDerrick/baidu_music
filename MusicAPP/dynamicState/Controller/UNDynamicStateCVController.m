//
//  UNDynamicStateCVController.m
//  MusicAPP
//
//  Created by universe on 2016/12/23.
//  Copyright © 2016年 universe. All rights reserved.
//

#import "UNDynamicStateCVController.h"
#import "UNDynamicCVCell.h"


@interface UNDynamicStateCVController ()<UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) NSArray<UNDynamicStateMsgModel *> *msgArray;
@property (nonatomic, strong) NSArray<UNDynamicStateTopicsModel *> *topicsArray;

@end

@implementation UNDynamicStateCVController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    [self setupUI];
    
    // Register cell classes
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"UNDynamicCVCell" bundle:nil] forCellWithReuseIdentifier:@"UNDynamicCVCell"];
    
    // Do any additional setup after loading the view.
}

- (void)setupUI{

    self.collectionView.backgroundColor = [UIColor lightGrayColor];
    //请求数据
    [self getData];
}

- (void)getData{

    [NetManager getDynamicStateModelCompletionHandler:^(UNDynamicStateModel *model, NSError *error) {
       
        if (!error) {
            
            self.msgArray = model.msg;
            self.topicsArray = model.topics;
            NSLog(@"%ld_%ld",self.msgArray.count,self.topicsArray.count);
            
            [self.collectionView reloadData];
        }
    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    
//    if (section == 0) {
//        return 1;
//    }else{
//        return self.msgArray.count;
//        
//    }
//    
    return self.msgArray.count;

    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UNDynamicStateMsgModel *model = self.msgArray[indexPath.row];
    if (model.msgtype == 1) {
        UNDynamicCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UNDynamicCVCell" forIndexPath:indexPath];
        //    cell.backgroundColor = [UIColor randomColor:1];
        
        cell.msgModel = model;
        
        return cell;

    }
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor randomColor:1];
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

#pragma mark <UICollectionViewDelegateFlowLayout>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{

    UNDynamicStateMsgModel *m = self.msgArray[indexPath.row];
    if (m.msgtype == 1) {
        CGFloat w = kScreenSize.width;
        CGFloat h = [m messageHeight];
        CGSize size = CGSizeMake(w, h + 130 + 10);
        return size;
    }
    
    if (m.msgtype == 2) {
        return CGSizeMake(kScreenSize.width, 100);
    }
    return CGSizeZero;
    
}
//- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section;
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section;
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section;
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section;
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section;

@end
