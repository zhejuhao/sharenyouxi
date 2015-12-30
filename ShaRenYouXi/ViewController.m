//
//  ViewController.m
//  ShaRenYouXi
//
//  Created by 李旗 on 15/12/24.
//  Copyright © 2015年 李旗. All rights reserved.
//

#import "ViewController.h"
#import "SettingViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIImage *image = [UIImage imageNamed:@"langren"];
    UIImageView *image_view = [[UIImageView alloc]initWithImage:image];
    image_view.frame = self.view.frame;
    [self.view addSubview:image_view];
    [self set_button :@selector(button_pressed)];
    self.navigationController.navigationBarHidden = YES;
  
    
    
}
-(UIButton *)set_button :(SEL)button_pressed
{
    UIButton *star = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width/3, (self.view.frame.size.height/5)*3, self.view.frame.size.width/3, 50)];
    star.backgroundColor =  [UIColor colorWithRed:26/255.0 green:163/255.0 blue:163/255.0 alpha:1.0];
    
    [star setTitle:@"开始游戏" forState:UIControlStateNormal];
    star.titleLabel.textColor = [UIColor redColor];
    star.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    [self.view addSubview:star];
    star.layer.borderWidth = 0.1;
    star.layer.borderColor = [UIColor grayColor].CGColor;
    star.layer.cornerRadius = 10.0;
    [star addTarget:self action:button_pressed forControlEvents:UIControlEventTouchUpInside];
    return star;
}

-(void)button_pressed
{
    SettingViewController *setting = [[SettingViewController alloc]init];
    [self.navigationController pushViewController:setting animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
