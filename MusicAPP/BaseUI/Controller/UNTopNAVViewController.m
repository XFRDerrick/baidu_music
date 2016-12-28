//
//  UNTopNAVViewController.m
//  day16_UNAPPMusic
//
//  Created by universe on 2016/11/22.
//  Copyright © 2016年 universe. All rights reserved.
//

#import "UNTopNAVViewController.h"

#import "UNTopMenuViewController.h"

@interface UNTopNAVViewController ()

@end

@implementation UNTopNAVViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UNTopMenuViewController *topMenu = [UNTopMenuViewController new];
    self.viewControllers = @[topMenu];
    
    //设置导航的背景图
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"themeDefault"] forBarMetrics:UIBarMetricsDefault];
    
    
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
