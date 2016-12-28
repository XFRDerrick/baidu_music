//
//  UNSongsListViewController.m
//  MusicAPP
//
//  Created by universe on 2016/11/23.
//  Copyright © 2016年 universe. All rights reserved.
//

#import "UNSongsListViewController.h"
#import "UNSongListLayout.h"
#import "UNSongListCVCell.h"

#import "UNSongListHeaderView.h"

@interface UNSongsListViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionReusableView *collectionHeaderView;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UNSongListHeaderView *headerView;

@property (nonatomic, strong) NSMutableArray *songBookData;

@end

@implementation UNSongsListViewController

-(NSMutableArray *)songBookData{

    if (!_songBookData) {
        _songBookData = [NSMutableArray array];
    }
    return _songBookData;
}

- (UNSongListHeaderView *)headerView{

    if (!_headerView) {
        _headerView = [[UNSongListHeaderView alloc] initWithFrame:CGRectMake(0, 0, kSCREEN_SIZE.width, 44)];
        _headerView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_headerView];
        [_headerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.equalTo(self.view);
            make.height.mas_equalTo(44);
        }];
        
        [_headerView.selectButton addTarget:self action:@selector(clickSelectButton:) forControlEvents:UIControlEventTouchUpInside];
        [_headerView.nearSongButton addTarget:self action:@selector(clickNearSongButton:) forControlEvents:UIControlEventTouchUpInside];
        [_headerView.hotButton addTarget:self action:@selector(clickHotButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _headerView;
}

- (void)clickHotButton:(UIButton *)sender{
    
    sender.selected = YES;
    self.headerView.nearSongButton.selected = !sender.selected;
    NSLog(@"点击了最热按钮");
    
}
- (void)clickNearSongButton:(UIButton *)sender{

    sender.selected = YES;
    self.headerView.hotButton.selected = !sender.selected;
    NSLog(@"点击了最新按钮");
}
- (void)clickSelectButton:(UIButton *)sender{
    NSLog(@"点击了选择按钮");
}

- (UICollectionView *)collectionView{

    if (!_collectionView ) {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectNull collectionViewLayout:[UNSongListLayout new]];
        _collectionView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_collectionView];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsZero);
        }];
        
        [_collectionView registerClass:[UNSongListCVCell class] forCellWithReuseIdentifier:@"songCVCell"];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        //注册可重复使用的分区头视图
        //参数 二：注册视图的摆放位置 Header 和Footer
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView"];
        
    }
    return _collectionView;
}
// 生成分区头视图或脚视图注册视图
//需要时自动调用 返回头或脚
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if (kind == UICollectionElementKindSectionHeader) {
        
        NSLog(@"000000");
        UICollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
        //为header添加子视图
        if (view.subviews.count == 0) {
            UNSongListHeaderView *headerView = [[UNSongListHeaderView alloc] initWithFrame:CGRectMake(0, 0, kSCREEN_SIZE.width, 44)];
            headerView.backgroundColor = [UIColor whiteColor];
            //只显示不具有功能
            [headerView hotButton];
            [headerView selectButton];
            [view addSubview:headerView];
        }
        self.collectionHeaderView = view;
        return view;
    }
    return nil;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    if (scrollView.contentOffset.y < 0) {
        
        self.collectionHeaderView.hidden = NO;
        self.headerView.hidden = YES;
        
    }else{
        self.collectionHeaderView.hidden = YES;
        self.headerView.hidden = NO;
        
        self.headerView.alpha = scrollView.contentOffset.y == 0 ? 1:0.7;
    }
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self collectionView];
    self.headerView.alpha  = 1;
    self.collectionView.contentInset = UIEdgeInsetsMake(0, 0, 44, 0);
    
    self.collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
       [NetManager getKSongBookModelCompletionHandler:^(UNKSongBookModel *model, NSError *error) {
           [self.collectionView.mj_header endRefreshing];
           if (!error) {
               
               [self.songBookData removeAllObjects];
               [self.songBookData addObjectsFromArray:model.content];
               [self.collectionView reloadData];
               NSLog(@"%ld",self.songBookData.count);
           }
           
       }];
        
    }];
    [self.collectionView.mj_header beginRefreshing];

}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{

    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return self.songBookData.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    UNSongListCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"songCVCell" forIndexPath:indexPath];
    UNKSongBookContentModel *model = self.songBookData[indexPath.row];
    [cell.posterImageView setImageURL:[NSURL URLWithString:model.pic_w300]];
    cell.titleLable.text = model.title;
    cell.creatorLable.text = model.tag;
//    cell.listenNumLable.text = model.listenum;
    
//    NSString *imageName = [NSString stringWithFormat:@"gedan%ld",indexPath.item % 11];
    
//    cell.posterImageView.image = [UIImage imageNamed:imageName];
//    cell.titleLable.text = @"每一个明天，都是充满希望的日子";
//    cell.creatorLable.text = @"by 弱水悠悠";
    [cell.playButton addTarget:self action:@selector(clickPlaybutton:) forControlEvents:UIControlEventTouchUpInside];
    
    
    //富文本
    //    cell.listenNumLable.attributedText =
    //创建一个附件，附件内容就是图片
    NSTextAttachment *audio = [NSTextAttachment new];
    audio.image = [UIImage imageNamed:@"ic_recommend_audition"];
    audio.bounds = CGRectMake(0, 0, 10, 10);
    //附件转换类型 NSAttributedString
    NSAttributedString *audioString = [NSAttributedString attributedStringWithAttachment:audio];
    
    //将附件插入到指定的带有属性的字符串的位置上
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] initWithString:model.listenum];
    [attString insertAttributedString:audioString atIndex:0];
    //为带有属性的字符串添加属性设置
    [attString addAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],} range:NSMakeRange(0, attString.length)];
//    [attString addAttributes:@{NSForegroundColorAttributeName:[UIColor redColor],NSFontAttributeName:[UIFont systemFontOfSize:14]} range:NSMakeRange(4, 2)];
    
    //将带有属性的字符串赋给负责显示的文本标签
    cell.listenNumLable.attributedText = attString;
    
    return cell;
}


- (void)clickPlaybutton:(UIButton *)sender{

    NSLog(@"点击了cell 上播放按钮");
}


@end
