//
//  SettingTabelViewCell.h
//  ShaRenYouXi
//
//  Created by 李旗 on 15/12/24.
//  Copyright © 2015年 李旗. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingTabelViewCell : UITableViewCell<UITextFieldDelegate>

@property(nonatomic , retain)UITextField *text_field;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
@end
