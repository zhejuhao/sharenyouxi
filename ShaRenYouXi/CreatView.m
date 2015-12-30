//
//  AlertView.m
//  ShaRenYouXi
//
//  Created by 李旗 on 15/12/28.
//  Copyright © 2015年 李旗. All rights reserved.
//

#import "CreatView.h"

@implementation CreatView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {

        [self creat_alert_view];
    }
    return self;
}

-(void)creat_alert_view
{

    alert_view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 300, 300)];
    alert_view.backgroundColor = [UIColor clearColor];
    alert_view.layer.cornerRadius = 17.0;
    UIView *key_window = [[UIApplication sharedApplication]keyWindow];
    alert_view.center = CGPointMake(CGRectGetMidX(key_window.frame), CGRectGetMidY(key_window.frame));
    self.imageview = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, alert_view.frame.size.width, 250)];

    [alert_view addSubview:self.imageview];
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(100,270, 100, 30)];
    [button setTitle:@"确认" forState:UIControlStateNormal];
    button.layer.cornerRadius = 10.0;
    button.backgroundColor = [UIColor colorWithRed:26/255.0 green:163/255.0 blue:163/255.0 alpha:1.0];
    [button addTarget:self action:@selector(pressed) forControlEvents:UIControlEventTouchUpInside];
    [alert_view addSubview:button];
    
    
    
    [self addSubview:alert_view];
}
-(void)pressed
{
    self.hidden = YES;
//    NSString *image_name = @"yikan";
}


@end
