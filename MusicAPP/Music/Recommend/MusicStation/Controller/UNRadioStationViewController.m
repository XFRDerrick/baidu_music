//
//  UNRadioStationViewController.m
//  MusicAPP
//
//  Created by universe on 2016/11/29.
//  Copyright © 2016年 universe. All rights reserved.
//

#import "UNRadioStationViewController.h"

#import "UNRadioStationModel.h"

#import "UNRadioDetailLayout.h"
#import "UNRadioDetailCVCell.h"
#import "UNRadioCategoryTVCell.h"


@interface UNRadioStationViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UIView *topView;
@property (nonatomic, strong) UIView *HeightView;

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSArray<UNRadioStationModel *> *data;


@property (nonatomic, strong) NSArray *categoryData;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIView *lineView;

@end

@implementation UNRadioStationViewController
- (UIView *)HeightView{
    if (!_HeightView) {
        _HeightView = [UIView new];
        _HeightView.backgroundColor = kRGBA_COLOR(210, 210, 210, 1)
        [self.view addSubview:_HeightView];
        [_HeightView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.view);
            make.top.equalTo(self.topView.mas_bottom);
            make.height.mas_equalTo(5);
        }];
    }
    return _HeightView;
}

- (NSArray *)categoryData{

    if (!_categoryData) {
        
        _categoryData = @[@"推荐",@"场景",@"主题",@"推荐",@"场景",@"主题",@"推荐",@"场景"];
    }
    return _categoryData;
}

- (UIView *)lineView{

    if (!_lineView) {
        _lineView = [UIView new];
        _lineView.backgroundColor = kRGBA_COLOR(210, 210, 210, 1)
        [self.view addSubview:_lineView];
        [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.tableView.mas_right);
            make.width.mas_equalTo(1);
            make.top.equalTo(self.tableView.mas_top).offset(30);
            make.centerY.equalTo(self.tableView);
        }];
    }
    return _lineView;
}

- (UITableView *)tableView{

    if (!_tableView) {
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectNull style:UITableViewStylePlain];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.equalTo(self.view);
            make.top.equalTo(self.topView.mas_bottom).offset(5);
            make.width.mas_equalTo(kSCREEN_SIZE.width / 4 -1);
        }];
        //取出分割线
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 60;
        [_tableView registerClass:[UNRadioCategoryTVCell class] forCellReuseIdentifier:@"UNRadioCategoryTVCell"];
        
        _tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
        
    }
    return _tableView;

}

- (NSArray<UNRadioStationModel *> *)data{

    if (!_data) {
        _data = [UNRadioStationModel demoData];
    }
    return _data;
}
- (UICollectionView *)collectionView{

    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kSCREEN_SIZE.width * 3 / 4, kSCREEN_SIZE.height) collectionViewLayout:[[UNRadioDetailLayout alloc] init]];
        [self.view addSubview:_collectionView];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.topView.mas_bottom).offset(5);
            make.right.bottom.equalTo(self.view);
            make.width.mas_equalTo(kSCREEN_SIZE.width * 3 / 4);
        }];
        
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.alwaysBounceVertical = YES;
        
        [_collectionView registerClass:[UNRadioDetailCVCell class] forCellWithReuseIdentifier:@"UNRadioDetailCVCell"];
        
   
        
    }
    return _collectionView;
}
- (UIView *)topView{

    if (!_topView) {
        _topView = [[UIView alloc] init];
        [self.view addSubview:_topView];
        [_topView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(self.view);
            make.height.mas_equalTo(100);
        }];
        _topView.backgroundColor = [UIColor whiteColor];
    }
    return _topView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self HeightView];
    [self lineView];
    
    self.title = @"电台";
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    self.collectionView.backgroundColor = [UIColor whiteColor];

}

#pragma mark tableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.categoryData.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UNRadioCategoryTVCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UNRadioCategoryTVCell" forIndexPath:indexPath];
    //更改cell 被选中时的背景颜色
    cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.frame];
    cell.selectedBackgroundView.backgroundColor = [UIColor whiteColor];
    cell.categoryTitle.text = self.categoryData[indexPath.row];
    
    return cell;
}

#pragma mark collectionView
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{

    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    NSLog(@"%ld",self.data.count);
    return self.data.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UNRadioDetailCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UNRadioDetailCVCell" forIndexPath:indexPath];
    
    UNRadioStationModel *model = self.data[indexPath.row];
    
    cell.iconImageView.image = [[UIImage imageNamed:model.image] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];

    cell.iconTitleLable.text = model.name;
    
    return cell;

    
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

@end
