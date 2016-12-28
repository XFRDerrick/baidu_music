//
//  UNWebViewController.m
//  MusicAPP
//
//  Created by universe on 2016/11/29.
//  Copyright © 2016年 universe. All rights reserved.
//

#import "UNWebViewController.h"

@interface UNWebViewController ()

@property (nonatomic, strong) UIWebView *webView;

@end

@implementation UNWebViewController

- (UIWebView *)webView{

    if (!_webView) {
        
        _webView = [[UIWebView alloc] init];
        [self.view addSubview:_webView];
        [_webView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsZero);
        }];
    }
    return _webView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.webString]];
    [self.webView loadRequest:request];
    
   
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
