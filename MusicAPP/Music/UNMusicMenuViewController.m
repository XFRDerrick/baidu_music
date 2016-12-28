//
//  UNMusicMenuViewController.m
//  MusicAPP
//
//  Created by universe on 2016/11/22.
//  Copyright © 2016年 universe. All rights reserved.
//

#import "UNMusicMenuViewController.h"

#import "UNListTableViewController.h"

#import "UNSongsListViewController.h"
#import "UNKSongCVController.h"
#import "UNRecommendCVController.h"

@interface UNMusicMenuViewController ()

@end

@implementation UNMusicMenuViewController


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.menuBGColor = [UIColor whiteColor];
        self.titleSizeNormal = 15;
        self.titleSizeSelected = 15;
        self.menuViewStyle = WMMenuViewStyleLine;
        self.titleColorSelected = kRGBA_COLOR(24, 190, 254, 1);
        self.progressHeight = 3;
        self.progressWidth = 36;
        self.selectIndex = 0;
    }
    return self;
}

- (NSArray<NSString *> *)titles{

    return @[@"推荐",@"歌单",@"榜单",@"K歌"];
}

- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController{

    return self.titles.count;
}

- (NSString * _Nonnull)pageController:(WMPageController * _Nonnull)pageController titleAtIndex:(NSInteger)index{
    return self.titles[index];
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index{

    UIViewController *vc = [UIViewController new];
    vc.view.backgroundColor = [UIColor whiteColor];
    
    if (index == 2) {
        UNListTableViewController *listVC = [[UNListTableViewController alloc] initWithStyle:UITableViewStylePlain];
        return listVC;
    }
    if (index == 1) {
        UNSongsListViewController *SonglistVC = [[UNSongsListViewController alloc] init];
        return SonglistVC;
    }
    if (index == 3) {
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        layout.itemSize = CGSizeMake(100, 100);
        
        UNKSongCVController *kvc = [[UNKSongCVController alloc] initWithCollectionViewLayout:layout];
        return kvc;
    }
    if (index == 0) {
        //预布局
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        layout.itemSize = CGSizeMake(100, 100);
        
        UNRecommendCVController *recommendVC = [[UNRecommendCVController alloc] initWithCollectionViewLayout:layout];
        return recommendVC;
    }
    
    return vc;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
