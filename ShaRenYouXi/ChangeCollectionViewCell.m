//
//  ChangeCollectionViewCell.m
//  ShaRenYouXi
//
//  Created by 李旗 on 15/12/30.
//  Copyright © 2015年 李旗. All rights reserved.
//

#import "ChangeCollectionViewCell.h"

@implementation ChangeCollectionViewCell
-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        
        
        self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10,80 , 80)];
        self.imageView.backgroundColor = [UIColor grayColor];
        [self addSubview:self.imageView];
        
       
        
    }
    return  self;
}


@end
