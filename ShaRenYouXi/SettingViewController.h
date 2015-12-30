//
//  SettingViewController.h
//  ShaRenYouXi
//
//  Created by 李旗 on 15/12/24.
//  Copyright © 2015年 李旗. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Random.h"
#import "CreatView.h"
@interface SettingViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate>
{
    NSArray *arr_kill_game;
    UICollectionView *collection;
    NSString *total_number;
    NSString *killer_number;
    NSString *police_number;
    NSString *civilian_number;
    NSMutableArray *count;
    NSArray  *random_arr;
    NSMutableArray *init_image;
    NSMutableArray *image_arr;
    NSMutableDictionary *image_dic;
    NSString *row_str;
    CreatView *alert_view;
    int row_int;
}

@end
