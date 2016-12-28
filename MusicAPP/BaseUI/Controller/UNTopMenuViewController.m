//
//  UNTopMenuViewController.m
//  MusicAPP
//
//  Created by universe on 2016/11/22.
//  Copyright © 2016年 universe. All rights reserved.
//

#import "UNTopMenuViewController.h"
#import "UNMusicMenuViewController.h"

#import "UNDynamicStateCVController.h"

@interface UNTopMenuViewController ()

@end

@implementation UNTopMenuViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.showOnNavigationBar = YES;
        self.menuBGColor = [UIColor clearColor];
        self.menuViewLayoutMode = WMMenuViewLayoutModeCenter;
        self.titleColorSelected = [UIColor whiteColor];
        self.titleColorNormal = kRGBA_COLOR(255, 255, 255, 0.7);
        self.selectIndex = 2;
        
        self.titleSizeNormal = 18.0;
        
    }
    return self;
}

- (NSArray<NSString *> *)titles{

    return @[@"我的",@"音乐",@"动态"];
}

- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController{

    return self.titles.count;
}

- (NSString * _Nonnull)pageController:(WMPageController * _Nonnull)pageController titleAtIndex:(NSInteger)index{

    return self.titles[index];
}
- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index{

    UIViewController *vc = [UIViewController new];
    vc.view.backgroundColor = [UIColor greenColor];
    
    if (index == 1) {
        
        UNMusicMenuViewController *musicVC = [[UNMusicMenuViewController alloc] init];
        return musicVC;
        
    }
    
    if (index == 2) {
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.sectionInset = UIEdgeInsetsZero;
        layout.minimumLineSpacing = 10;
        layout.minimumInteritemSpacing = 10;
        CGFloat w = kScreenSize.width;
        CGFloat h = w + 100;
        
        layout.itemSize = CGSizeMake(w, h);
        
        UNDynamicStateCVController *dyVC = [[UNDynamicStateCVController alloc] initWithCollectionViewLayout:layout];
        
        return dyVC;
    }
    
    return vc;

}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupUI];
    
    
}

- (void)setupUI{
    [self setupNAVLeftItem];
    [self setupNAVRightItem];
    
}

- (void)setupNAVLeftItem{

    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0, 0, 44, 44);
    [leftBtn setImage:[UIImage imageNamed:@"bt_home_more_normal"] forState:UIControlStateNormal];
    [leftBtn setImage:[UIImage imageNamed:@"bt_home_more_press"] forState:UIControlStateHighlighted];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    
    UIBarButtonItem *leftMargin = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    leftMargin.width = -15;
    self.navigationItem.leftBarButtonItems = @[leftMargin,leftItem];
    
}

- (void)setupNAVRightItem{
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(0, 0, 44, 44);
   
    [rightBtn setImage:[UIImage imageNamed:@"bt_home_search1_normal"] forState:UIControlStateNormal];
    [rightBtn setImage:[UIImage imageNamed:@"bt_home_search1_press"] forState:UIControlStateHighlighted];
    
    UIBarButtonItem *rightitem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    
    UIBarButtonItem *rightMargin = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    rightMargin.width = -15;
    self.navigationItem.rightBarButtonItems = @[rightMargin,rightitem];
    
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
