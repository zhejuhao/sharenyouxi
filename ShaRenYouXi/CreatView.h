//
//  AlertView.h
//  ShaRenYouXi
//
//  Created by 李旗 on 15/12/28.
//  Copyright © 2015年 李旗. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreatView : UIView
{
    UIView *alert_view;
    int random;
}
//-(id)initWithFrame:(CGRect)frame :(UIImageView *)image_view;
-(id)initWithFrame:(CGRect)frame;
@property UIImageView *imageview;
@end
