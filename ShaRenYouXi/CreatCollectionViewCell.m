//
//  CollectionViewCell.m
//  ShaRenYouXi
//
//  Created by 李旗 on 15/12/24.
//  Copyright © 2015年 李旗. All rights reserved.
//

#import "CreatCollectionViewCell.h"

@implementation CreatCollectionViewCell
//-(id)init :(SEL)button_pressed
-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {


        self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10,80 , 80)];
        self.imageView.backgroundColor = [UIColor grayColor];
        [self addSubview:self.imageView];
        
        self.textlabel = [self creat_label:CGRectMake(10, 10, 80, 80)];
        self.textlabel.font = [UIFont boldSystemFontOfSize:18];
        
        self.top_image_view = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 80, 80)];
//        self.top_image_view.image = [UIImage imageNamed:@"pai"];
        [self addSubview:self.top_image_view];
        
    }
    return  self;
}
-(UILabel *)creat_label :(CGRect)frame
{
    UILabel *label = [[UILabel alloc]initWithFrame:frame];
    label.textColor = [UIColor blackColor];
    label.backgroundColor = [UIColor blueColor];
    label.font = [UIFont boldSystemFontOfSize:14];
    [self addSubview:label];
    return label;
}
-(UIButton *)set_button :(SEL)button_pressed
{
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(10, 10, 80, 70)];
    button.backgroundColor =  [UIColor colorWithRed:26/255.0 green:163/255.0 blue:163/255.0 alpha:1.0];
    
    [button setTitle:@"查看" forState:UIControlStateNormal];
    button.titleLabel.textColor = [UIColor redColor];
    button.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    
    button.layer.borderWidth = 0.1;
    button.layer.borderColor = [UIColor grayColor].CGColor;
    button.layer.cornerRadius = 10.0;
    [button addTarget:self action:button_pressed forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
    return button;
}
//-(void)notification_imgage:(NSNotification *)image_notification
//{
//     self.top_image_view.image = [UIImage imageNamed:image_notification.object];
//}

@end
