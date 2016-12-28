//
//  UNListDetailViewController.m
//  MusicAPP
//
//  Created by universe on 2016/11/22.
//  Copyright © 2016年 universe. All rights reserved.
//

#import "UNListDetailViewController.h"

#import "UNListDetailTableViewCell.h"
#import "KingListTableViewCell.h"


#import "NormalListHeaderView.h"
#import "KingHeaderView.h"

#import "UNWebViewController.h"


@interface UNListDetailViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, assign,getter=isLoad) BOOL load;

//主视图
@property (nonatomic, strong) UIImageView *backGroundIV;
@property (nonatomic, strong) UITableView *tableView;

// 不同种类的headerView
@property (nonatomic, strong) NormalListHeaderView *headerView;
@property (nonatomic, strong) KingHeaderView *kingHeaderView;

//top位置子视图
@property (nonatomic, strong) UIButton *backButton;
@property (nonatomic, strong) UIView *topView;
@property (nonatomic, strong) UILabel *toplable;

//数据
@property (nonatomic, strong) UNListDetailModel *DataModel;

//T榜的视图
@property (nonatomic, strong) UIWebView *webView;


@end

@implementation UNListDetailViewController

#pragma mark 懒加载网页View
- (UIWebView *)webView{

    if (!_webView) {
        _webView = [[UIWebView alloc] init];
        [self.view addSubview:_webView];
        [_webView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsZero);
        }];
        _webView.allowsInlineMediaPlayback = YES;
        _webView.backgroundColor = [UIColor whiteColor];
    }
    return _webView;
}

- (BOOL)isLoad{

    if (!_load) {
        _load = NO;
    }
    return _load;
}

#pragma mark 懒加载topView
- (UIView *)topView{

    if (!_topView) {
        _topView = [UIView new];
        [self.view addSubview:_topView];
        _topView.backgroundColor = kRGBA_COLOR(88, 179, 252, 1);
        [_topView mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.left.top.right.equalTo(self.view);
            make.height.mas_equalTo(64);
        }];
        _topView.alpha = 0;
        
        self.toplable = [UILabel new];
        self.toplable.font = [UIFont systemFontOfSize:18];
        self.toplable.textColor = [UIColor whiteColor];
        [_topView addSubview:self.toplable];
        [self.toplable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(_topView);
            make.top.equalTo(self.topView).offset(30);
        }];
        self.toplable.text = self.listModel.name;
    }
    return _topView;
}
- (UIButton *)backButton{

    if (!_backButton) {
        _backButton = [UIButton new];
        [self.view addSubview:_backButton];
        [_backButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view).offset(30);
            make.left.equalTo(self.view).offset(15);
        }];
        [_backButton setBackgroundImage:[UIImage imageNamed:@"ic_recommend_back_normal"] forState:UIControlStateNormal];
        [_backButton setBackgroundImage:[UIImage imageNamed:@"ic_recommend_back_press"] forState:UIControlStateHighlighted];
        [_backButton addTarget:self action:@selector(backListVC:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _backButton;
}
- (void)backListVC:(UIButton *)sender{

    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark 懒加载 主子视图
- (NormalListHeaderView *)headerView{

    if (!_headerView) {
        _headerView = [[NormalListHeaderView alloc] initWithFrame:CGRectMake(0, 0, kSCREEN_SIZE.width, 300)];
        [_headerView.loadButton addTarget:self action:@selector(clickTopLoadButton:) forControlEvents:UIControlEventTouchUpInside];
        [_headerView.playButton addTarget:self action:@selector(clickTopPlayButton:) forControlEvents:UIControlEventTouchUpInside];
        _headerView.songsCountLb.text = [NSString stringWithFormat:@"%ld首歌",self.DataModel.song_list.count];//@"/99首歌";
        _headerView.headerLable.text =[NSString stringWithFormat:@"更新日期%@",self.DataModel.billboard.update_date]; //@"更新日期2016.11.23";
    }
    return _headerView;
    
}
- (KingHeaderView *)kingHeaderView{

    if (!_kingHeaderView) {
        _kingHeaderView = [KingHeaderView new];
        _kingHeaderView.frame = CGRectMake(0, 0, kSCREEN_SIZE.width, 300);
        //为属性赋值
        [_kingHeaderView.downLoadButton addTarget:self action:@selector(clickTopLoadButton:) forControlEvents:UIControlEventTouchUpInside];
        [_kingHeaderView.periodSelectButton addTarget:self action:@selector(clickPeriodSelectButton:) forControlEvents:UIControlEventTouchUpInside];
        [_kingHeaderView.ruleButton addTarget:self action:@selector(clickRuleButton:) forControlEvents:UIControlEventTouchUpInside];
        [_kingHeaderView.playButton addTarget:self action:@selector(clickTopPlayButton:) forControlEvents:UIControlEventTouchUpInside];
        _kingHeaderView.periodShowLable.text = [NSString stringWithFormat:@"%ld年第%ld期",self.DataModel.billboard.peroid / 100,self.DataModel.billboard.peroid % 100];//@"2016年第48期";
        _kingHeaderView.dateLable.text = [NSString stringWithFormat:@"%@-%@",self.DataModel.billboard.start_date,self.DataModel.billboard.end_date];//@"11.21-11.28";
        
    }
    return _kingHeaderView;
}


- (UIImageView *)backGroundIV{

    if (!_backGroundIV) {
        _backGroundIV = [UIImageView new];
        [self.view addSubview:_backGroundIV];
        
        [_backGroundIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.equalTo(self.view);
            make.height.equalTo(_backGroundIV.mas_width);
        }];

        if (self.headerType == UNViewHeaderKing) {
            _backGroundIV.image = [UIImage imageNamed:@"img_king_activity_bg"];
//            [_backGroundIV setImageURL:[NSURL URLWithString:self.DataModel.billboard.pic_s640]];
        }else{
            [_backGroundIV setImageURL:[NSURL URLWithString:self.DataModel.billboard.pic_s640]];
        }
        
    }
    return _backGroundIV;
}
- (UITableView *)tableView{

    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsZero);
        }];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor clearColor];
    }
    return _tableView;
}
#pragma mark 重写初始化方法
- (instancetype)initWithHeaderViewType:(HeaderType)headerType tableViewCellType:(TableCellType)cellType{

    if (self = [super init]) {
        self.headerType = headerType;
        self.cellType = cellType;
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    if (self.listModel.type == 500) {
        //只加载webView
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.listModel.web_url]];
        [self.webView loadRequest:request];
        
    }else{
        
        //加载数据 先下载后加载VIew
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            self.load = NO;

            [NetManager getChartsListDetailModelWithType:self.listModel.type CompletionHandler:^(UNListDetailModel *model, NSError *error) {
                NSLog(@"加载成功");
                if (!error) {
                    self.load = YES;
                    self.DataModel = model;
                    
                    //刷新UI
                    dispatch_async(dispatch_get_main_queue(), ^{
                        //加载UI
                        [self setupUI];
                        [self.tableView reloadData];
                        
                    });
                }
            }];
            
        });
        //有数据 无数据不执行
    }
    
    
}
//UI
- (void)setupUI{
    if (self.isLoad) {
        
        [self backGroundIV];
        self.tableView.rowHeight = 80;
        [self topView];
        [self backButton];
        
        //设置头部视图
        if (self.headerType == UNViewHeaderKing) {
            self.tableView.tableHeaderView = self.kingHeaderView;
        }else{
            self.tableView.tableHeaderView = self.headerView;
        }
    }
}

