//
//  UNPlayingListViewController.h
//  MusicAPP
//
//  Created by universe on 2016/12/23.
//  Copyright © 2016年 universe. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    
    ViewTypesMusics,
    ViewTypesLyrics,
    
}ViewTypes;


@interface UNPlayingListViewController : UITableViewController

- (instancetype)initWithStyle:(UITableViewStyle)style withViewTypes:(ViewTypes)type;

@end
