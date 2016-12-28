//
//  UNListTableViewController.m
//  MusicAPP
//
//  Created by universe on 2016/11/22.
//  Copyright © 2016年 universe. All rights reserved.
//

#import "UNListTableViewController.h"
#import "UNListTableViewCell.h"
#import "UNListDetailViewController.h"

@interface UNListTableViewController ()
//数据数组
@property (nonatomic, strong) NSMutableArray *dataList;
@end

@implementation UNListTableViewController

- (NSMutableArray *)dataList{
    
    if (!_dataList) {
        _dataList = [NSMutableArray array];
    }
    return _dataList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
//    self.tableView.tableHeaderView 
    self.tableView.rowHeight = 140;
    [self.tableView registerClass:[UNListTableViewCell class] forCellReuseIdentifier:@"listCell"];
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 44, 0);
    //细节
    self.tableView.tableFooterView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tableView_section_bg"]];
    self.tableView.bounces = NO;
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [NetManager getChartsListModelCompletionHandler:^(UNListModel *model, NSError *error) {
            [self.tableView.mj_header endRefreshing];
            if (!error) {
                
                [self.dataList removeAllObjects];
                [self.dataList addObjectsFromArray:model.content];
                [self.tableView reloadData];
                
            }
            
        }];
        
    }];
    [self.tableView.mj_header beginRefreshing];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return self.dataList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UNListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"listCell" forIndexPath:indexPath];
    
    UNListCategoryModel *model = self.dataList[indexPath.section];
    
    NSArray *musics = model.content;
    
    cell.titleLb.text = model.name;
    if (indexPath.section == 3) {
        [cell.iconIV setImageURL:[NSURL URLWithString:model.pic_s192]];
    }else{
        [cell.iconIV setImageURL:[NSURL URLWithString:model.pic_s210]];
    }
    
    [cell.iconBtn addTarget:self action:@selector(clickPlayButton:) forControlEvents:UIControlEventTouchUpInside];
    cell.musicFirstLb.text = [musics[0] title];
    cell.musicSecondLb.text = [musics[1] title];
    cell.musicThirdLb.text = [musics[2] title];

    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

#pragma mark 点击图片上播放按钮
- (void)clickPlayButton:(UIButton *)sender{
    
    NSLog(@"点击了图片上得播放按钮");
    UNListDetailViewController *listDetailVC = [[UNListDetailViewController alloc] init];
    
    [self.navigationController pushViewController:listDetailVC animated:YES];
}
//
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 2;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
 
    return [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tableView_section_bg"]];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UNListCategoryModel *model = self.dataList[indexPath.section];
    
    UNListDetailViewController *listDetailVC = nil;
   //king榜 对应的创建方式
    if (model.type == 100) {
        listDetailVC = [[UNListDetailViewController alloc] initWithHeaderViewType:UNViewHeaderKing tableViewCellType:UNTableViewCellKing];
        
    }else{
        listDetailVC = [[UNListDetailViewController alloc] initWithHeaderViewType:UNViewHeaderNORMAL tableViewCellType:UNTableViewCellNORMAL];
    }
    listDetailVC.listModel = model;
    [self.navigationController pushViewController:listDetailVC animated:YES];
    
}





@end
