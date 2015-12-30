//
//  SettingTabelViewCell.m
//  ShaRenYouXi
//
//  Created by 李旗 on 15/12/24.
//  Copyright © 2015年 李旗. All rights reserved.
//

#import "SettingTabelViewCell.h"

@implementation SettingTabelViewCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        self.text_field = [[UITextField alloc]initWithFrame:CGRectMake(200, 8, 50, 30)];
       
        self.text_field.backgroundColor = [UIColor clearColor]; //text_field背景颜色
        self.text_field.borderStyle = UITextBorderStyleRoundedRect; //text_field边框为圆角
        self.text_field.clearsOnBeginEditing = YES; //text_field在开始编辑时清空
        self.text_field.keyboardType = UIKeyboardTypeNumberPad ; //text_field键盘为数字键盘
        self.text_field.delegate = self; //text_field需要实现代理
        self.text_field.layer.borderColor = [[UIColor colorWithRed:26/255.0 green:163/255.0 blue:163/255.0 alpha:1.0]CGColor]; //text_field边框的颜色
        self.text_field.textColor = [UIColor whiteColor];
        self.text_field.layer.borderWidth = 1.0; //text_field边框的宽度
        self.text_field.layer.cornerRadius = 5.0; //text_field边框圆角的半径
        [self addSubview:self.text_field];
        
        
       
        
        
      
        
        
    }
    return self;
}
@end
