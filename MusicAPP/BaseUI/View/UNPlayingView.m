//
//  UNPlayingView.m
//  MusicAPP
//
//  Created by universe on 2016/12/23.
//  Copyright © 2016年 universe. All rights reserved.
//

#import "UNPlayingView.h"

#import "UNPlayingListViewController.h"

@interface UNPlayingView ()


@property (weak, nonatomic) IBOutlet UIImageView *backGroundImageIV;
@property (nonatomic, assign) CGFloat beginY;
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UIView *bottomView;

@property (weak, nonatomic) IBOutlet UIScrollView *mediaScrollView;


@end

@implementation UNPlayingView


- (void)awakeFromNib{
    
    [super awakeFromNib];
    
    [self setupBlurEffect];
    [self setupMediaScrollView];
    
}

- (void)setupMediaScrollView{

    CGSize size = self.bounds.size;
    
    UNPlayingListViewController *musicVC = [[UNPlayingListViewController alloc] initWithStyle:UITableViewStylePlain withViewTypes:ViewTypesMusics];
     [[self viewController] addChildViewController:musicVC];
    musicVC.view.frame = CGRectMake(0, 0, kScreenSize.width, size.height);
    [self.mediaScrollView addSubview:musicVC.view];
    
    UIView *view= [[UIView alloc] init];
    view.backgroundColor = [UIColor redColor];
    view.frame = CGRectMake(kScreenSize.width, 0,kScreenSize.width , size.height);
    [self.mediaScrollView addSubview:view];
    
    
    UNPlayingListViewController *lyricVC = [[UNPlayingListViewController alloc] initWithStyle:UITableViewStylePlain withViewTypes:ViewTypesLyrics];
    lyricVC.view.frame = CGRectMake(2 * kScreenSize.width, 0, kScreenSize.width, size.height);
   
    [[self viewController] addChildViewController:lyricVC];
    [self.mediaScrollView addSubview:lyricVC.view];
    
    
    self.mediaScrollView.contentSize = CGSizeMake(kScreenSize.width * 3, 0);
    
    self.mediaScrollView.pagingEnabled = YES;
    
}

- (UIViewController*)viewController {
    for (UIView* next = [self superview];next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}

- (void)setupBlurEffect{
    
    CGRect frameTop = CGRectMake(0, 0, kScreenSize.width, 60);
    
    CGRect frameBottom = CGRectMake(0, kScreenSize.height - 220, kScreenSize.width, 220);
    
    [self addBlurEffectWithFrame:frameTop onView:self.backGroundImageIV];
    [self addBlurEffectWithFrame:frameBottom onView:self.backGroundImageIV];

}

- (void)addBlurEffectWithFrame:(CGRect)frame onView:(UIImageView *)imageView{
    
    UIBlurEffect *eff = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *ve = [[UIVisualEffectView alloc] initWithEffect:eff];
    
    ve.frame = frame;
    [imageView addSubview:ve];
    
}



- (IBAction)dismissViewAction:(UIButton *)sender {
    
    [self dismiss];
}



- (void)show{

    [UIView animateWithDuration:0.5 animations:^{
        self.top = 0;
    }];
}

- (void)dismiss{

    [UIView animateWithDuration:0.5 animations:^{
        self.top = kScreenSize.height;
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.superview];
    self.beginY = point.y;
    
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.superview];
    float offset = point.y - self.beginY;
    self.mj_y += offset;
    
    self.beginY = point.y;
    
    if (self.top <= 0) {
        self.top = 0;
    }
}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    if (self.top < 200) {
        [self show];
    }else{
    
        [self dismiss];
    }
    
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