#pragma mark 设置导航栏
//隐藏导航栏
- (void)viewWillAppear:(BOOL)animated{
    if (self.listModel.type != 500){
        self.navigationController.navigationBarHidden = YES;
    }
}
//恢复
- (void)viewWillDisappear:(BOOL)animated{

    self.navigationController.navigationBarHidden = NO;
}

#pragma mark DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.DataModel.song_list.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (self.cellType == UNTableViewCellKing) {
        
        
        
        KingListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"kingCell"];
        if (cell == nil) {
            cell = [[NSBundle mainBundle] loadNibNamed:@"KingListTableViewCell" owner:nil options:nil].lastObject;
        }
        
        UNListSongListModel *model = self.DataModel.song_list[indexPath.row];
        cell.model = model;
        cell.indexPath = indexPath;
        return cell;
        
    }else{
        
        UNListDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"listDetailCell"];
        if (cell == nil) {
            cell = [[NSBundle mainBundle] loadNibNamed:@"UNListDetailTableViewCell" owner:nil options:nil].lastObject;
        }
        //赋值
        UNListSongListModel *model = self.DataModel.song_list[indexPath.row];
        cell.model = model;
        
        cell.indexPath = indexPath;
        
        return cell;
    
    }
    
}

#pragma mark 设置滚动效果
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{

    //向下拉动 偏移为负
    if (scrollView.contentOffset.y < - 110 ) {
        [self.backGroundIV mas_updateConstraints:^(MASConstraintMaker *make) {
           
            make.top.equalTo(self.view).offset(-110 - scrollView.contentOffset.y);
        }];
        return;
    }
 
    //向上移动 背景图与表格移动偏移量一致
    if (scrollView.contentOffset.y > 0) {
        [self.backGroundIV mas_updateConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self.view).offset(-scrollView.contentOffset.y);
        }];
        
    }
    //显示topView
    if (scrollView.contentOffset.y > 160) {
        
        [UIView animateWithDuration:0.5 animations:^{
           self.topView.alpha = 1;
        }];
        
    }
    //隐藏topView
    if (scrollView.contentOffset.y < 160) {
        [UIView animateWithDuration:0.5 animations:^{
            self.topView.alpha = 0;
        }];
 
    }
    
    
    if (scrollView.contentOffset.y < 0 && scrollView.contentOffset.y > -110) {
        
        [UIView animateWithDuration:0.5 animations:^{
            [self.backGroundIV mas_updateConstraints:^(MASConstraintMaker *make) {
                
                make.top.equalTo(self.view);
                
            }];
            self.topView.alpha = 0;
        }];

        return;
    }
}

#pragma mark 点击播放全部 下载按钮动作 
//下载 和播放事件 通用
- (void)clickTopPlayButton:(UIButton *)sender{
    
    NSLog(@"点击了播放全部按钮");
}
- (void)clickTopLoadButton:(UIButton *)sender{

    NSLog(@"点击了下载按钮");
}

//King类型 按钮事件
- (void)clickPeriodSelectButton:(UIButton *)sender{

    NSLog(@"点击了king 类型的期号选择按钮");
}

- (void)clickRuleButton:(UIButton *)sender{
    NSLog(@"点击了打榜规则按钮");

    UNWebViewController *webvc = [[UNWebViewController alloc] init];
    webvc.webString = self.DataModel.billboard.web_url;
    [self.navigationController pushViewController:webvc animated:YES];
    
}




@end
