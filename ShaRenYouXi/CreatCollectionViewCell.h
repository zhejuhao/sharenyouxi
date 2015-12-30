//
//  CollectionViewCell.h
//  ShaRenYouXi
//
//  Created by 李旗 on 15/12/24.
//  Copyright © 2015年 李旗. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreatCollectionViewCell : UICollectionViewCell
@property (nonatomic , retain)UIImageView *imageView;
@property (nonatomic , retain)UILabel *textlabel;
@property (nonatomic , retain)UIImageView *top_image_view;
//-(id)init :(SEL)button_pressed;
-(id)initWithFrame:(CGRect)frame;
@end
