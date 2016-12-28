//
//  UNMainViewController.m
//  day16_UNAPPMusic
//
//  Created by universe on 2016/11/22.
//  Copyright © 2016年 universe. All rights reserved.
//

#import "UNMainViewController.h"
#import "UNTopNAVViewController.h"
#import "UNTopMenuViewController.h"

#import "MainBottomVIew.h"

#import "UNPlayingView.h"
#import "UNPlayingListViewController.h"


@interface UNMainViewController ()

@property (nonatomic, strong) UNTopNAVViewController *topNAV;

@property (nonatomic, strong) MainBottomVIew *bottomView;

@property (nonatomic, strong) UNPlayingView *playingView;

@end

@implementation UNMainViewController

#pragma mark 懒加载

- (UNTopNAVViewController *)topNAV{

    if (!_topNAV) {
        _topNAV = [UNTopNAVViewController new];
        [self addChildViewController:_topNAV];
        [self.view addSubview:_topNAV.view];
        [_topNAV.view mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.left.right.top.equalTo(self.view);
            make.bottom.equalTo(self.view).offset(-44);
        }];
    }
    return _topNAV;
}
- (MainBottomVIew *)bottomView{

    if (!_bottomView) {
        _bottomView = [MainBottomVIew new];
        [self.view addSubview:_bottomView];
        
        [_bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(self.view);
            make.height.mas_equalTo(44);
        }];
        _bottomView.backgroundColor = [UIColor whiteColor];
        _bottomView.iconIV.image = [UIImage imageNamed:@"mengjia"];
        _bottomView.musicName.text = @"I Love You";
        _bottomView.singer.text = @"孟佳";
        //
        [_bottomView.coverButton addTarget:self action:@selector(clickBottomView:) forControlEvents:UIControlEventTouchUpInside];
        
        [_bottomView.musicListButton addTarget:self action:@selector(clickMusicListButton:) forControlEvents:UIControlEventTouchUpInside];
        [_bottomView.nextButton addTarget:self action:@selector(clickNextMusicButton:) forControlEvents:UIControlEventTouchUpInside];
        [_bottomView.playPauseButton addTarget:self action:@selector(clickPlayOrPauseButton:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _bottomView;
}

- (UNPlayingView *)playingView{

    if (!_playingView) {
        
        _playingView = [[NSBundle mainBundle] loadNibNamed:@"UNPlayingView" owner:self options:nil].lastObject;
        [self.view addSubview:_playingView];
        _playingView.frame = CGRectMake(0, kScreenSize.height, kScreenSize.width, kScreenSize.height);
//        _playingView.top = kScreenSize.height;
    }
    return _playingView;
}

- (void)clickBottomView:(UIButton *)sender{
    NSLog(@"点击了底部视图，显示新的界面");
    
    [self.playingView show];
    
}


- (void)clickPlayOrPauseButton:(UIButton *)sender{
    
    sender.selected = !sender.selected;
    
}
- (void)clickNextMusicButton:(UIButton *)sender{
    NSLog(@"播放下一首歌曲");
    
    UNPlayingListViewController *vc = [[UNPlayingListViewController alloc] initWithStyle:UITableViewStylePlain withViewTypes:ViewTypesMusics];
    
    [self presentViewController:vc animated:YES completion:nil];
    
}
- (void)clickMusicListButton:(UIButton *)sender{

    NSLog(@"显示列表");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self topNAV];
    [self bottomView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle{

    return UIStatusBarStyleLightContent;
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
